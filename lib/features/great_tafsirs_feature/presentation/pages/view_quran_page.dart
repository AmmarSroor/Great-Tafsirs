import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/widgets/custom_button.dart';

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

    return Scaffold(
      body: Stack(
        children: [
          //background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/QuranPageBackground.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          //frame
          Container(
            child: Center(
              child: Container(
                height: size.height * 0.88,
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
            padding: const EdgeInsets.all(48),
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
                      height: size.height*0.76,
                      width: size.width*0.82,
                      child: Image.asset(page['text']),
                    ),
                  ),
                ),
              ],
              ),
          ),
          //buttons
          Positioned(
            top: 0,
            child: Container(
              color: Colors.white,
              width: size.width,
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
                    function: () {},
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
            top: 56,
            right: 90,
            child: Container(
              child: Image.asset(dummyData[currentPageIndex]['JuzName'],width: 85,height: 30,fit: BoxFit.cover,),
            ),
          ),
          //surah name
          Positioned(
            top: 56,
            left: 90,
            child: Container(
              child: Image.asset(dummyData[currentPageIndex]['surahName'],width: 85,height: 30,fit: BoxFit.cover,),
            ),
          ),
          //page number
          Positioned(
            bottom: 65,
            left: size.width/2-5,
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
    );
  }
}
