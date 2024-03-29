import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String firstname,
    String lastname,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user?.uid)
            .set(
          {
            'firstname': firstname,
            'lastname': lastname,
            'email': email,
          },
        );
        DocumentReference ref = await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user?.uid)
            .collection('cards')
            .add({
          'money': 0,
          'type': 'rejsekort',
          'timestamp': Timestamp.now(),
        });

        String documentId = ref.id;

        await ref.set({
          'id': documentId,
          'money': 0,
          'type': 'rejsekort',
          'timestamp': Timestamp.now(),
        });
      }
    } on FirebaseAuthException catch (err) {
      String message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message as String;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 241, 245, 1),
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
