import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2048/views/NumberText.dart';
import 'package:flutter_2048/views/block/BaseBlock.dart';
import 'package:flutter_2048/model/BlockInfo.dart';

class StaticBlock extends BaseBlock {
  final BlockInfo info;

  StaticBlock({
    Key key,
    this.info,
    AnimationController controller,
  }) : super(
          key: key,
          animation:
              new Tween<double>(begin: 0.0, end: 0.0).animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    return Positioned(
      top:
          (info.current ~/ props.mode) * (props.blockWidth + props.borderWidth),
      left:
          (info.current % props.mode) * (props.blockWidth + props.borderWidth),
      child: NumberText(value: this.info.value, size: props.blockWidth),
    );
  }
}
