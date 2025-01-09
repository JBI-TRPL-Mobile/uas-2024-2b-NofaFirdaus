import 'package:flutter/material.dart';
import 'package:template_project/pages/auth/login_page.dart';
import 'package:template_project/pages/auth/register_page.dart';
import 'package:template_project/pages/intro_page.dart';
import 'package:template_project/providers/message_providers.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/user_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessageProviders()),
        ChangeNotifierProvider(create: (context) => UserProviders()),
      ],
      child: MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/register': (context) => IntroPage()
      },
    );
  }
}
