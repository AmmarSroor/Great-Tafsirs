import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/sub_settings_dialogs/download_surah_dialog.dart';

import 'aya_list_dialog.dart';


class SearchListDialog extends StatelessWidget {

  int choosedReaderIndex = 0;
  List<Map<String ,dynamic>> chooseReaderDialogList = [
    {'محمد المنشاوي':1},
    {'ماهر المعيقلي':2},
    {'مشاري العفاسي':3},
    {'جمال شاكر':4},
    {'محمد أيوب':5},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10) ),
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.blueGrey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'قائمة البحث',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        titlePadding: EdgeInsets.all(0),

        content: Container(
          height: 80,
          width: 250,
          child: Column(
            children: [
              Text('إسم القائمة'),
              Container(
                width: 100,
                child: TextField(
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),

        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          //.....
                          //...
                          //..
                        },
                        child: Text('حفظ'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(context: context, builder: (ctx)=> AyaListDialog());
                        },
                        child: Text('إلغاء'),
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
