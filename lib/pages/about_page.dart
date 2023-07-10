import 'package:flutter/material.dart';

/// Description: 关于界面
/// Time       : 04/30/2023 Sunday
/// Author     : liuyuqi.gov@msn.cn
class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("About Me"),
    );
  }
}