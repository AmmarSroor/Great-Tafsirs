import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/sub_settings_dialogs/download_surah_dialog.dart';


class ChooseReaderDialog extends StatefulWidget {
  final String title;

  const ChooseReaderDialog({required this.title}) ;

  @override
  _ChooseReaderDialogState createState() => _ChooseReaderDialogState(this.title);
}

class _ChooseReaderDialogState extends State<ChooseReaderDialog> {
  final String title;

  int choosedReaderIndex = 0;
  List<Map<String ,dynamic>> chooseReaderDialogList = [
    {'محمد المنشاوي':1},
    {'ماهر المعيقلي':2},
    {'مشاري العفاسي':3},
    {'جمال شاكر':4},
    {'محمد أيوب':5},
  ];

  _ChooseReaderDialogState(this.title);

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
                ...chooseReaderDialogList.map((item) => Column(
                  children: [
                    ListTile(
                      title: Text(item.keys.first),
                      onTap: (){
                        setState(() {
                          choosedReaderIndex = item.values.first;
                          Navigator.of(context).pop();
                          showDialog(context: context, builder: (ctx)=>DownloadSurahDialog(title: 'تنزيل السور'));
                        });
                      },
                      trailing: choosedReaderIndex == item.values.first?Image.asset('assets/images/icons/check_icon_enable.png'):null,
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
