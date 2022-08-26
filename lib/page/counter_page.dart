import 'package:contador_pessoa/style/custom_font.dart';
import 'package:contador_pessoa/widget/button.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final int number;
  const CounterPage({Key? key, required this.number}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int num;
  @override
  void initState() {
    super.initState();
    num = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Pode entrar!',
                style: CustomFont.title,
              ),
              Text(
                '$num',
                style: CustomFont.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    nameButton: 'Saiu',
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  Button(
                    nameButton: 'Entrou',
                    onPressed: () {
                      setState(() {});
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
