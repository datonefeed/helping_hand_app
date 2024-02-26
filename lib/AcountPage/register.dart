import 'package:flutter/material.dart';

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: const Color(0xFF1B1E69),
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
                                children: [
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
                                  buildTextField('Full Name', Icons.person),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buildTextField('Valid Email', Icons.email),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buildTextField('Phone Number', Icons.phone),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buildTextField('Strong Password', Icons.lock),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add registration logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 50),
                                      primary: const Color(0xFF1B1E69),
                                      onPrimary: Colors.grey,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                        borderRadius: BorderRadius.circular(5),
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
                                        borderRadius: BorderRadius.circular(5),
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
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateColor.resolveWith(
                                            (states) => Colors.transparent,
                                          ),
                                          foregroundColor:
                                              MaterialStateProperty.resolveWith(
                                            (states) {
                                              if (states.contains(
                                                  MaterialState.pressed)) {
                                                return Colors.grey;
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
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, IconData icon) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          obscureText: hintText.contains('Password'),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefix: SizedBox(width: 8.0),
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
      ),
    );
  }
}
