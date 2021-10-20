import 'dart:ui';

import 'package:flutter/material.dart';

import '../setting_dialog.dart';

class MoreDetailsAboutUsDialog extends StatelessWidget {
  final String title;
  final String description = 'تمتلك وقفية الأمير غازي للفكر لقرآني موقع التفاسير العظيمة GreatTafsirs.com وهو وقف ذُرّيّ غير ربحي ومقرّه الأردن تم تأسيسه في عام 2012 م. وقد أسس مشاريع أخرى مثل موقع الفكر القرآني QuranicThought.com والخطوط الإسلامية المجانية FreeIslamicCalligraphy.com.\n كما أنه من خلال سمو الأمير غازي بن محمد، مؤسس هذه الوقفية، فإنَّ الموقع مرتبط بموقع التفسير الكبير Altafsir.com وموقع السيرة Alsirah.com بالإضافة الى مؤسسة آل البيت الملكية للفكر الإسلامي في عمان، الأردن.\n تمتلك وقفية الأمير غازي للفكر القرآني أيضاً المواقع الإلكترونية المجانية التالية:';

  MoreDetailsAboutUsDialog({required this.title});

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
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    'assets/images/icons/god_logo.jpg',
                    width: 90,
                    height: 90,
                  ),
                ),
                Text(description,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                buildCustomTextButton('موقع التفاسير العظيمة',(){}),
                buildCustomTextButton('موقع الخطوط الإسلامية المجانية',(){}),
                buildCustomTextButton('موقع الفكر القرآني',(){}),
                Align(alignment: Alignment.topRight,child: Text('والتطبيقات المجانية التالية:')),
                buildCustomTextButtonAndIcon('تطبيق إقامة الصلاة','assets/images/icons/android_logo.png'),
                buildCustomTextButtonAndIcon('تطبيق إقامة الصلاة','assets/images/icons/ios_logo.png'),

                buildCustomTextButtonAndIcon('تطبيق الفكر القرآني','assets/images/icons/android_logo.png'),
                buildCustomTextButtonAndIcon('تطبيق الفكر القرآني','assets/images/icons/ios_logo.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCustomTextButtonAndIcon(String text ,String iconUrl) {
    return Row(
              children: [
                buildCustomTextButton(text, () { }),
                SizedBox(width: 10,),
                Image.asset(iconUrl,width: 25,height: 25,),
              ],
            );
  }

  Align buildCustomTextButton(String text ,VoidCallback function) {
    return Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: function,
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            );
  }
}
