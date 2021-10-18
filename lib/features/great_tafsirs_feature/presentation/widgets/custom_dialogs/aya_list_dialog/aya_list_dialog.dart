import 'dart:ui';

import 'package:flutter/material.dart';

import 'search_list_dialog.dart';

class AyaListDialog extends StatefulWidget {
  @override
  _AyaListDialogState createState() => _AyaListDialogState();
}

class _AyaListDialogState extends State<AyaListDialog> {
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
                    text: 'قوائم البحث',
                  ),
                  Tab(
                    text: 'قوائم الآيات',
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text('تحرير قائمة',style: TextStyle(fontWeight: FontWeight.bold),)),
                      TextButton(
                        onPressed: (){
                          showDialog(context: context, builder: (ctx)=> SearchListDialog());
                        },
                        child: Text(
                          'إنشاء قائمة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
                        )
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
