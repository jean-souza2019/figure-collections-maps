import 'package:figure_collections_maps/providers/GeneralProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:figure_collections_maps/screens/our_map.dart';
import 'package:flutter/material.dart';
import 'package:figure_collections_maps/utils/reusable_widgets.dart';
import 'package:figure_collections_maps/screens/signup.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  // late GeneralProvider _generalProvider;
  //
  // void _incrementEmail(email) {
  //   print('passou no _incrementEmail');
  //   _generalProvider.incrementEmail(email);
  // }

  @override
  Widget build(BuildContext context) {
    // _generalProvider = Provider.of<GeneralProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Login",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Senha", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Entrar", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(
                                create: (context) => GeneralProvider(),
                                child: const Mapa())));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Não tem uma conta?", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            " Cadastre-se",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Esqueceu sua senha?",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp())),
      ),
    );
  }
}
