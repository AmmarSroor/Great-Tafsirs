import 'dart:ui';

import 'package:flutter/material.dart';

import '../setting_dialog.dart';

class DownloadSurahDialog extends StatefulWidget {
  final String title;

  const DownloadSurahDialog({required this.title}) ;

  @override
  _DownloadSurahDialogState createState() => _DownloadSurahDialogState(this.title);
}

class _DownloadSurahDialogState extends State<DownloadSurahDialog> {
  final String title;


  List<String> chooseReaderDialogList = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
  ];

  _DownloadSurahDialogState(this.title);

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
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton.icon(
                  icon:  Text('الإعدادات'),
                  onPressed: (){
                    Navigator.of(context).pop();
                    showDialog(context: context, builder: (_)=> SettingsDialog());
                  },
                  label: Icon(Icons.arrow_forward_ios,size: 15,),
                ),
              ],
            ),
          ),
        ),
        titlePadding: EdgeInsets.all(0),

        scrollable: true,
        content: Container(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...chooseReaderDialogList.map((item) => Column(
                  children: [
                    ListTile(
                      title: Text(item),
                    ),
                    Divider(
                      height: 5,
                      thickness: 1,
                      endIndent: 30,
                      indent: 30,
                    ),
                  ],
                )).toList(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
