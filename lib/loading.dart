import 'package:flutter/material.dart';

void main()=>runApp(LoadingPage());

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  Future<String> delayTime() async {
    String txt = await Future.delayed(Duration(seconds: 10),(){
      return 'Hello';
    });
    return txt;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: delayTime(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                //ใส่หน้าจอ
                return Center(
                    child: Column(
                      children: [
                        Image.network('https://fbi.dek-d.com/27/0574/3942/123812548',height: 300),
                      Text('สงกรานต์ ขาวประเสริฐ')]
              ),
                );

              } else if (snapshot.hasError) {
                return Text('Error !!');
              } else {
                return LinearProgressIndicator();}
            },
          ),
        ),
      ),
    );
  }
}
