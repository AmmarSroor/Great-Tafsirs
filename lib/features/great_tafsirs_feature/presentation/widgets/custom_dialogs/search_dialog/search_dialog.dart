import 'dart:ui';

import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            color: Colors.blueGrey.shade100,
            child: Column(
              children: [
                Text('البحث في القرآن',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        hintText: 'ابحث في القرآن .. على الأقل ثلاثةأحرف',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 20,
                                color: Colors.black12
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        actionsPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        buttonPadding: EdgeInsets.all(0),
        content: Container(
            height: 400,
            //padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                ],
              ),
            )
        ),


        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       InkWell(
                         child: Image.asset('assets/images/icons/check_icon_enable.png'),
                       ),
                      InkWell(
                        child: Image.asset('assets/images/icons/check_icon_enable.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
