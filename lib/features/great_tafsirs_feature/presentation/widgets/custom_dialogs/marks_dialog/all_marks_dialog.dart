import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/provider/quran_pages_provider.dart';
import 'package:provider/provider.dart';

class AllMarksDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                  'العلامات',
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
        actionsPadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        content: Container(
          width: 200,
          height: 250,
            //padding: EdgeInsets.symmetric(horizontal: 5),
            child: Provider.of<QuranPagesProvider>(context).getListOfBookmarks().isNotEmpty
                ? ListView(
              children: [
                  ...Provider.of<QuranPagesProvider>(context)
                      .getListOfBookmarks()
                      .map(
                        (pageIndex) =>
                            Column(
                              children: [
                                ListTile(
                                  leading: Text('صفحة رقم: '),
                                  title: Text('${pageIndex+1}'),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Provider.of<QuranPagesProvider>(
                                          context, listen: false).removeBookmark(
                                          pageIndex);
                                    },
                                    icon: Icon(Icons.clear, color: Colors.blue,),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                        ),
                  ).toList()
              ],
            )
                : Center(
                   child: Text(
            'لا يوجد علامات على أي صفحة.'
        ),
                  ),
        ),
        actions: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.blueGrey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Provider.of<QuranPagesProvider>(
                          context, listen: false).removeAllBookmarks();
                    },
                    icon: Icon(Icons.clear, color: Colors.blue,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
