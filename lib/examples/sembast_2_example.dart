import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Sembast2Example extends StatefulWidget {
  @override
  _Sembast2ExampleState createState() => _Sembast2ExampleState();
}

class _Sembast2ExampleState extends State<Sembast2Example> {
  //Database variable
  var _db;
  //Store
  final store = intMapStoreFactory.store('my_store');

  StreamSubscription subscription;

  Stream<List<dynamic>> dataStream;

  List<Widget> listOfNames = [];
  List otherList = [];

  //Open the database
  Future<void> openDB() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'StudentsDB.db');
    _db = await databaseFactoryIo.openDatabase(dbPath);
    setListener(_db);
    dataStream = setStream(_db);
  }

  //set a listener of the database
  void setListener(Database database) {
    //finder ordering by the key
    var finder = Finder(sortOrders: [SortOrder('key', true)]);
    //creating the query
    var query = store.query(finder: finder);

    if (subscription == null) {
      subscription = query.onSnapshots(database).listen((snapshots) {
        List _provisionalList =
            snapshots.map((e) => e.value["name"] ?? "Que ladilla").toList();
        setState(() {
          otherList = _provisionalList;
        });
      });
    }
  }

  setStream(Database database) {
    //finder ordering by the key
    var finder = Finder(sortOrders: [SortOrder('key', true)]);
    //creating the query
    var query = store.query(finder: finder);

    return query.onSnapshots(database);
  }

  //Write data in the database
  Future<void> addData() async {
    //add data using the map
    var key = await store.add(_db, {'name': 'Jorge'});

    //add data using a transaction
    await _db.transaction((txn) async {
      await store.add(txn, {'name': 'Jorge Augusto'});
      await store.add(txn, {'name': 'Jorge Augusto Peroza Molina'});
    });

    //add data using map def
    var myMap = Map<String, dynamic>();
    myMap["name"] = "JAPM";
    myMap["edad"] = "39";
    myMap["country"] = "Venezuela";
    await store.add(_db, myMap);

    //getting a example record by the key
    var record = await store.record(key).getSnapshot(_db);
    print(record);
  }

  //read all the data in the database
  Future<void> readData() async {
    final recordSnapshot = await store.find(_db);
    recordSnapshot.forEach(print);
  }

  //update specific data
  Future<void> updateData() async {
    // update the price of the lamp record
    await store.record(1).put(_db, {'id': '3', 'name': 'JAPM'});
    await store.record(3).put(_db, {'name': 'JAPM'});
    await store.record(3).update(_db, {'name': 'Jorge', 'apellido': 'Peroza'});
  }

  //delete specific data
  Future<void> deleteData() async {
    var filter = Filter.matches("id", "3");
    var finder = Finder(filter: filter);
    await store.delete(_db, finder: finder);
  }

  //delete all data
  Future<void> deleteAll() async {
    await store.delete(_db);
  }

  //read and sort the data
  Future<void> readAndSort() async {
    var finder = Finder(sortOrders: [SortOrder('name', true)]);
    var records = await store.find(_db, finder: finder);
    records.forEach((element) {
      print(element);
    });
  }

  Future<void> readOneField() async {
    final recordSnapshot = await store.find(_db);

    List<Widget> temporal = recordSnapshot.map((e) {
      var value;

      if (e.value["name"] != null) {
        value = e.value["name"];
      } else
        value = "not value";

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(value)),
      );
    }).toList();

    setState(() {
      listOfNames = temporal;
    });
  }

  @override
  void initState() {
    super.initState();
    openDB();
  }

  //Cancel the subscription
  @override
  void dispose() {
    super.dispose();
    if (subscription != null) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sembast 2 Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        //How to change default text style
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 18.0, color: Colors.pink),
          child: Theme(
            data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.accent,
                colorScheme: Theme.of(context)
                    .colorScheme
                    .copyWith(secondary: Colors.white),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    child: Center(
                        child: Text("Different options in the database"))),
                RaisedButton(
                    child: Text("Write Data"), onPressed: () => addData()),
                RaisedButton(
                    child: Text("Read all Data"), onPressed: () => readData()),
                RaisedButton(
                    child: Text("Update Data"), onPressed: () => updateData()),
                RaisedButton(
                    child: Text("Delete Data"), onPressed: () => deleteData()),
                RaisedButton(
                    child: Text("Delete all"), onPressed: () => deleteAll()),
                RaisedButton(
                  child: Text("Sort and read"),
                  onPressed: () {
                    readAndSort();
                  },
                ),
                RaisedButton(
                    child: Text("Read one field"),
                    onPressed: () => readOneField()),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.grey,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: otherList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(otherList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: listOfNames.length != 0
                          ? listOfNames
                          : List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Center(
                                  child: Text("JAPM"),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: dataStream,
                  builder: (_, snapshot) {
                    print(snapshot.connectionState.toString());
                    if (snapshot.connectionState == ConnectionState.active) {
                      List<dynamic> l = snapshot.data;
                      return Expanded(
                        child: Container(
                          color: Colors.amber,
                          margin: EdgeInsets.all(16.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: l.length,
                              itemBuilder: (_, item) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(l[item]["name"])),
                                );
                              }),
                        ),
                      );
                    } else {
                      return Container(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text("Boundary"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
