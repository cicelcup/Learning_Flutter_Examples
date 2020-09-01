import 'package:english_words/english_words.dart' as english_words;
import 'package:flutter/material.dart';
import 'package:learningflutterexamples/examples/sembast/todo_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastExample extends StatefulWidget {
  const SembastExample({Key key}) : super(key: key);

  @override
  _SembastExampleState createState() => _SembastExampleState();
}

class _SembastExampleState extends State<SembastExample> {
  //Database Name
  static const kDbFileName = 'sembast_ex.db';
  //Store Name
  static const kDbStoreName = 'example_store';

  Future<bool> _initDbFuture;
  Database _db;
  StoreRef<int, Map<String, dynamic>> _store;
  //List of To do items
  List<TodoItem> _todos = [];

  @override
  void initState() {
    super.initState();
    _initDbFuture = _initDb();
  }

  // Opens a db local file. Creates the db table if it's not yet created.
  Future<bool> _initDb() async {
    final dbFolder = await path_provider.getApplicationDocumentsDirectory();
    final dbPath = join(dbFolder.path, kDbFileName);
    _db = await databaseFactoryIo.openDatabase(dbPath);
    print('Db created at $dbPath');
    _store = intMapStoreFactory.store(kDbStoreName);
    await _getTodoItems();
    return true;
  }

  // Retrieves records from the db store.
  Future<void> _getTodoItems() async {
    final finder = Finder();
    final recordSnapshots = await _store.find(_db, finder: finder);
    _todos = recordSnapshots
        .map((snapshot) => TodoItem.fromJsonMap({
              ...snapshot.value,
              'id': snapshot.key,
            }))
        .toList();
  }

  // Inserts records to the db store.
  // Note we don't need to explicitly set the primary key (id), it'll auto
  // increment.
  Future<void> _addTodoItem(TodoItem todo) async {
    var id = await _store.add(_db, todo.toJsonMap());
    print('Inserted todo item with id=$id.');
  }

  // Updates records in the db table.
  Future<void> _toggleTodoItem(TodoItem todo) async {
    todo.isDone = !todo.isDone;
    var count = await _store.update(
      _db,
      todo.toJsonMap(),
      finder: Finder(filter: Filter.byKey(todo.id)),
    );
    print('Updated $count records in db.');
  }

  // Deletes records in the db table.
  Future<void> _deleteTodoItem(TodoItem todo) async {
    var count = await _store.delete(
      _db,
      finder: Finder(filter: Filter.byKey(todo.id)),
    );
    print('Updated $count records in db.');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initDbFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Sembast Example'),
          ),
          body: ListView(
            children: _todos.map(_itemToListTile).toList(),
          ),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }

  //update the item list and update the ui with the set state call
  Future<void> _updateUI() async {
    await _getTodoItems();
    setState(() {});
  }

  ListTile _itemToListTile(TodoItem todo) {
    return ListTile(
      title: Text(
        todo.content,
        style: TextStyle(
            fontStyle: todo.isDone ? FontStyle.italic : null,
            color: todo.isDone ? Colors.grey : null,
            decoration: todo.isDone ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text('id=${todo.id}\ncreated at ${todo.createdAt}'),
      isThreeLine: true,
      leading: IconButton(
        icon:
            Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
        onPressed: () async {
          await _toggleTodoItem(todo);
          await _updateUI();
        },
      ),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
            await _deleteTodoItem(todo);
            await _updateUI();
          }),
    );
  }

  //Add the words to the list
  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await _addTodoItem(
          TodoItem(
            content: english_words.generateWordPairs().first.asPascalCase,
            createdAt: DateTime.now(),
          ),
        );
        await _updateUI();
      },
    );
  }
}
