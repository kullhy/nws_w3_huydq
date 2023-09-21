import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_w3_huydq/blocs/bottom_navigator/bottom_bar_cubit.dart';
import 'package:nws_w3_huydq/configs/app_configs.dart';
import 'package:nws_w3_huydq/models/movies.dart';
import 'package:nws_w3_huydq/ui/pages/detail/detail_cubit.dart';
import 'package:nws_w3_huydq/ui/pages/detail/detail_page.dart';
import 'package:nws_w3_huydq/ui/pages/home/home_cubit.dart';
import 'package:nws_w3_huydq/ui/pages/home/home_page.dart';
import 'package:nws_w3_huydq/ui/widgets/bottom_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomePage(), // Widget của bạn
        ),
        BlocProvider(
          create: (context) => DetailCubit(),
          child:  DetailPage(movie: Movie(),), // Widget của bạn
        ),
         BlocProvider(
          create: (context) => BottomBarCubit(),
          child: createBottomNavigationBar(), // Widget của bạn
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: AppConfigs.fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const HomePage(),
      ),
    );
  }
}
