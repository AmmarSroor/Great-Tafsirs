import 'dart:ui';

import 'package:flutter/material.dart';

import '../setting_dialog.dart';

class ScreenOffTimeDialog extends StatefulWidget {
  final String title;

  const ScreenOffTimeDialog({required this.title}) ;

  @override
  _ScreenOffTimeDialogState createState() => _ScreenOffTimeDialogState(this.title);
}

class _ScreenOffTimeDialogState extends State<ScreenOffTimeDialog> {
  final String title;

  int screenOffTimeDialogIndex = 0;
  int? screenOffTime;
  List<Map<String ,dynamic>> screenOffTimeDialogList = [
    {'5 دقائق':1},
    {'10 دقائق':2},
    {'15 دقائق':3},
    {'20 دقائق':4},
  ];

  _ScreenOffTimeDialogState(this.title);

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
          height: 250,
          width: 250,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...screenOffTimeDialogList.map((item) => Column(
                  children: [
                    ListTile(
                      title: Text(item.keys.first),
                      onTap: (){
                        setState(() {
                          screenOffTimeDialogIndex = item.values.first;
                        });
                      },
                      trailing: screenOffTimeDialogIndex == item.values.first?Image.asset('assets/images/icons/check_icon_enable.png'):null,
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
