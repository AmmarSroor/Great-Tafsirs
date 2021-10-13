import 'dart:ui';

import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  final String title;

  const SettingsDialog({required this.title}) ;

  @override
  _SettingsDialogState createState() => _SettingsDialogState(this.title);
}

class _SettingsDialogState extends State<SettingsDialog> {
  final String title;

  bool? isNotificationsActivate = false;

  _SettingsDialogState(this.title);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        scrollable: true,
        content: Container(
          height: 500,
          child: Column(
            children: [
              Divider(
                height: 5,
                thickness: 3,
              ),
              ListTile(
                title: Text('إختيار القارئ'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('تنزيل السور'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('تنزيل السور التي تحوي الآيات'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('اختيار التفسير'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('إعدادات التراجم'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('زمن توقف الشاشة'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('تفعيل الإشعارات'),
                leading: Checkbox(
                  value: isNotificationsActivate,
                  onChanged: (newValue){
                    setState(() {
                      isNotificationsActivate = newValue;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('المساعدة'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('نبذة عنّا'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Text('انشر تؤجر'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
