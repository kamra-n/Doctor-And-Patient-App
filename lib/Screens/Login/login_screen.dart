import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devathone/constants/app_constants.dart';
import 'package:devathone/constants/app_images_constant.dart';
import 'package:devathone/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // create Textediting controller/
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isVisible = true;
  void loginHandler() async {
    try {
      setState(() {
        isLoading = true;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      String userID = credential.user!.uid;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot userSnapshot = await users.doc(userID).get();

      if (userSnapshot.exists) {
        // Check if the document exists
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        // Access the "user role" field
        String userRole = userData['role'];
        prefs.setString('uid', userID);
        prefs.setString('role', userRole);

        if (userRole == 'Doctor') {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: "Login Success.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, '/doctorDashboard', (_) => false);
          emailController.text = '';
          passwordController.text = '';
        } else {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: "Login Success.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, '/patientDashboard', (_) => false);
          emailController.text = '';
          passwordController.text = '';
        }
      } else {
        print('User not found');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emailController.text = '';
        passwordController.text = '';
        setState(() {
          isLoading = false;
        });
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emailController.text = '';
        passwordController.text = '';
        setState(() {
          isLoading = false;
        });
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Fluttertoast.showToast(
            msg: "No Account Found With This Details.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emailController.text = '';
        passwordController.text = '';
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print('error comes in catch $e ');
      Fluttertoast.showToast(
          msg: "Error Occurs Try Again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emailController.text = '';
      passwordController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                value: null,
              ),
            )
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.logoImage,
                        width: 300,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          suffixIcon: const Icon(Icons.supervised_user_circle),
                          hintText: 'Please enter your username?',
                          labelText: 'Email Your username *',
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xff2A4BA0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xff2A4BA0)),
                          ),
                        ),
                        validator: (value) {
                          const pattern =
                              r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                          final regex = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'Please Add something !';
                          } else if (value.isNotEmpty &&
                              !regex.hasMatch(value)) {
                            return ' Enter a Valid Email Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: TextFormField(
                          obscureText: _isVisible,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                            ),
                            hintText: 'Please enter your Password?',
                            labelText: 'Password *',
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xff2A4BA0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xff2A4BA0)),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else {
                              if (!regex.hasMatch(value)) {
                                return 'Enter valid password';
                              } else {
                                return null;
                              }
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Divider()),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('or'),
                          )),
                          Expanded(child: Divider())
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        buttonTextColor: Colors.white,
                        buttonColor: Appcolors.baseColor,
                        buttonName: 'Login',
                        onPressed: () async {
                          loginHandler();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/register', (_) => false);
                      },
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            'Dont Have an account?',
                            style: TextStyle(
                              color: Color(0xff2A4BA0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    ));
  }
}
