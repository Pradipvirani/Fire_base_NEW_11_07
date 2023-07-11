import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/Data.dart';
import 'Third.dart';

class second extends StatefulWidget {
  int index;
  second(this.index);
  @override
  State<second> createState() => _secondState();
}
class _secondState extends State<second> {
  @override
  List shayari=[];
  void initState() {
    // TODO: implement initState
    super.initState();
  shayari=d.s[widget.index];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${d.title[widget.index]}"),),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:
              (context) {
                return third(index,shayari);
              },));
            },
              tileColor: Colors.pink,
              title: Text("${shayari[index]}"),
            );
          },
          separatorBuilder: (context, index) {
            return Container(width: double.infinity,height: 10,);
          },
          itemCount: shayari.length),
    );
  }
}
