import 'package:flutter/material.dart';
import 'login.dart';
import 'package:HelpingHand/Services/auth.dart';

Map<String, String> listOfValue = {
  "name": "",
  "email": "",
  "password": "",
  "phone_number": "",
};

class RegisterApp extends StatefulWidget {
  @override
  State<RegisterApp> createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            color: const Color(0xFF1B1E69),
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 47),
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/logo.png',
                          height: 63,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'HELPING HAND',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 650,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Get Started',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'by creating a free account',
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        // Màu đen với độ mờ là 0.5
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildTextField(
                                        hintText: 'Full Name',
                                        icon: Icons.person,
                                        onChange: (newVal) {
                                          setState(() {
                                            listOfValue["name"] = newVal;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildTextField(
                                        hintText: 'Valid Email',
                                        icon: Icons.email,
                                        onChange: (newVal) {
                                          setState(() {
                                            listOfValue["email"] = newVal;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildTextField(
                                        hintText: 'Phone Number',
                                        icon: Icons.phone,
                                        onChange: (newVal) {
                                          setState(() {
                                            listOfValue["phone_number"] =
                                                newVal;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildTextField(
                                        hintText: 'Strong Password',
                                        icon: Icons.lock,
                                        onChange: (newVal) {
                                          setState(() {
                                            listOfValue["password"] = newVal;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          dynamic result = await _auth
                                              .registerWithEmailAndPassword(
                                                  listOfValue["email"]!,
                                                  listOfValue["password"]!);

                                          if (result == null)
                                            print('Error');
                                          else {
                                            Navigator.pop(context);
                                            print('Sucess');
                                            print(result.uid);
                                          }
                                        }
                                        // Add registration logic here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(300, 50),
                                        primary: const Color(0xFF1B1E69),
                                        onPrimary: Colors.grey,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Or register with',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(300, 30),
                                        primary: const Color(0xFFF3F3F3),
                                        onPrimary: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/search.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/facebook.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
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
                                        const Text('Already have an account?'),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ));
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => Colors.transparent,
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                              (states) {
                                                if (states.contains(
                                                    MaterialState.pressed)) {
                                                  return Colors.grey;
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          child: const Text('Login here'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class buildTextField extends StatefulWidget {
  String hintText;
  IconData icon;
  final dynamic onChange;
  buildTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.onChange});
  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          validator: (val) {
            if (widget.hintText.contains('Name')) {
              return val!.isEmpty ? 'Enter your name' : null;
            }
            if (widget.hintText.contains('Password')) {
              return val!.length < 6
                  ? 'Password must be 6 characters or longer'
                  : null;;
            }
            if (widget.hintText.contains('Phone')) {
              return isNumeric(val!) ? null : 'Enter your phone number';
            }
            if (widget.hintText.contains('Email')) {
              return val!.isEmpty ? 'Enter your email' : null;
            }
            return null;
          },
          onChanged: (val) {
            widget.onChange(val);
          },
          obscureText: widget.hintText.contains('Password'),
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            prefix: const SizedBox(width: 8.0),
            suffixIcon: Icon(
              widget.icon,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
      ),
    );
  }
}

bool isNumeric(String s) {
  return int.tryParse(s) != null;
}
