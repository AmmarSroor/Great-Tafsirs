import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget image;
  final VoidCallback function;

  CustomButton({
    required this.image,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,left: 3,right: 3,bottom: 10),
      child: InkWell(
        onTap: function,
        child: Container(
          width: 40,
          height: 40,
          child: image,
        ),
      ),
    );
  }
}
