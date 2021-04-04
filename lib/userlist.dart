import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_app/showuser.dart';
import 'user.dart';
import 'package:http/http.dart' as http;

void main()=> runApp(UserListPage());

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> myData;
  bool display=false;
  @override
  initState(){
    getUsers();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: ListView(
          children: <Widget>[showBottom(), showList(),
          ],
        ),
      ),
    );
  }
  Widget showBottom(){
    return RaisedButton(
        onPressed: (){
          setState(()=>display =true);
        } ,
        child: Text("แสดงรายการ"),
    );
  }

  Widget showList(){
    return Column(
      children: myData.map(
              (user) => Builder(
                builder: (context)=>Card(
                  child: ListTile(
                    title: Text(user.first_name + "  " + user.last_name),
                    leading: Image.network(user.avatar),
                    subtitle: Text(user.email),
                    onTap: (){
                      //push ShowUserPage
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>ShowUserPage())
                      );
                    },
                  ),
                ),
              )
      ).toList(),
    );
  }
  Future<void> getUsers() async{
    myData = [];
    String url="https://reqres.in/api/users?page=2";
    var response = await http.get(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'}
      );
    var res=jsonDecode(response.body);
    for (var u in res['data']){
      myData.add(User.fromjson(u));
    }
  }
}
