import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:contador_pessoa/bloc/counter_bloc.dart';
import 'package:contador_pessoa/page/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CounterBloc()),
      ],
      dependencies: const [],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
