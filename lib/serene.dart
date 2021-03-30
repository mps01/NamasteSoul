import 'dart:async';

import 'package:antara/blocs/playing_bloc.dart';
import 'package:antara/screen/home/home_page.dart';
import 'package:antara/serene%20data/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/categories_bloc.dart';
import 'blocs/simple_bloc_delegate.dart';
import 'blocs/sound_bloc.dart';

Future<void> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(Serene());
}

class Serene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DataRepository>(
      create: (_) => DataRepository(),
      child: BlocProvider(
        create: (context) => CategoryBloc(
            repository: RepositoryProvider.of<DataRepository>(context)),
        child: app(),
      ),
    );
  }

  Widget app() {
    return MaterialApp(
      title: 'Serene',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2C2C2C),
        fontFamily: 'Montserrat',
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(
                repository: RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider(
            create: (context) => PlayingSoundsBloc(
                repository: RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider(
            create: (context) => SoundBloc(
                repository: RepositoryProvider.of<DataRepository>(context)),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
