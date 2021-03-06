import 'package:flutter/material.dart';

import 'login_presenter.dart';
import '../../components/components.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginHeader(),
          Headline1(text: 'Login'),
          Padding(
            padding: EdgeInsets.all(32),
            child: Form(
                child: Column(
              children: [
                StreamBuilder<String>(
                    stream: presenter.emailErrorStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: presenter.validateEmail,
                      );
                    }),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: StreamBuilder<String>(
                      stream: presenter.passwordErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Senha',
                                icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
                                errorText: snapshot.data?.isEmpty == true ? null : snapshot.data),
                            obscureText: true,
                            onChanged: presenter.validatePassword);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 32),
                  child: StreamBuilder<bool>(
                      stream: presenter.isFormValidStream,
                      builder: (context, snapshot) {
                        return RaisedButton(onPressed: snapshot.data == true ? () {} : null, child: Text('Entrar'.toUpperCase()));
                      }),
                ),
                FlatButton.icon(onPressed: () {}, icon: Icon(Icons.person), label: Text('Criar Conta'))
              ],
            )),
          )
        ],
      )),
    );
  }
}
