// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool islogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    islogedin = await googleSignIn.isSignedIn();
    if (islogedin) {
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handlesignin() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    // FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(idToken: googleSignInAuthentication.idToken, accesToken googleSignInAuthentication.accessToken);
    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // insert the user to our collection
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.displayName);
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString("photoUrl", documents[0]["photoUrl"]);
      }
      Fluttertoast.showToast(msg: "login was successfully");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      Fluttertoast.showToast(msg: "Login Faid :(");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: new Text(
      //     "login",
      //     style: TextStyle(color: Colors.red.shade900),
      //   ),
      //   elevation: 0.1,
      // ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "lib/images/back/back2.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("lib/images/back/back3.jpg",
            width: 150.0,
            height: 150.0,
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                //  color: Colors.white.withOpacity(0.7),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 2.0, top: 2.0, bottom: 2.0),
          child: FlatButton(
            color: Colors.red.shade900,
            onPressed: () {
              handlesignin();
            },
            child: Text(
              "sign in / sign up with google",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
