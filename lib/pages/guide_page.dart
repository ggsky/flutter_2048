import 'package:flutter/material.dart';
import 'package:flutter_2048/pages/index_page.dart';
import 'package:intro_slider/intro_slider.dart';

/// Description: 新手引导页
/// Time       : 04/30/2023 Sunday
/// Author     : liuyuqi.gov@msn.cn
class GuidePage extends StatelessWidget {
  GuidePage({super.key});

  List<ContentConfig> listContentConfig = [
    ContentConfig(
      title: "2048小游戏好玩",
      description: "点击查看",
      // pathImage: "assest/image/facebook.jpg",
      backgroundColor: Color(0xff203152),
    ),
    ContentConfig(
      title: "有趣",
      description: "点击查看",
      // pathImage: "assest/image/google.jpg",
      backgroundColor: Color(0xff203152),
    ),
    ContentConfig(
      title: "不沉迷",
      description: "点击查看",
      // pathImage: "assets/image/twitter.jpg",
      backgroundColor: Color(0xff203152),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: () => onDonePress(context),
      onSkipPress: () => onDonePress(context),
    );
  }

  /// 完成之后到首页
  void onDonePress(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return IndexPage();
    }));
  }
}
