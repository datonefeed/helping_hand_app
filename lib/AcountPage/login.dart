import 'package:flutter/material.dart';
import '../Services/auth.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _auth = AuthServices();
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xFF1B1E69),
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 47),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    alignment: Alignment.center,
                    height: 63,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'HELPING HAND',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          // color: Colors.white,
                          height: 510,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'Welcome back',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'Sign in to access your account',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  // Màu đen với độ mờ là 0.5
                                  fontSize: 13.0,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3F3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    validator: (val) => val!.length < 6
                                        ? 'Password must be 6 characters or longer'
                                        : null,
                                    // style: TextStyle(fontSize: 15, height: 1.4),
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email',
                                      border: InputBorder.none,
                                      prefix: SizedBox(width: 8.0),
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3F3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter your email'
                                        : null,
                                    obscureText: true,
                                    // style: TextStyle(fontSize: 15, height: 1.4),
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                      border: InputBorder.none,
                                      prefix: SizedBox(width: 8.0),
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20.0)),
                                  RememberMeCheckBox(),
                                  const Text('Remember me'),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.grey;
                                        }
                                      }),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Forgot Password?'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    dynamic result = await _auth.signInEmail(
                                        email, password);
                                    if (result == null)
                                      print('Error');
                                    else {
                                      print('Sucess');
                                      print(result.uid);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(300, 50),
                                    primary: const Color(0xFF1B1E69),
                                    onPrimary: Colors.grey,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Or login with',
                                style: TextStyle(color: Colors.grey),
                              ),
                              // SizedBox(height: 10,),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 30),
                                  primary: const Color(0xFFF3F3F3),
                                  onPrimary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/search.png',
                                      // Đường dẫn đến tệp ảnh biểu tượng Google trong dự án của bạn
                                      width: 20, // Chiều rộng của biểu tượng
                                      height: 20, // Chiều cao của biểu tượng
                                    ), // Biểu tượng
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Continue with Google',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 30),
                                  primary: const Color(0xFFF3F3F3),
                                  onPrimary: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/facebook.png',
                                      // Đường dẫn đến tệp ảnh biểu tượng Google trong dự án của bạn
                                      width: 20, // Chiều rộng của biểu tượng
                                      height: 20, // Chiều cao của biểu tượng
                                    ), // Biểu tượng
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Continue with facebook',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('New member?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterApp(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent),
                                      foregroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.grey;
                                        }
                                      }),
                                    ),
                                    child: const Text('Register now'),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
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

class RememberMeCheckBox extends StatefulWidget {
  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool remember_me = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: remember_me,
      onChanged: (value) {
        setState(() {
          remember_me = value!;
        });
      },
      activeColor: Colors.grey,
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.grey, width: 2),
    );
  }
}
