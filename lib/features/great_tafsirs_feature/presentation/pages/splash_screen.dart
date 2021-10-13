import 'package:flutter/material.dart';
import 'package:great_tafsirs/features/great_tafsirs_feature/presentation/pages/view_quran_page.dart';


class MySplashScreen extends StatefulWidget {


  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  navigateToHomePage()async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ViewQuranPage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: ExactAssetImage('assets/images/background_splash.png'),
             fit: BoxFit.fill
           ),
         ),
      ),
    );
  }

}