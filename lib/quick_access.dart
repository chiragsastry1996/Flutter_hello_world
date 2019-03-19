import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hello_world/formvalidator.dart';
import 'menu.dart';
import 'login.dart';
import 'utils_app.dart';
void main() => runApp(QuickAccess());

class QuickAccess extends StatefulWidget {
  @override
  _QuickAccessState createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {

  bool _autoValidate = false;
  String _pin;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text("Incorrect PIN"));
  FormValidator validator = FormValidator();

  Future<void> pin_submit() async {

    String pin_object = await utils_app().storage.read(key: "pin");
    String userid_object = await utils_app().storage.read(key: "userid");
    String password_object = await utils_app().storage.read(key: "password");

    String pin = utils_app().decrypt_text(pin_object);
    String user_id = utils_app().decrypt_text(userid_object);
    String password = utils_app().decrypt_text(password_object);

    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if(_pin==pin){
        Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                        builder: (context) => Menu()));
      }
      else
        _scaffoldKey.currentState.showSnackBar(snackBar);
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
      appBar: new AppBar(
        centerTitle: true,
        title: Text("DBS")
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
                    "QUICK ACCESS",
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                                    top: 25, bottom: 0, left: 0, right: 0),
                                  child: Text("Enter Quick Access Code"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0, bottom: 10, left: 0, right: 0),
                                  child: TextFormField(
                                    autofocus: false,
                                    keyboardType: TextInputType.phone,
                                    validator: validator.validatePin,
                                    obscureText: true,
                                    onSaved: (String val) => _pin = val,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 0, right: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login())
                                      );
                                    },
                                    child: Text("FORGOT PASSWORD? CLICK HERE")),
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
                        onPressed: pin_submit,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("GO -->  ",
                            style: TextStyle(
                                    color: Colors.white
                            ),),
                        )
                      ),
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
