import 'package:contador_pessoa/bloc/counter_bloc.dart';
import 'package:contador_pessoa/bloc/counter_event.dart';
import 'package:contador_pessoa/page/home_page.dart';
import 'package:contador_pessoa/style/custom_cores.dart';
import 'package:contador_pessoa/style/custom_decoration.dart';
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
  late int num = widget.number;
  late CounterBloc _counter;
  @override
  void initState() {
    super.initState();
    _counter = CounterBloc(num: num);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: CustomDecoration.boxCounter,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Pode entrar!',
                style: CustomFont.title,
              ),
              StreamBuilder<int>(
                  stream: _counter.stream,
                  initialData: widget.number,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Error! Não foi possível ler o número informação\nError:${snapshot.error}',
                        style: CustomFont.title,
                      );
                    }
                    return Text(
                      '${snapshot.data}',
                      style: CustomFont.number,
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    nameButton: 'Saiu',
                    onPressed: () {
                      if (num > 0) {
                        num--;
                        _counter.add(DecrementEvent());
                      }
                    },
                  ),
                  Button(
                    nameButton: 'Entrou',
                    onPressed: () {
                      if (num < widget.number) {
                        num++;
                        _counter.add(IncrementEvent());
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text(
                  'Tem certeza que deseja sair?\nAs informações serão perdidas'),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Sair',
                textColor: CustomCores.red,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Icon(Icons.logout, color: Colors.black),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counter.close();
  }
}
