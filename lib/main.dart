import 'package:filme_flix_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme('Inter').apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff32A873),
          onPrimary: Color(0xff121212),
          secondary: Colors.transparent,
          onSecondary: Color(0xff32A873),
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xff121212),
          onSurface: Colors.white,
        )
      ),
     routerConfig: router,
    );
  }
}
