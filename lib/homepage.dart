import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class ListItem {
  bool _value = false;
  String task;
  ListItem(String task) {
    this.task = task;
  }
}

class _homepageState extends State<homepage> {
  List<ListItem> tasks = List();

  @override
  Widget build(BuildContext context) {
    TextEditingController tcontrol = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo-App"),
      ),
      body: tasks.length == 0
          ? Center(
              child: Text("No Task to show"),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Checkbox(
                            value: tasks[index]._value,
                            onChanged: (bool value) {
                              setState(() {
                                tasks[index]._value = value;
                              });
                            },
                          ),
                          new Expanded(child: Text(tasks[index].task)),
                        ],
                      ),
                      trailing: IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [Text("Are you sure?")],
                                    ),
                                    actions: [
                                      RaisedButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.green,
                                      ),
                                      RaisedButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          setState(() {
                                            tasks.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.red,
                                      ),
                                    ],
                                  );
                                });
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: tcontrol,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      RaisedButton(
                        child: Text("Add Task"),
                        onPressed: () {
                          setState(() {
                            tasks.add(new ListItem(tcontrol.text));
                          });
                          Navigator.of(context).pop();
                        },
                        color: Colors.green,
                      ),
                      RaisedButton(
                        child: Text("Close"),
                        onPressed: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        color: Colors.blue,
                      )
                    ],
                  );
                });
          }),
    );
  }

  Checkbox newMethod() => Checkbox(
        onChanged: (bool value) {},
        value: null,
      );
}
