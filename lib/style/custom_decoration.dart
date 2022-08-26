import 'package:contador_pessoa/style/custom_cores.dart';
import 'package:flutter/material.dart';

class CustomDecoration {
  static InputDecoration borderHome = InputDecoration(
    counterText: '',
    focusColor: CustomCores.red,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomCores.white,
        width: 5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: CustomCores.red, width: 5),
    ),
  );

  static const boxHome = BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        'assets/images/img1.jpg',
      ),
    ),
  );

  static const boxCounter = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/img2.jpg'),
      fit: BoxFit.cover,
    ),
  );
}
