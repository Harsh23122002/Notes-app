import 'package:flutter/material.dart';

import '../services/googlesignin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){signup(context);}, child: Text("Google Sign in"),),),
    );
  }
}
