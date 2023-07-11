import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shayari/Data.dart';
import 'package:shayari/forth.dart';

class third extends StatefulWidget {
  List a;
  int index;
  third(this.index,this.a);
  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List<Color> co=[Colors.pink,Colors.pink];
  List<Color> coo=[Colors.pink,Colors.pink];
  int? R;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    }
    random() {
      do {
        R = Random().nextInt(4);
      } while (R == 0 || R == 1);
      coo = d.co;
      coo.shuffle();
      coo = coo.sublist(0, R);
      return coo;
  }
  @override
  Widget build(BuildContext context) {
    double size=(MediaQuery.of(context).size.height)-(MediaQuery.of(context).padding.top)-(kToolbarHeight)-10;
    List<Color> gradi=random();
    return Scaffold(
      appBar: AppBar(title: Text("${d.title[widget.index]}")),
      body: Column(
        children: [
          Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context, builder: (context) {
                    return Container(
                      height: size,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                          itemCount: d.co.length-1,
                          itemBuilder:
                          (context, index) {
                          return InkWell(onTap: () {
                            co=[d.co[index],d.co[index+1]];
                            Navigator.pop(context);
                            setState(() {});
                          },child: Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(gradient: LinearGradient(colors: [d.co[index],d.co[index+1]])),));
                        },
                      ),
                    );
                  },);
              }, icon: Icon(Icons.color_lens,size: 50,)),
              Text("${widget.index+1} / ${widget.a.length}",style: TextStyle(fontSize: 36)),
              InkWell(onTap: () {
                co=gradi;
                gradi=random();
                setState(() {});
              },child: Container(padding: EdgeInsets.all(20),height: 40,width: 40,decoration: BoxDecoration(gradient: LinearGradient(colors: gradi)),
                child: PageView.builder(
                  itemCount: widget.a.length,
                  onPageChanged: (value) {
                    widget.index=value;
                  },
                  controller: PageController(
                      initialPage: widget.index),
                  itemBuilder: (context, index) {
                  return Text("${widget.a[index]}");
                },),)),
            ],)),
          Expanded(flex: 3,child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: co)),child: Center(child: Text("${widget.a[widget.index]}",style: TextStyle(fontSize: 36),)),)),
          SizedBox(height: 50),
          Expanded(child: Container(color: Colors.brown,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              IconButton(onPressed: () {
                // var value = ClipboardData(text: "${widget.a[widget.index]}");
                // Clipboard.setData(value);
                FlutterClipboard.copy("${widget.a[widget.index]}");
              }, icon: Icon(Icons.copy,size: 50),),
              IconButton(onPressed:
                  () {
                    (widget.index>0) ? widget.index-- : widget.index;
                    setState(() {});
              }, icon: Icon(Icons.arrow_back_ios,size: 50),),
              IconButton(onPressed:
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return forth(widget.a,widget.index);
                    },));
              }, icon: Icon(Icons.edit,size: 50),),
              IconButton(onPressed:
                  () {
                    (widget.index+1<widget.a.length) ? widget.index++ : widget.index;
                    setState(() {});
              }, icon: Icon(Icons.arrow_forward_ios,size: 50),),
              IconButton(onPressed:
                  () {

              }, icon: Icon(Icons.share,size: 50),),
            ]),
          )),
        ],
      ),
    );
  }
}
