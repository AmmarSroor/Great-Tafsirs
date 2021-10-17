import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/sub_settings_dialogs/assist_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/sub_settings_dialogs/download_surah_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/sub_settings_dialogs/translations_settings_dialog.dart';

import 'sub_settings_dialogs/choose_reader_dialog.dart';
import 'sub_settings_dialogs/choose_tafsir_dialog.dart';
import 'sub_settings_dialogs/download_surah_containing_ayats_dialog.dart';
import 'sub_settings_dialogs/more_details_about_us_dialog.dart';
import 'sub_settings_dialogs/screen_off_time_dialog.dart';
import 'sub_settings_dialogs/share_app_dialog.dart';

class SettingsDialog extends StatefulWidget {


  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {


  bool? isNotificationsActivate = false;
  List<Map<String ,dynamic>> settingDialogList = [
    {'إختيار القارئ':ChooseReaderDialog(title: 'إختيار القارئ',)},
    {'تنزيل السور':DownloadSurahDialog(title: 'تنزيل السور',)},
    {'تنزيل السور التي تحوي الآيات':DownloadSurahContainingAyahsDialog(title: 'تنزيل السور التي تحوي الآيات',)},
    {'اختيار التفسير':ChooseTafsirDialog(title: 'اختيار التفسير',)},
    {'إعدادات التراجم':TranslationsSettingsDialog(title: 'إعدادات التراجم',)},
    {'زمن توقف الشاشة':ScreenOffTimeDialog(title: 'زمن توقف الشاشة',)},
    {'تفعيل الإشعارات':null},
    {'المساعدة':AssistDialog(title: 'المساعدة',)},
    {'نبذة عنّا':MoreDetailsAboutUsDialog(title: 'نبذة عنّا',)},
    {'انشر تؤجر':ShareAppDialog(title: 'انشر تؤجر',)},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        title: ClipRRect(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10) ),
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.blueGrey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'الإعدادات',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...settingDialogList.map((item) => Column(
                  children: [
                    if(item.keys.first == 'تفعيل الإشعارات')
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
                      )
                    else
                      ListTile(
                        title: Text(item.keys.first),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey,),
                        onTap: (){
                          Navigator.of(context).pop();
                          showDialog(context: context, builder:(ctx)=>item.values.first);
                        },
                      ),
                    Divider(
                      height: 5,
                      thickness: 1,
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
