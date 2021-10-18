import 'dart:ui';

import 'package:flutter/material.dart';

import '../setting_dialog.dart';

class ShareAppDialog extends StatelessWidget {
  final String title;
  final String description =
      'إذا أعجبك تطبيق التفاسير العظيمة، فنرجو أن تساهم في دعم هذا الوقف الخيري من خلال نشره عبر وسائل التواصل الإجتماعي، أنشر ولك الأجر إن شاء الله. \n';

  ShareAppDialog({required this.title});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
                  icon: Text('الإعدادات'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context, builder: (_) => SettingsDialog());
                  },
                  label: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        titlePadding: EdgeInsets.all(0),
        content: Container(
          width: 200,
          height: 500,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                description,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildShareButton('assets/images/social_logos/logo_facebook.png','انشر على Facebook',Colors.blue.shade900),
              buildShareButton('assets/images/social_logos/logo_twitter.png','انشر على Twitter',Colors.blue),
              buildShareButton('assets/images/social_logos/logo_linkedIn.png','انشر على LinkedIn',Colors.blue.shade800),
              buildShareButton('assets/images/social_logos/logo_google.png','انشر على Google',Colors.red),
              buildShareButton('assets/images/social_logos/logo_whatsApp.png','انشر على WhatsApp',Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShareButton(String iconUrl ,String text ,Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
                //color: color,
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color)
                  ),
                  icon: Image.asset(iconUrl,width: 20,height: 20,),
                  label: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
    );
  }
}
