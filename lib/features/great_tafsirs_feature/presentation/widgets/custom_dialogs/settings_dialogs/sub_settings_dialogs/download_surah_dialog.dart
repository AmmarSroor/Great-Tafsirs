import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../setting_dialog.dart';

class DownloadSurahDialog extends StatefulWidget {
  final String title;

  const DownloadSurahDialog({required this.title}) ;

  @override
  _DownloadSurahDialogState createState() => _DownloadSurahDialogState(this.title);
}

class _DownloadSurahDialogState extends State<DownloadSurahDialog> {
  final String title;
  double percent = 0;
  int? currentSurahSelected;

  List<Map<String ,int>> chooseReaderDialogList = [
    {'الفاتحة':1},
    {'البقرة':2},
    {'آل عمران':3},
    {'النساء':4},
    {'المائدة':5},
    {'الأنعام':6},
    {'الأعراف':7},
    {'الأنفال':8},
  ];

  _DownloadSurahDialogState(this.title);

  @override
  void initState() {
    if(currentSurahSelected !=null){
      if(chooseReaderDialogList[currentSurahSelected!-1].values.first == currentSurahSelected) {
        print(currentSurahSelected);
        Timer? timer;
        timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
          setState(() {
            percent += 10;
            if (percent >= 100) {
              timer!.cancel();
              // percent=0;
            }
          });
        });
      }
    }
    super.initState();
  }

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
                      title: Text(item.keys.first),
                      onTap: (){
                        setState(() {
                          currentSurahSelected = item.values.first;
                        });
                      },
                      trailing: Container(
                        width: 80,
                        child: LinearPercentIndicator( //leaner progress bar
                          animationDuration: 1000,
                          lineHeight: 10.0,
                          percent:percent/100,
                          center: Text(
                            percent.toString() + "%",
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.blue[400],
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
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
