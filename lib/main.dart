import 'package:domino/controller/cubit.dart';
import 'package:domino/controller/states.dart';
import 'package:domino/views/home_screen.dart';
import 'package:domino/views/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'observer.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: getApplicationTheme(),
            home:  HomeScreen(),
          );
        },
       
      ),
    );
  }
}


