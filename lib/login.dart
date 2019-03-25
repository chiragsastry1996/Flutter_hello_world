import 'dart:async';
import 'dart:convert';
import 'utils_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hello_world/formvalidator.dart';
import 'pin_setup.dart';
import 'register.dart';

void main() => runApp(Login());

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _autoValidate = false, isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _userid, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormValidator validator = FormValidator();

  Future<void> loginSubmit() async {
    FocusScope.of(context).requestFocus(new FocusNode());


    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_password != null) {
        setState(() {
          isLoading = true;
        });
        try {
          final http.Response response = await http.post(utils_app().endpoint + "login",
            body: {
              "userId": utils_app().decrypt_text(_userid),
              "password": utils_app().decrypt_text(_password)
            });
          setState(() {
            isLoading = false;
          });
          Map jsonResponse = json.decode(response.body);
          if(jsonResponse["error"]) {
            _scaffoldKey.currentState.showSnackBar(
                    new SnackBar(duration: new Duration(seconds: 2), content:
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 5),
                      child: Text(jsonResponse["message"],
                      style: TextStyle(
                        fontSize: 15
                      ),),
                    )
                    ));
          } else {
            print(jsonResponse["token"]);
            await utils_app().storage.write(key: "userid", value: _userid);
            await utils_app().storage.write(key: "password", value: _password);
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PinSetup()));
          }

        } catch (Error) {
          print(Error);
          _scaffoldKey.currentState.showSnackBar(
                  new SnackBar(duration: new Duration(seconds: 2), content:
                  Padding(
                    padding: const EdgeInsets.only(top: 0,left: 5),
                    child: Text("Oops!! Unexpected error occured",
                      style: TextStyle(
                              fontSize: 15
                      ),),
                  )
                  ));
        }


      } else
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
      key: _scaffoldKey,
      appBar: new AppBar(centerTitle: true, title: Text("DBS")),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            isLoading ? LinearProgressIndicator() : Container(),
            Container(
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
                          "LOGIN",
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
                                      left: 35, right: 35, top: 45, bottom: 45),
                                  child: Form(
                                    key: _formKey,
                                    autovalidate: _autoValidate,
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
                                          child: Text("YOUR USER-ID"),
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
                                            onSaved: (String val) => _userid = utils_app().encrypt_text(val),
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
                                            obscureText: true,
                                            validator: validator.validatePassword,
                                            onSaved: (String val) => _password = utils_app().encrypt_text(val),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40,
                                              bottom: 20,
                                              left: 0,
                                              right: 0),
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Register()));
                                              },
                                              child:
                                                  Text("NEW USER? REGISTER HERE")),
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
                                onPressed: loginSubmit,
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
          ],
        ),
      ),
    );
  }
}
