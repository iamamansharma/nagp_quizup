import 'package:flutter/material.dart';
import 'package:nagp_quizup/screens/loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  late String _emailAddress;
  late String _password;
  late String _confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Container(
            height: 400,
            child: Form(
              key: _emailKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        _emailAddress = value;
                      } else {
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      _password = value;
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      _confirmPassword = value;
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_emailKey.currentState!.validate()) {
                                print([_password, _confirmPassword]);
                                if (_password == _confirmPassword) {
                                  print('pw matched');
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Sign Up'),
                                          content: Text('Successful!'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginPage()),
                                                );
                                              },
                                              child: Text('Login'),
                                            ),
                                          ],
                                        );
                                      });
                                } else {
                                  print('pw not matched');
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Sign Up'),
                                          content: Text(
                                              'Un-Successful, Password Incorrect!'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      });
                                }
                              } else {
                                print('kuch locha hua');
                                print([
                                  _password,
                                  _confirmPassword,
                                  _emailAddress
                                ]);
                              }
                              print('clicked signup');
                            },
                            child: const Text('Sign Up'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () {
                              print('back to login');
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text('Back'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
