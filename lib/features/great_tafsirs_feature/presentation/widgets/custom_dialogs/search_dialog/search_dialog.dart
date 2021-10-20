import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatefulWidget {
  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  int? currentSearchTitleIndex;
  TextEditingController searchController = TextEditingController();
  List<Map<String,int>> _searchTitleIndex = [
    {'isWord':1},
    {'isRoot':2},
    {'isWordRoot':3},
    {'isAyah':4},
  ];

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Container(
          width: double.infinity,
          color: Colors.blueGrey.shade100,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Text('البحث في القرآن',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: searchController,
                  onChanged: (_){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffix: searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: (){
                                setState(() {
                                  searchController.text = '';
                                });
                              },
                              icon: Icon(Icons.clear),
                            )
                          : null,
                      prefix: searchController.text.isEmpty
                        ? Icon(Icons.search,color: Colors.grey,)
                        : null,
                      hintText: 'ابحث في القرآن .. على الأقل ثلاثةأحرف',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 20,
                              color: Colors.black12
                          )
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        actionsPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        titlePadding: EdgeInsets.all(0),
        buttonPadding: EdgeInsets.all(0),
        content: Container(
            height: 400,
            child: Column(
              children: [
                // Search Titles
                Row(
                  children: [
                    buildSearchTitle('assets/images/search_icons/word.png',1),
                    buildSearchTitle('assets/images/search_icons/root.png',2),
                    buildSearchTitle('assets/images/search_icons/word_root.png',3),
                    buildSearchTitle('assets/images/search_icons/ayah.png',4),
                  ],
                ),
                // number of result
                Container(
                  width: double.infinity,
                  color: Colors.blueGrey.shade100,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  child: Row(
                    children: [
                      Text('عدد النتائج : ',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       InkWell(
                         child: Image.asset('assets/images/icons/check_icon_enable.png'),
                       ),
                      InkWell(
                        child: Image.asset('assets/images/search_icons/add_list.png'),
                      ),
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

  Widget buildSearchTitle(String imageUrl ,int searchTitleIndex) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            currentSearchTitleIndex=searchTitleIndex;
          });
        },
        child: Container(
          child: Image.asset(
            currentSearchTitleIndex==searchTitleIndex
                ? imageUrl.replaceRange(imageUrl.length-4, imageUrl.length-4,'_selected')
                : imageUrl,
                height: 40,width: 50,fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
