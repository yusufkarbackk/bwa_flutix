import 'package:bwa_flutix/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.SignUp(
                      "toni@email.com",
                      "toni123",
                      "toni",
                      ["Action", "Drama", "Horror", "Comedy"],
                      "English",
                      );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
              RaisedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.SignIn(
                      "toni@email.com",
                      "toni123",
                      );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
              ),
              RaisedButton(
                child: Text('Sign Out'),
                onPressed: () async {
                  await AuthServices.SignOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
