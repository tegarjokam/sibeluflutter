import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/bloc/login/login_bloc.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/models/login/login_body.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';
import 'package:sibeluapp/widget/widget_card_loading.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = LoginBloc(LoginInitial());
  ApiAuthRepository apiAuthRepository = ApiAuthRepository();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  String result;

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerUsername,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Your Username / NIP',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return CircularProgressIndicator();
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () {
                print('Login Button Pressed');
                _loginBloc.add(
                  LoginEvent(
                    LoginBody(_controllerUsername.text,
                        _controllerPassword.text, 'password'),
                  ),
                );
                // apiAuthRepository
                //     .postLoginUser(LoginBody(
                //         '199803162018121003', '199803162018121003', 'password'))
                //     .then((token) async {
                //   print('token ===> ' + token.accessToken);
                //   await sharedPreferencesManager.putString(
                //       SharedPreferencesManager.keyAccessToken, token.accessToken);
                //   apiAuthRepository.getProfile().then((value) {
                //     setState(() {
                //       result = value.fullName;
                //     });
                //   });
                // });
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: BlocProvider<LoginBloc>(
        create: (context) => _loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, state) {
            if (state is LoginFailure) {
              String title = 'info';
              showDialog(
                context: context,
                builder: (context) {
                  if (Platform.isIOS) {
                    return CupertinoAlertDialog(
                      title: Text(title),
                      content: Text(state.error),
                    );
                  } else {
                    return AlertDialog(
                      title: Text(title),
                      content: Text(state.error),
                    );
                  }
                },
              );
            } else if (state is LoginSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/landing-login-page', (r) => false);
            }
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/bg_landing.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.3),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildUsernameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildLoginBtn(),
                      result == null
                          ? Center(
                              child: Text(
                                'Result in here',
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Center(
                              child: Text(
                                result,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
