import 'package:flutter/material.dart';
import 'package:project4/screen/nav_screen.dart';
import 'package:project4/screen/register_screen.dart';
import '../controllers/login_controller.dart';
import 'home_screen.dart';
import 'nav_screen_admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _UserName = TextEditingController();
  final TextEditingController _PassWord = TextEditingController();

  void checkLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      String userName = _UserName.text;
      String passWord = _PassWord.text;
      var check = await Login.getLogin(userName, passWord);
      if (check["status"] == true) {
        if(check["isadmin"] == true){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavScreenAdmin(
                  codeUser: check["code"],
                )),
          ).then((value) {
            setState(() {
              _UserName.text = "";
              _PassWord.text = "";
            });
          });
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavScreen(
                  codeUser: check["code"],
                )),
          ).then((value) {
            setState(() {
              _UserName.text = "";
              _PassWord.text = "";
            });
          });
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text("Tài khoản hoặc mật khẩu không đúng"),
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("back1.jpg"), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image(image: AssetImage("htv_preview_rev_1.png")),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _UserName,
                style:
                    TextStyle(color: Colors.white), // Màu chữ của TextFormField
                validator: (value) {
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
                decoration: InputDecoration(
                  labelText: 'UserName',
                  hintText: 'abc@gmail.com',
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.white70,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Màu sắc của đường viền
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _PassWord,
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }

                  return null;
                },
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'enter your password',
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.lock_outlined),
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
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Màu sắc của đường viền
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CheckboxListTile(
                tileColor:
                    Colors.transparent, // Sửa màu nền của CheckboxListTile
                value: _rememberMe,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _rememberMe = value;
                  });
                },
                title: const Text(
                  'Remember me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                contentPadding: const EdgeInsets.all(0),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: const Color(0xFFC72D32),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    checkLogin();
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: const Color(0xFFC72D32),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: const SizedBox(
                  height: 20,
                  child: Text(
                    '------or------',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B5998),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 180,
                      height: 50,
                      child: Stack(
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage("face_icon.jpg"),
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              )),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: const Color.fromRGBO(121, 121, 121, 0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 180,
                      height: 50,
                      child: Stack(
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Image(
                                image: AssetImage("google_icon.jpg"),
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              )),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: const Color.fromRGBO(121, 121, 121, 0.5),
                          )
                        ],
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
