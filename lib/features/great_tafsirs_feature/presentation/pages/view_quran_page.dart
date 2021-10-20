import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/provider/quran_pages_provider.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_button/custom_button.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/aya_list_dialog/aya_list_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/marks_dialog/all_marks_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/menu_list_dialog/menu_list_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/play_all_dialog/play_all_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/play_dialog/attention_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/search_dialog/search_dialog.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/setting_dialog.dart';
import 'package:provider/provider.dart';

class ViewQuranPage extends StatefulWidget {
  @override
  _ViewQuranPageState createState() => _ViewQuranPageState();
}

class _ViewQuranPageState extends State<ViewQuranPage> {
  int currentPageIndex = 0;
  bool zoomPageView = false;
  List<Map<String ,dynamic>> dummyData = [
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora1.png',
      'text': 'assets/images/pages/p1.png',
      'isMark':false,
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p2.png',
      'isMark':false,
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p3.png',
      'isMark':false,
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p4.png',
      'isMark':false,
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p5.png',
      'isMark':false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - MediaQuery.of(context).padding.top;
    double pageViewWidth =  width*0.82 ,pageViewHeight = height*0.766 ,pageViewPadding = width*0.09;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //background image
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/QuranPageBackground.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //frame (height 0.88)
            Positioned(
              bottom: height*0.035,
              child: Container(
                height: height * 0.88,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: ExactAssetImage(
                        'assets/images/QuranFramDesign.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ),
            //background header
            Positioned(
              top: 0,
              child: Container(
                height: height * 0.05,
                width: width,
                child: Image.asset('assets/images/AyahActionHeader.png',fit: BoxFit.fill),
              ),
            ),
            // pages
            InkWell(
              onDoubleTap: (){
                setState(() {
                  zoomPageView = !zoomPageView;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: zoomPageView ? 0 :width*0.09),
                child: PageView(
                  onPageChanged: (currentPage){
                    setState(() {
                      currentPageIndex = currentPage;
                    });
                  },
                  reverse: true,
                  children: [
                    ...dummyData.map((page) => Align(
                      alignment: zoomPageView?Alignment(0,0):Alignment(0,0.2),
                      child: Container(
                        height: zoomPageView ? double.infinity : height*0.766,
                        width: zoomPageView ? double.infinity : width*0.82,
                        child: Image.asset(page['text'],fit: BoxFit.fill,),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            //buttons
            if(!zoomPageView)
              Positioned(
                top: height*0.02,
                child: Container(
                  color: Colors.white,
                  width: width,
                  height: height*0.078,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //play button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (ctx)=> AttentionDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/play_image.png'),
                      ),
                      // play all button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (ctx)=>PlayAllDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/play_all_icon.png',fit: BoxFit.fill,),
                      ),
                      // aya list button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (c)=>AyaListDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/ayaList.png'),
                      ),
                      // setting button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (c)=>SettingsDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/settings_icon.png'),
                      ),
                      // menu button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (c)=>MenuListDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/menu_icon.png'),
                      ),
                      // all marks button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (c)=>AllMarksDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/bookmark_list_icon.png',fit: BoxFit.fill,),
                      ),
                      // add bookmark button
                      CustomButton(
                        function: () {
                          setState(() {
                            Provider.of<QuranPagesProvider>(context,listen: false).getListOfBookmarks().contains(currentPageIndex)
                                ? dummyData[currentPageIndex]['isMark'] = false
                                : dummyData[currentPageIndex]['isMark'] = true;

                          });
                          if(dummyData[currentPageIndex]['isMark'])
                            Provider.of<QuranPagesProvider>(context,listen: false).addBookMark(currentPageIndex);
                          else
                            Provider.of<QuranPagesProvider>(context,listen: false).removeBookmark(currentPageIndex);
                        },
                        image: Image.asset(
                          Provider.of<QuranPagesProvider>(context,listen: true).getListOfBookmarks().contains(currentPageIndex)
                              ? 'assets/images/buttons_images/removeBookmark_icon.png'
                              : 'assets/images/buttons_images/addBookMark_icon.png',
                        ),
                      ),
                      // search button
                      CustomButton(
                        function: () {
                          showDialog(context: context, builder: (c)=>SearchDialog());
                        },
                        image: Image.asset('assets/images/buttons_images/search_icon.png'),
                      ),
                    ],
                  ),
                ),
              ),
            //juz name
            if(!zoomPageView)
              Positioned(
              top: height * 0.1025,
              right: width*0.17,
              child: Container(
                child: Image.asset(dummyData[currentPageIndex]['JuzName'],width: width*0.18,height: height*0.035,fit: BoxFit.fill,),
              ),
            ),
            //surah name
            if(!zoomPageView)
              Positioned(
              top: height * 0.1025,
              left: width*0.17,
              child: Container(
                child: Image.asset(dummyData[currentPageIndex]['surahName'],width: width*0.18,height: height*0.035,fit: BoxFit.fill,),
              ),
            ),
            //page number
            if(!zoomPageView)
              Positioned(
              bottom: height * 0.06,
              left: size.width*0.49,
              child: Container(
                child: Text(
                  '${currentPageIndex+1}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // book mark
            if(Provider.of<QuranPagesProvider>(context,listen: true).getListOfBookmarks().contains(currentPageIndex) && !zoomPageView)
              Positioned(
                left: 0,
                top: height * 0.1,
                child: Image.asset('assets/images/icons/bookmark.png',width: 30,height: 90,fit: BoxFit.fill,),
              ),
          ],
        ),
      ),
    );
  }
}
