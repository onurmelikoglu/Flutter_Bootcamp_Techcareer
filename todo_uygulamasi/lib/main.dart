import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/ui/cubits/detailpage_cubit.dart';
import 'package:todo_uygulamasi/ui/cubits/homepage_cubit.dart';
import 'package:todo_uygulamasi/ui/cubits/savepage_cubit.dart';
import 'package:todo_uygulamasi/ui/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SavepageCubit()),
        BlocProvider(create: (context) => DetailpageCubit()),
        BlocProvider(create: (context) => HomepageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
