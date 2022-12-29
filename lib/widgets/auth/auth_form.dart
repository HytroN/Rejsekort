import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  var isPasswordVisible = false;
  var _isLogin = true;
  var _userEmail = '';
  var _userPassword = '';
  var _userFirstname = '';
  var _userLastname = '';
  var _userDOB;

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

  Widget _buildTextFormField({
    required String headerText,
    required String valueKey,
    required bool argument,
    required String returnArgument,
    required String formFieldType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText),
        SizedBox(
          height: 10,
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 1,
          child: TextFormField(
            key: ValueKey(valueKey),
            validator: (value) {
              if (argument) {
                return returnArgument;
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: headerText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onSaved: (value) {
              formFieldType = value as String;
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Tager kun så meget plads som den behøver
            children: [
              _isLogin ? Text('Log in') : Text('Create user'),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email Adress'),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email adress.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email Adress',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) {
                      _userEmail = value as String;
                    },
                  ),
                ],
              ),
              if (!_isLogin)
                SizedBox(
                  height: 12,
                ),
              if (!_isLogin)
                TextFormField(
                  key: ValueKey('firstname'),
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter a username that is longer than 4 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Firstname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    _userFirstname = value as String;
                  },
                ),
              if (!_isLogin)
                SizedBox(
                  height: 12,
                ),
              if (!_isLogin)
                TextFormField(
                  key: ValueKey('lastname'),
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return 'Please enter a username that is longer than 4 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Lastname',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    _userLastname = value as String;
                  },
                ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                key: ValueKey('password'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: !isPasswordVisible,
                onSaved: (value) {
                  _userPassword = value as String;
                },
              ),
              SizedBox(
                height: 12,
              ),
              if (widget.isLoading) CircularProgressIndicator(),
              if (!widget.isLoading)
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _trySubmit,
                    child: Text(
                      _isLogin ? 'Login' : 'Signup',
                    ),
                  ),
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
          ),
        ),
      ),
    );
  }
}
