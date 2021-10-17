import 'dart:ui';

import 'package:flutter/material.dart';

class MenuDialog extends StatelessWidget {

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
                tabs: [
                  Tab(
                    text: 'قوائم السور',
                  ),
                  Tab(
                    text: 'قوائم الأجزاء',
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
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 200,
              height: 250,
              //padding: EdgeInsets.symmetric(horizontal: 5),
              child: TabBarView(
                children: [
                  Scaffold(
                    body: null,
                  ),
                  Scaffold(
                    body:null,
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
