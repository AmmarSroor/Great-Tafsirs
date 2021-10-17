import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import '../setting_dialog.dart';

class AssistDialog extends StatefulWidget {
  final String title;

  AssistDialog({required this.title});

  @override
  _AssistDialogState createState() => _AssistDialogState();
}

class _AssistDialogState extends State<AssistDialog> {
  bool _isLoading = true;

  PDFDocument? doc;

  final String description = 'تمتلك وقفية الأمير غازي للفكر لقرآني موقع التفاسير العظيمة GreatTafsirs.com وهو وقف ذُرّيّ غير ربحي ومقرّه الأردن تم تأسيسه في عام 2012 م. وقد أسس مشاريع أخرى مثل موقع الفكر القرآني QuranicThought.com والخطوط الإسلامية المجانية FreeIslamicCalligraphy.com.\n كما أنه من خلال سمو الأمير غازي بن محمد، مؤسس هذه الوقفية، فإنَّ الموقع مرتبط بموقع التفسير الكبير Altafsir.com وموقع السيرة Alsirah.com بالإضافة الى مؤسسة آل البيت الملكية للفكر الإسلامي في عمان، الأردن.\n تمتلك وقفية الأمير غازي للفكر القرآني أيضاً المواقع الإلكترونية المجانية التالية:';

  void _loadPDFFileFromAssets() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/pdf_files/user_guide.pdf');
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    _loadPDFFileFromAssets();
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
                  widget.title,
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
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Flexible(
            child: _isLoading
                ? CircularProgressIndicator()
                : PDFViewer(
              document: doc,
            ),
          ),
        ),
      ),
    );
  }
}
