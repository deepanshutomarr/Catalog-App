import 'package:flutter/material.dart';
import 'package:flutter_demo/uitls/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // we use _ to decalre a class private.

  String name = "";

  bool changeButtonn = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButtonn = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButtonn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                // height: 300,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButtonn ? 50 : 8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () => moveToHome(context),
                        // setState(() {
                        //   changeButtonn = true;
                        // });

                        // await Future.delayed(Duration(seconds: 1));
                        // await Navigator.pushNamed(
                        //     context, MyRoutes.homeRoute);
                        // setState(() {
                        //   changeButtonn = false;
                        // });

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButtonn ? 50 : 150,
                          height: 50,
                          // color: Colors.deepPurple,
                          alignment: Alignment.center,
                          child: changeButtonn
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   // shape: changeButtonn
                          //   //     ? BoxShape.circle
                          //   //     : BoxShape.rectangle,
                          // ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(maximumSize: Size(150, 40)),
                    //   onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.homeRoute);

                    //     // print("Nice to see You");
                    //   },
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Center(
      //   child: Text(
      //     "Login Page",
      //     style: TextStyle(
      //       fontSize: 20,
      //       color: Colors.blue,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     textScaleFactor: 2.0,
      //   ),
      // ),
    );
  }
}
