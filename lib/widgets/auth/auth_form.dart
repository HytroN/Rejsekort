import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String firstname,
    String lastname,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userPassword = '';
  var _userFirstname = '';
  var _userLastname = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userFirstname.trim(),
        _userLastname.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Tager kun så meget plads som den behøver
                  children: [
                    !_isLogin ? Text('Opret bruger') : Text('Log Ind'),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email adress.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email Adress'),
                      onSaved: (value) {
                        _userEmail = value as String;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('firstname'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter a username that is longer than 4 characters.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Firstname'),
                        onSaved: (value) {
                          _userFirstname = value as String;
                        },
                      ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('lastname'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter a username that is longer than 4 characters.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Lastname'),
                        onSaved: (value) {
                          _userLastname = value as String;
                        },
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must be at least 8 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) {
                        _userPassword = value as String;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      ElevatedButton(
                        onPressed: _trySubmit,
                        child: Text(_isLogin ? 'Login' : 'Signup'),
                      ),
                    if (!widget.isLoading)
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? 'Create a new account'
                            : 'Already have a user? Click here.'),
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
