import 'package:flutter/material.dart';

/// Description: 登录界面
/// Time       : 05/01/2023 Monday
/// Author     : liuyuqi.gov@msn.cn
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "密码不能为空";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("用户名：${userNameController.text}");
                print("密码：${passwordController.text}");
              },
              child: Text("登录"),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    // if form.validate()验证表单
  }
}
