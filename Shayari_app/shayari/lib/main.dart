import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/second.dart';
import 'package:shayari/Data.dart';


void main()
{
  runApp(MaterialApp(home: Home(),debugShowCheckedModeBanner: false,));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shayari"),),
      body: ListView.builder(
        itemCount: d.title.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return second(index);
            },));
          },
            leading: InkWell(onTap:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return photo(index);
              },));
            },child: Image.asset("${d.main_image[index]}")),
            title: Text("${d.title[index]}"),
          ),
        );
      },),
    );
  }
}

class photo extends StatelessWidget {
  int i;
  photo(this.i);

  @override
  Widget build(BuildContext context) {
    return Image.asset(d.main_image[i],fit: BoxFit.fill,);
  }
}

