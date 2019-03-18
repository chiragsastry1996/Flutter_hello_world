import 'dart:async';

import 'package:flutter/material.dart';
import 'login.dart';
import 'formvalidator.dart';

void main() => runApp(Register());

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _autoValidate = false;
  String _userid, _password, _passwordchk, _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormValidator validator = FormValidator();

  Future<void> form_submit() async {
    FocusScope.of(context).requestFocus(new FocusNode());


    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_password == _passwordchk){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login()));
      }
      else
        print("Password not matching");
    } else {
      setState(() => _autoValidate = true);
      return;
    }



  }

  @override
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("DBS"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: screen_width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Text(
                      "REGISTER",
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 45),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 35, right: 35, top: 15, bottom: 55),
                              child: Form(
                                autovalidate: _autoValidate,
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25,
                                          bottom: 0,
                                          left: 0,
                                          right: 0),
                                      child: Text("USER ID"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 0,
                                          right: 0),
                                      child: TextFormField(
                                        autofocus: false,
                                        validator: validator.validateID,
                                        keyboardType: TextInputType.text,
                                        onSaved: (String val) => _userid = val,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25,
                                          bottom: 0,
                                          left: 0,
                                          right: 0),
                                      child: Text("YOUR E-MAIL"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 0,
                                          right: 0),
                                      child: TextFormField(
                                        validator: validator.validateEmail,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onSaved: (String val) => _email = val,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25,
                                          bottom: 0,
                                          left: 0,
                                          right: 0),
                                      child: Text("PASSWORD"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 0,
                                          right: 0),
                                      child: TextFormField(
                                        validator: validator.validatePassword,
                                        obscureText: true,
                                        onSaved: (String val) =>
                                            _password = val,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25,
                                          bottom: 0,
                                          left: 0,
                                          right: 0),
                                      child: Text("CONFIRM PASSWORD"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          bottom: 10,
                                          left: 0,
                                          right: 0),
                                      child: TextFormField(
                                        validator: validator.validatePassword,
                                        obscureText: true,
                                        onFieldSubmitted: (String val) =>
                                        _passwordchk = val,
                                        onSaved: (String val) =>
                                            _passwordchk = val,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: RaisedButton(
                          color: const Color(0xff303030),
                            onPressed: form_submit,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("GO -->  ",
                              style: TextStyle(
                                color: Colors.white
                              ),),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
