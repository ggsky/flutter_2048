import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2048/views/number_text.dart';
import 'package:flutter_2048/views/block/base_block.dart';
import 'package:flutter_2048/model/block_info.dart';

class StaticBlock extends BaseBlock {
  final BlockInfo info;

  StaticBlock({
    Key? key,
    required this.info,
    required AnimationController controller,
  }) : super(
          key: key,
          animation:
              Tween<double>(begin: 0.0, end: 0.0).animate(controller),
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
