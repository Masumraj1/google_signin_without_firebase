import 'dart:developer';

import 'package:flutter/material.dart';

import 'login_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>This is Google Sign In Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  Future googleSignIn() async {
    try {
      final user = await GoogleSignInService.login();

      await user?.authentication;
      log(user!.displayName.toString());
      log(user.email);
      log(user.id);
      log(user.photoUrl.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Column(
              children: [
                Text(
                    "Name: ${user.displayName}\nEmail: ${user.email}\nId: ${user.id}\nPhotoUrl: ${user.photoUrl}"),
                Image.network(user.photoUrl.toString()),
              ],
            )));
      }
    } catch (exception) {
      log(exception.toString());
    }
  }
///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>This is Google signOut Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  Future googleSignOut() async {
    try {
      await GoogleSignInService.logout();
      log('Sign Out Success');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Google Sign In Without Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> google signOut method call>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            ElevatedButton(
              onPressed: googleSignOut,
              child: const Text('Sign Out'),
            ),
           const SizedBox(
             height: 550,
           ),
            ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Google sign in method call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                  GestureDetector(
                    onTap: googleSignIn,
                    child: const Text("Sign up with Google",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}