import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/register_controller.dart';
import 'login_screen.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final TextEditingController _UserName = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void checkData() async{
    if (_formKey.currentState?.validate() ?? false) {
      String UserName = _UserName.text;
      String PassWord = _passwordController.text;
      String Name = _nameController.text;
      dynamic dataregister = await RegisterController.getRegister(
          UserName, PassWord, Name);
      if (dataregister["status"] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginPage()));
      }else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(dataregister["title"]),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("back1.jpg"), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Image(image: AssetImage("htv_preview_rev_1.png")),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _UserName,
                validator: (value) {
                  // add email validation
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'abc',
                  errorStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.white), // Màu sắc của đường viền
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                obscureText: !_isPasswordVisible,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'enter your password',
                  errorStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.lock_outlined,
                    color: Colors.white70,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Màu sắc của đường viền
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  // add email validation
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // bool emailValid = RegExp(
                  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(value);
                  // if (!emailValid) {
                  //   return 'Please enter a valid email';
                  // }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'abc@gmail.com',
                  errorStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.people_alt,
                    color: Colors.white70,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.white), // Màu sắc của đường viền
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Color(0xFFC72D32),
                  ),
                  onPressed: () {
                    checkData();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: const SizedBox(
                  height: 20,
                  child: Text(
                    '------or------',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3B5998),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 180,
                      height: 50,
                      child: Container(
                        child:
                            Image.asset('face_icon.jpg', height: 30, width: 30),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 180,
                      height: 50,
                      child: Container(
                        child:
                            Image.asset('google_icon.jpg', height: 30, width: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
