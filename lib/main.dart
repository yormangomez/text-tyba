import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tyba/features/home/presentation/bloc/home_bloc.dart';
import 'package:test_tyba/features/home/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'test tyba',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    ),
  ));
}
