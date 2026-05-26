import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Admin", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
              onChanged: (v) => c.username.value = v,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (v) => c.password.value = v,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: c.login,
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
