import 'package:flutter/material.dart';

class ExpansionPanelExample extends StatefulWidget {
  @override
  _ExpansionPanelExampleState createState() => _ExpansionPanelExampleState();
}

class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
  List<bool> expansionPanelExpanded = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Panel Example"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  expansionPanelExpanded[index] = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Item 1'),
                    );
                  },
                  body: ListTile(title: Text('Item 1 child')),
                  isExpanded: expansionPanelExpanded[0],
                  canTapOnHeader: true,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Item 2'),
                    );
                  },
                  body: ListTile(title: Text('Item 2 child')),
                  canTapOnHeader: true,
                  isExpanded: expansionPanelExpanded[1],
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                for (var i = 0; i < expansionPanelExpanded.length; i++) {
                  expansionPanelExpanded[i] = false;
                }
                setState(() {});
              },
              child: Text(
                "Collapse all",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
