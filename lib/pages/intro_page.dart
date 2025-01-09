import 'package:flutter/material.dart';
import 'package:template_project/pages/auth/login_page.dart';
import 'package:template_project/pages/auth/register_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(image: )
            Text("Hello world"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/login');
                    },
                    child: Text("Sign In")),
                SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,'/register');
                    },
                    child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
