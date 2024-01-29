import 'package:flutter/material.dart';
import 'package:google_sign/other/api.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Google"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  var user = await LoginApi.login();
                  if (user != null) {
                    // print("okk");
                    // print(user.displayName);
                    // print(user.email);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessLogin(
                                name: user.displayName!, email: user.email)));
                  }
                },

                child: Text("Login google"))
          ],
        ),
      ),
    );
  }
}

class SuccessLogin extends StatelessWidget {
  final String name;
  final String email;

  const SuccessLogin({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success login"),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.login))],
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
