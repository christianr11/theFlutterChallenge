import 'package:flutter/material.dart';
import 'package:flutterChallenge/blocs/login/login_block.dart';
import 'package:flutterChallenge/blocs/login/login_event.dart';
import 'package:flutterChallenge/blocs/login/login_state.dart';
import 'package:flutterChallenge/ui/pages/navigation.dart';
import 'package:flutterChallenge/ui/widgets/loading_widget.dart';
import 'package:flutterChallenge/ui/widgets/main_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: GestureDetector(
                onTap: () {
                  loginBloc.add(LoginButtonEvent(
                      email: email.text, password: password.text));
                },
                child: MainButtonWidget(
                  title: "Login",
                  height: 50.0,
                ),
              ),
            ),
            Container(
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNavigation(),
                        ));
                  } else if (state is LoginFailureState) {
                    final snackBar =
                        SnackBar(content: Text('Login Error. Try again!'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: LoadingWidget(),
                      ));
                    } else if (state is LoginSuccessState) {
                      return Container();
                    } else if (state is LoginFailureState) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
