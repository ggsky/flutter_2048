import 'package:flutter/material.dart';

/// Description: set password and confirm password
/// Time       : 08/04/2023 Friday
/// Author     : liuyuqi.gov@msn.cn
class SetPasswordPage extends StatefulWidget {
  SetPasswordPage({Key? key}) : super(key: key);

  @override
  _SetPasswordPageState createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  TextEditingController _pwdController = TextEditingController();
  bool _isconfirmPwd = false; // 是否输入成功密码

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("青少年模式"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isconfirmPwd ? "确认密码" : "输入密码",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "4个数字",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: _pwdController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            Text("输入正确密码后，将关闭青少年模式"),
            Row(
              children: [Text("忘记密码？"), Text("点击申诉")],
            ),
            // button: next
            TextButton(
                onPressed: () {
                  next();
                },
                child: Text("下一步"))
          ],
        )),
      ),
    );
  }

  /// 下一步
  void next() {
    if (_pwdController.text.length == 4) {
      // 密码长度为4
      if (_isconfirmPwd) {
        // 确认密码
        if (_pwdController.text == "1234") {
          // 密码正确
          Navigator.pop(context);
        } else {
          // 密码错误
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("密码错误"),
          ));
        }
      } else {
        // 输入密码
        setState(() {
          _isconfirmPwd = true;
          _pwdController.text = "";
        });
      }
    } else {
      // 密码长度不为4
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("密码长度不为4"),
      ));
    }
  }
}
