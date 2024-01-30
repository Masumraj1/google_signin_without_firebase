
import 'dart:developer';

import 'package:flutter/material.dart';

import 'login_api.dart';

class SuccessLogin extends StatelessWidget {
  final String name;
  final String email;

  const SuccessLogin({super.key, required this.name, required this.email});


  @override
  Widget build(BuildContext context) {
    ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>This is Google signOut Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

    Future googleSignOut() async {
      try {
        await GoogleSignInService.logout();
        log('Sign Out Success');
        Navigator.pop(context);
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Out Success',style: TextStyle(color: Colors.white),)));
        }
      } catch (exception) {
        log(exception.toString());
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign Out Failed')));
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Success login"),
        actions: [IconButton(onPressed: googleSignOut, icon: Icon(Icons.login))],
      ),
      body: Center(
        child: Column(
          children: [
            Text(name),
            SizedBox(
              height: 16,
            ),
            Text(email)
          ],
        ),
      ),
    );
  }
}
