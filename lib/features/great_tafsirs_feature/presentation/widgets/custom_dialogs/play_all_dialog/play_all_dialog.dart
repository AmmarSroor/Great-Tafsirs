import 'dart:ui';

import 'package:flutter/material.dart';

class PlayAllDialog extends StatefulWidget {
  @override
  _PlayAllDialogState createState() => _PlayAllDialogState();
}

class _PlayAllDialogState extends State<PlayAllDialog> {
  int? currentRadioSelected;
  int repeatingCounter = 1;
  bool? isListeningRepeated = false;
  bool? listeningFromCurrentPage = false;

  final List<Map<String, dynamic>> _dummyData = [
    {'البقرة': 1},
    {'استماع للصفحة كاملة': 2},
    {'استماع للحزب': 3},
    {'استماع للجزء': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Align(alignment: Alignment.topCenter, child: Column(
          children: [
            Text('استماع',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(
              'الرجاء اختيار المادة المراد الإستماع لتلاوتها',
              style: TextStyle(
                  fontSize: 15
              ),
            ),
          ],
        )),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        actionsPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        buttonPadding: EdgeInsets.all(0),
        content: Container(
            height: 400,
            //padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                ..._dummyData.map((radioItem) =>
                    Column(
                      children: [
                        RadioListTile<int>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(radioItem.keys.first),
                          value: radioItem.values.first,
                          groupValue: currentRadioSelected,
                          onChanged: (newValue) {
                            setState(() {
                              currentRadioSelected = newValue;
                            });
                          },
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                ).toList(),

                isListeningRepeated!
                  ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('تكرار الإستماع'),
                            value: isListeningRepeated,
                            onChanged: (value) {
                              setState(() {
                                isListeningRepeated = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Image.asset('assets/images/icons/plus.png',width: 20,height: 20,),
                                onTap: (){
                                  setState(() {
                                    repeatingCounter++;
                                  });
                                },
                              ),
                              Text('$repeatingCounter'),
                              InkWell(
                                child: Image.asset('assets/images/icons/minus.png',width: 20,height: 20,),
                                onTap: (){
                                  setState(() {
                                    if(repeatingCounter>1)
                                      repeatingCounter--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                   )
                : CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('تكرار الإستماع',style: TextStyle(fontSize: 15),),
                  value: isListeningRepeated,
                  onChanged: (value) {
                    setState(() {
                      isListeningRepeated = value;
                    });
                  },
                ),

                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('الإستماع من الصفحة الحالية'),
                  value: listeningFromCurrentPage,
                  onChanged: (value) {
                    setState(() {
                      listeningFromCurrentPage = value;
                    });
                  },
                ),
              ],
            )
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
                      ElevatedButton(
                        onPressed: () {
                          if(currentRadioSelected != null)
                            Navigator.of(context).pop();
                          // play audio ...

                        },
                        child: Text('موافق'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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
