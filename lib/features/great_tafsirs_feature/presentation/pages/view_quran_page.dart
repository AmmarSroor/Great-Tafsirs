import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_button.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_dialogs/settings_dialogs/setting_dialog.dart';

class ViewQuranPage extends StatefulWidget {
  @override
  _ViewQuranPageState createState() => _ViewQuranPageState();
}

class _ViewQuranPageState extends State<ViewQuranPage> {
  int currentPageIndex = 0;

  List<Map<String ,dynamic>> dummyData = [
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora1.png',
      'text': 'assets/images/pages/p1.png',
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p2.png',
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p3.png',
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p4.png',
    },
    {
      'JuzName': 'assets/images/pages/joza1.png',
      'surahName': 'assets/images/pages/sora2.png',
      'text': 'assets/images/pages/p5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - MediaQuery.of(context).padding.top;

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
            //frame (height 0.91)
            Positioned(
              bottom: height*0.035,
              child: Container(
                child: Container(
                  height: height * 0.91,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: ExactAssetImage(
                          'assets/images/QuranFramDesign.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            // pages
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.08),
              child: PageView(
                onPageChanged: (currentPage){
                  setState(() {
                    currentPageIndex = currentPage;
                  });
                },
                reverse: true,
                children: [
                  ...dummyData.map((page) => Center(
                      child: Container(
                        height: height*0.78,
                        width: width*0.82,
                        child: Image.asset(page['text'],fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ],
                ),
            ),
            //background header
            Positioned(
              top: 0,
              child: Container(
                height: height * 0.05,
                width: width,
                child: Image.asset('assets/images/background_header.png',fit: BoxFit.fill,),
              ),
            ),
            //buttons
            Positioned(
              top: height*0.02,
              child: Container(
                color: Colors.white,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/play_image.png'),
                    ),
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/play_all_icon.png',fit: BoxFit.fill,),
                    ),
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/ayaList.png'),
                    ),
                    CustomButton(
                      function: () {
                        showDialog(context: context, builder: (c)=>SettingsDialog(title: 'الإعدادات',));
                      },
                      image: Image.asset('assets/images/buttons_images/settings_icon.png'),
                    ),
                    CustomButton(
                      function: () {},
                      image: Icon(Icons.clear),
                    ),
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/bookmark_list_icon.png',fit: BoxFit.fill,),
                    ),
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/addBookMark_hover.png'),
                    ),
                    CustomButton(
                      function: () {},
                      image: Image.asset('assets/images/buttons_images/search_icon.png'),
                    ),

                  ],
                ),
              ),
            ),
            //juz name
            Positioned(
              top: height * 0.075,
              right: width*0.17,
              child: Container(
                child: Image.asset(dummyData[currentPageIndex]['JuzName'],width: width*0.18,height: height*0.035,fit: BoxFit.fill,),
              ),
            ),
            //surah name
            Positioned(
              top: height * 0.075,
              left: width*0.17,
              child: Container(
                child: Image.asset(dummyData[currentPageIndex]['surahName'],width: width*0.18,height: height*0.035,fit: BoxFit.fill,),
              ),
            ),
            //page number
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
          ],
        ),
      ),
    );
  }
}
