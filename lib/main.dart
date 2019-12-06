import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('My First App'),
          ),
        ),
        body: _MyList());
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return ListTile(
          title: Text('Some Random Username'),
          subtitle: Text(
            'Online',
            style: TextStyle(
                fontStyle: FontStyle.italic, color: Colors.green),
          ),
          leading: const Icon(Icons.face),
          trailing: RaisedButton(
            child: Text('Remove'),
            onPressed: () {
              deleteDialog(context).then((value) {
                print('Value is $value');
              });
            },
          ),
        );
      },
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you Sure ?'),
          actions: <Widget>[
             FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
             FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      });
}