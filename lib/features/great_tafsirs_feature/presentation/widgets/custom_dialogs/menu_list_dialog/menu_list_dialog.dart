import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuListDialog extends StatefulWidget {
  @override
  _MenuListDialogState createState() => _MenuListDialogState();
}

class _MenuListDialogState extends State<MenuListDialog> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              width: double.infinity,
              height: 60,
              color: Colors.blueGrey.shade100,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold
                ),
                onTap: (tabIndex){
                  setState(() {
                    currentTabIndex = tabIndex;
                  });
                },
                tabs: [
                  Tab(
                    text: 'قائمة السور',
                  ),
                  Tab(
                    text: 'قائمة الأجزاء',
                  ),
                ],
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          titlePadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.all(0),
          buttonPadding: EdgeInsets.all(0),
          content: Container(
              width: 200,
              height: 250,
              //padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    color: Colors.blueGrey.shade100,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        hintText: currentTabIndex==0?'ابحث في السور':'ابحث في الأجزاء',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 20,
                            color: Colors.black12
                          )
                        )
                      ),
                    ),
                  ),
                  Flexible(
                    child: TabBarView(
                      children: [
                        ListView(

                          children: [

                          ],
                        ),
                        ListView(

                          children: [

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),

          actions: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.blueGrey.shade100,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('اذهب للصفحة : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 30,

                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                              hintText: '1:604',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
