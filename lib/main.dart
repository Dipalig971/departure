import 'package:departure/screen/Departure/provider/dohe_data.dart';
import 'package:departure/screen/Departure/provider/language_provider.dart';
import 'package:departure/screen/Departure/provider/theme_provider.dart';
import 'package:departure/screen/Departure/view/detail/detail_Screen.dart';
import 'package:departure/screen/Departure/view/home/home_screen.dart';
import 'package:departure/screen/Departure/view/splashscreen/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DoheProvider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),
    ChangeNotifierProvider(create: (context) => LanguageProvider(),),
    ChangeNotifierProvider(create: (context) => FavouriteProvider(),),
  ],
  child: const DepartureApp()));
}

class DepartureApp extends StatelessWidget {
  const DepartureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      routes: {
        '/':(context) => const SplashScreen(),
        '/home':(context) =>  HomeScreen(),
      },
    );
  }
}
