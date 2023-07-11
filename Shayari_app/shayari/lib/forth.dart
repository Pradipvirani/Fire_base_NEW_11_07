import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shayari/Data.dart';

class forth extends StatefulWidget {
  List a;
  int index;

  forth(this.a, this.index);

  @override
  State<forth> createState() => _forthState();
}

List<Color> co = [Colors.pink, Colors.pink];
String emo = "";
Color tco = Colors.black;
List<Color> coo = [Colors.pink, Colors.pink];
int? R;

random() {
  do {
    R = Random().nextInt(4);
  } while (R == 0 || R == 1);
  coo = d.co;
  coo.shuffle();
  coo = coo.sublist(0, R);
  return coo;
}

class _forthState extends State<forth> {
  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.height) -
        (MediaQuery.of(context).padding.top) -
        (kToolbarHeight) -
        10;
    List<Color> gradi = random();
    return Scaffold(
      appBar: AppBar(title: Text("${d.title[widget.index]}")),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: co)),
            width: double.infinity,
            height: size - 300,
            child: Center(child: Text("${emo+widget.a[widget.index]+emo}", style: TextStyle(fontSize: 36,color: tco))),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Expanded(
            child: Container(
                color: Colors.brown,
                width: double.infinity,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: size,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                            onTap: () {
                                              co = [
                                                d.co[index],
                                                d.co[index + 1]
                                              ];
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                    d.co[index],
                                                    d.co[index + 1]
                                                  ])),
                                            ));
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(2),
                                color: Colors.white,
                                child:
                                    Image.asset("Assets/Images/Icon/lens.jpg")),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          InkWell(
                              onTap: () {
                                co = gradi;
                                gradi = random();
                                setState(() {});
                              },
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: gradi))))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: size-500,
                                    child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(flex: 10,child: Container(child:
                                            GridView.builder(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 8
                                                ),
                                              itemCount: d.co.length,
                                              itemBuilder: (context, index) {
                                                  return InkWell(onTap: () {
                                                    co=[d.co[index],d.co[index]];
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },child: Container(margin: EdgeInsets.all(10),color: d.co[index]));
                                                },
                                            ),)),
                                          Align(alignment: AlignmentDirectional.topStart,child:InkWell(onTap: () {
                                            Navigator.pop(context);
                                          },child: Icon(Icons.close)))
                                        ],
                                    )
                                  );
                                },
                              );
                            },
                            child: Container(
                                height: 30,
                                width: 150,
                                color: Colors.red,
                                child: Center(child: Text("Background"))),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: size-500,
                                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(flex: 10,child: Container(child:
                                          GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8
                                            ),
                                            itemCount: d.co.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(onTap: () {
                                                tco=d.co[index];
                                                Navigator.pop(context);
                                                setState(() {});
                                              },child: Container(margin: EdgeInsets.all(10),color: d.co[index]));
                                            },
                                          ),)),
                                          Align(alignment: AlignmentDirectional.topStart,child:InkWell(onTap: () {
                                            Navigator.pop(context);
                                          },child: Icon(Icons.close)))
                                        ],
                                      )
                                  );
                                },
                              );
                            },
                            child: Container(
                                height: 30,
                                width: 150,
                                color: Colors.red,
                                child: Center(child: Text("Text Color"))),
                          ),
                          Container(
                              height: 30,
                              width: 150,
                              color: Colors.red,
                              child: Center(child: Text("Share"))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 30,
                              width: 150,
                              color: Colors.red,
                              child: Center(child: Text("Font"))),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                      height: size-500,
                                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(flex: 10,child: Container(child:
                                            ListView.separated(
                                                itemBuilder: (context, index) {
                                                  return InkWell(onTap: () {
                                                    Navigator.pop(context);
                                                    emo="\n${d.emo[index]}\n";
                                                    setState(() {});
                                                  },child: Text("${d.emo[index]}"));
                                                },
                                                separatorBuilder: (context, index) {
                                                  return Container(height: 1,width: double.infinity,color: Colors.black,);
                                                },
                                                itemCount: d.emo.length
                                            )
                                          )),
                                          Align(alignment: AlignmentDirectional.topStart,child:InkWell(onTap: () {
                                            Navigator.pop(context);
                                          },child: Icon(Icons.close)))
                                        ],
                                      )
                                  );
                                },
                              );
                            },
                            child: Container(
                                height: 30,
                                width: 150,
                                color: Colors.red,
                                child: Center(child: Text("Emoji"))),
                          ),
                          Container(
                              height: 30,
                              width: 150,
                              color: Colors.red,
                              child: Center(child: Text("Text Size"))),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          )),
        ],
      ),
    );
  }
}
