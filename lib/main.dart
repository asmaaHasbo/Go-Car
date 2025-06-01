import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/core/routing/app_routers.dart';
import 'package:go_car/core/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      minTextAdapt: true,
      
      child: MaterialApp(
        title: 'Go Car',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.cairoTextTheme(),
        ),
        initialRoute: Routes.login,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
