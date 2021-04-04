import 'package:flutter/material.dart';

void main()=>runApp(ShowUserPage());

class ShowUserPage extends StatefulWidget {
  @override
  _ShowUserPageState createState() => _ShowUserPageState();
}

class _ShowUserPageState extends State<ShowUserPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("ย้อนกลับ"),
          ),
        ),
        appBar: AppBar(
          title: Text("Show user"),
        ),

      ),
    );

  }
}



