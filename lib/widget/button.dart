import 'package:contador_pessoa/style/custom_cores.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String nameButton;
  final VoidCallback? onPressed;
  const Button({
    Key? key,
    required this.nameButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomCores.white),
        minimumSize: MaterialStateProperty.all(
          const Size(150, 90),
        ),
      ),
      child: Text(
        nameButton,
        style: const TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
}
