import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String _selectedItem = '';

   _onPressedButton() {
    if (Platform.isIOS) {
    return showModalBottomSheet(
      context: context, 
      builder: (context) {
        return Column(
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.bell),
              title: Text('IOS'),
              onTap: () => _selectItem('IOS'),
            ),
          ],
        );
      }
      );
     }

   return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 180,
          color: Color(0xFF737373),
            child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              )
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.android),
                  title: Text('Android'),
                  onTap: () => _selectItem('Android'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('show'),
              onPressed: () => _onPressedButton(),
            ),
            Text(
              _selectedItem,
              style: TextStyle(fontSize: 29),
            ),
          ],
        )
        )
    );
  }
}
