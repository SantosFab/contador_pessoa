import 'package:contador_pessoa/page/counter_page.dart';
import 'package:contador_pessoa/style/custom_cores.dart';
import 'package:contador_pessoa/style/custom_font.dart';
import 'package:contador_pessoa/widget/button.dart';
import 'package:contador_pessoa/widget/my_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _text = TextEditingController(text: '3');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/img1.jpg',
              ),
            ),
          ),
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
                    decoration: InputDecoration(
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
                    ),
                  ),
                ),
                Button(
                  nameButton: 'Continuar',
                  onPressed: () {
                    int number = double.parse(_text.text).toInt();
                    if (number.toString().isNotEmpty && number != 0) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CounterPage(number: number),
                      ));
                    } else {
                      _alert(context);
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
              'Por favor, digite um número interior maior que zero!'),
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
