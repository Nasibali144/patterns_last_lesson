import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_last_lesson/task_bloc/pages/home_page.dart';
import 'blocs/list_post_cubit.dart';

class BaseBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ListPostCubit()),
        ],
        child: HomePage(),
      ),
    );
  }
}
