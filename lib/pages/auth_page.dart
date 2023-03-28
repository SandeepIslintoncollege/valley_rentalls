import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valleyrentals/Utilities/snackbars.dart';
import 'package:valleyrentals/models/user_request_model.dart';
import 'package:valleyrentals/pages/dashboard_page.dart';
import 'package:valleyrentals/services/auth_service.dart';
import 'package:valleyrentals/widgets/auth_form.dart';

import '../providers/profile_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const routeName = '/registerPage';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  void _sumbitAuthForm(
    int contact,
    String email,
    String password,
    String userName,
    bool isSign,
    String gender,
    String dob,
    VoidCallback goToSignIN,
  ) async {
    final UserRequestModel userToBeRegistered = UserRequestModel(
      name: userName,
      contact: contact,
      email: email,
      password: password,
      gender: gender,
      dob: dob,
    );
    setState(() {
      _isLoading = true;
    });
    if (!isSign) {
      // use registerAPI
      await AuthService.registerUser(userToBeRegistered).then((_) {
        goToSignIN();
        SnackBars.showNormalSnackbar(context, 'Registered Successfully!!');
      }).catchError((e) {
        print(e.toString());
        SnackBars.showNormalSnackbar(context, e);
      });
    } else {
      // use signInAPI
      await AuthService.signInuser(email, password).then((_) async {
        print('here');
        try {
          await Provider.of<ProfileProvider>(context, listen: false)
              .getMyProfile()
              .then((_) {
            Navigator.pushReplacementNamed(context, DashboardPage.routeName);
          });
        } on SocketException {
          SnackBars.showNormalSnackbar(context, 'No Internet connection');
        } catch (e) {
          SnackBars.showNormalSnackbar(context, 'Something went wrong');
        }
      }).catchError((e) {
        print(e);
        SnackBars.showNormalSnackbar(context, e);
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AuthForm(
          submitAuthForm: _sumbitAuthForm,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
