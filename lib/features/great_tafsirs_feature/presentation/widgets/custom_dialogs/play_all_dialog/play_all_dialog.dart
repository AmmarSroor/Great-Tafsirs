import 'dart:ui';

import 'package:flutter/material.dart';

class PlayAllDialog extends StatelessWidget {
  final String message = 'لم يتم تنزيل السور المراد الإستماع إلى آياتها مسبقاً. هل تريد تنزيل السور؟';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Align(alignment:Alignment.topCenter,child: Column(
          children: [
            Text('استماع!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            Text(
              'الرجاء اختيار المادة المراد الإستماع لتلاوتها'
            ),
          ],
        )),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        actionsPadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        content: Container(
            width: 200,
            height: 50,
            //padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(message,)
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                        },
                        child: Text('نعم'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('لا'),
                      )
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
