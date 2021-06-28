import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      // color: Colors.w,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var output = "";
  List<dynamic> lst = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Todo App",
          // style: TextStyle(backgroundColor: ),
        ),
      ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.only(top: 10),
            child: ListTile(
                title: Text("${lst[index]}"),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.remove(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Item"),
                                  content: TextField(
                                    onChanged: (value) {
                                      output = value;
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          lst.replaceRange(
                                              index, index + 1, {output});
                                        });
                                      },
                                      child: Text("Edit"),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          lst.add(output);
                        });
                      },
                      child: Text("Add"),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      // backgroundColor: Colors.grey,
    );
  }
}
