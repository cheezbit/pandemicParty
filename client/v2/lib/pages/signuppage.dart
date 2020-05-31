import 'loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';
import 'package:mdi/mdi.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int emailLength = 0;
  int passwordLength = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Sign Up"),
        heroTag: "SMH",
        transitionBetweenRoutes: false,
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Enter your email",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CupertinoTextField(
                    controller: this.emailController,
                    autofocus: true,
                    prefix: Icon(
                      CupertinoIcons.mail_solid,
                    ),
                    placeholder: "Email",
                    onChanged: (v) {
                      setState(() {
                        this.emailLength = v.length;
                      });
                    },
                    onSubmitted: (v) {
                      this.focusNode.requestFocus();
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Container(
                  height: 8,
                ),
                Text(
                  "Enter your Password",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CupertinoTextField(
                    controller: this.passwordController,
                    autofocus: true,
                    focusNode: this.focusNode,
                    obscureText: true,
                    placeholder: "Password",
                    prefix: Icon(
                      Mdi.lock,
                    ),
                    onChanged: (v) {
                      setState(() {
                        this.passwordLength = v.length;
                      });
                    },
                    onSubmitted: (v) {
                      print(v);
                      if (v.length < 6) {
                        print("HMMM");
                        showCupertinoDialog(
                          context: context,
                          builder: (c) => CupertinoAlertDialog(
                            title: Text("Make your password longer"),
                            content: Text(
                                "Your title must be atleast 6 characters long."),
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Ok"),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        );
                      } else {
                        signUp();
                      }
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Container(
                  height: 8,
                ),
                if (emailController.text.contains("@") && passwordLength >= 6)
                  CupertinoButton.filled(
                    child: Text("Submit"),
                    onPressed: () {
                      signUp();
                    },
                  ),
                Container(
                  height: 8,
                ),
                Divider(),
                CupertinoButton(
                  child: Text("Already have an account?"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (c) => LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> signUp() async {
    SignUpResult result;
    try {
      result = await Cognito.signUp(
        this.emailController.text,
        this.passwordController.text,
      );
      print(result.toString());
    } catch (e) {
      print(e);
    }
    if (result != null) {
      await showCupertinoDialog(
        context: context,
        builder: (c) => CupertinoAlertDialog(
          title: Text("Account Created"),
          content: Text("To access your account, please "),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "Ok",
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      );
      Cognito.signIn(
        this.emailController.text,
        this.passwordController.text,
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (c) => CupertinoAlertDialog(
          title: Text("Unable to sign up"),
          content: Text("SMH WHAT DID U DO ISABELLE?xw"),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "Ok",
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      );
    }
  }
}
