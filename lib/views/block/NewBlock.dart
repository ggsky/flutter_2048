import 'package:flutter/material.dart';
import 'package:flutter_2048/views/NumberText.dart';
import 'package:flutter_2048/views/block/BaseBlock.dart';
import 'package:flutter_2048/model/BlockInfo.dart';

class NewBlock extends BaseBlock {
  final BlockInfo info;

  NewBlock({
    Key key,
    this.info,
    AnimationController controller,
  }) : super(
          key: key,
          animation: new Tween<double>(begin: 0.1, end: 1.0).animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable;
    return Positioned(
      top:
          (info.current ~/ props.mode) * (props.blockWidth + props.borderWidth),
      left:
          (info.current % props.mode) * (props.blockWidth + props.borderWidth),
      child: Transform.scale(
        scale: animation.value,
        origin: Offset(0.5, 0.5),
        child: NumberText(value: this.info.value, size: props.blockWidth),
      ),
    );
  }
}
