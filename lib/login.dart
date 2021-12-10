import 'package:adt_demo_webview/home.dart';
import 'package:adt_demo_webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Kiểm tra show/hide pass
  bool _showPass = false;

  // Lấy user + pass
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  // Check valid
  var _isEmptyUser = false;
  var _isEmptyPass = false;
  var _emptyErr = "Không được để rỗng";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
        constraints: BoxConstraints.expand(),
        // Background
        color: Colors.white,
        // Tạo cloumn để sắp xếp các widget từ trên xuống dưới
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Căn dưới
            mainAxisAlignment: MainAxisAlignment.end,
            // Logo
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(15),
                    // Hình tròn
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Image.asset('assets/images/adt_logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Chào mừng quay trở lại",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _userController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      errorText: _isEmptyUser ? _emptyErr : null,
                      labelText: "Tài khoản",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 16.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: _passController,
                      obscureText: !_showPass, // Set pass thanh *****
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: _isEmptyPass ? _emptyErr : null,
                          labelText: "Mật khẩu",
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 16.0)),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(_showPass ? "Ẩn" : "Hiện",
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    onPressed: onSignInClicked,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text("Đăng Nhập",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "ĐĂNG NHẬP BẰNG SDT",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                    Text(
                      "QUÊN MẬT KHẨU?",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (_userController.text.length <= 0) {
        _isEmptyUser = true;
      } else {
        _isEmptyUser = false;
      }
      if (_passController.text.length <= 0) {
        _isEmptyPass = true;
      } else {
        _isEmptyPass = false;
      }

      // Login
      if (!_isEmptyPass && !_isEmptyUser) {
        // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return Home();
  }
}
