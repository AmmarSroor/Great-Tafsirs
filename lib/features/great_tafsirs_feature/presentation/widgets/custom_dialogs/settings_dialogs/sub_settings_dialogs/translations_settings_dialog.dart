import 'dart:ui';

import 'package:flutter/material.dart';

import '../setting_dialog.dart';

class TranslationsSettingsDialog extends StatefulWidget {
  final String title;

  const TranslationsSettingsDialog({required this.title});

  @override
  _TranslationsSettingsDialogState createState() =>
      _TranslationsSettingsDialogState(this.title);
}

class _TranslationsSettingsDialogState
    extends State<TranslationsSettingsDialog> {
  final String title;

  int? selectedLanguage;
  String? selectedTranslation;
  List<Map<int, Map<String, List<String>>>> dummyTranslationsData = [
    {
      1: {
          'English': [
            'English Translation 1',
            'English Translation 2',
            'English Translation 3'
          ]
        }
    },
    {
      2: {
        'France': [
          'France Translation 1',
          'France Translation 2',
          'France Translation 3'
        ]
      }
    },
    {
      3: {
        'Spanish': [
          'Spanish Translation 1',
          'Spanish Translation 2',
          'Spanish Translation 3'
        ]
      }
    },
  ];

  _TranslationsSettingsDialogState(this.title);

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
          height: 250,
          width: 250,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 196,
                  child: DropdownButtonFormField(
                    value: selectedLanguage,
                    isExpanded: true,
                    onChanged: (newSelectedLanguage) {
                      setState(() {
                        selectedLanguage = newSelectedLanguage as int;
                        selectedTranslation = null;
                      });
                    },
                    items: [
                      ...dummyTranslationsData
                          .map((languageItem) => DropdownMenuItem(
                        value: languageItem.keys.first,
                        child: Text(languageItem.values.first.keys.first),
                      ))
                    ],
                    decoration: InputDecoration(
                      hintText: 'إختر لغة',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                        )
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 196,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: selectedTranslation,
                    onChanged: (newSelectedLanguage) {
                      setState(() {
                        selectedTranslation = newSelectedLanguage;
                      });
                    },
                    items: [
                      if(selectedLanguage != null )
                        ...dummyTranslationsData[selectedLanguage!-1].values.first.values.first.map((translationItem) => DropdownMenuItem(
                          value: translationItem,
                          child: Text(translationItem.toString(),overflow: TextOverflow.ellipsis,textWidthBasis: TextWidthBasis.longestLine,),
                        ),
                        ),
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 5,
                            )
                        )
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
