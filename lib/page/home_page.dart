import 'package:contador_pessoa/page/counter_page.dart';
import 'package:contador_pessoa/style/custom_cores.dart';
import 'package:contador_pessoa/style/custom_decoration.dart';
import 'package:contador_pessoa/style/custom_font.dart';
import 'package:contador_pessoa/widget/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: CustomDecoration.boxHome,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text(
                  'Qual a capacidade máxima?',
                  style: CustomFont.title,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: _text,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 50, color: CustomCores.white),
                    decoration: CustomDecoration.borderHome,
                  ),
                ),
                Button(
                  nameButton: 'Continuar',
                  onPressed: () {
                    String text = _text.text;
                    if (text.isEmpty ||
                        text.contains(' ') ||
                        text.contains('-') ||
                        text.contains(',') ||
                        text.contains('.')) {
                      _alert(context);
                    } else {
                      int number = int.parse(text);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CounterPage(number: number),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Número inválido'),
          content: const Text(
            'Por favor, digite somente números inteiros, positivos e maiores que zero!!\nEx: 50, 100, 150.',
            textAlign: TextAlign.justify,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
}
