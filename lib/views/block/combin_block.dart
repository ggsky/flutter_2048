import 'package:flutter/material.dart';
import 'package:flutter_2048/views/number_text.dart';
import 'package:flutter_2048/views/block/base_block.dart';
import 'package:flutter_2048/views/block/move_block.dart';
import 'package:flutter_2048/model/block_info.dart';

class CombinBlock extends BaseBlock {
  final BlockInfo info;
  final int mode;
  final AnimationController moveController;

  CombinBlock({
    Key? key,
    required this.info,
    required this.mode,
    required this.moveController,
    required AnimationController combinController,
  }) : super(
          key: key,
          animation:
              Tween<double>(begin: 1, end: 1.25).animate(combinController),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable as Animation<double>;
    return Stack(
      fit: StackFit.expand,
      children: [
        MoveBlock(
          info: BlockInfo(
            myis: false,
            value: info.value ~/ 2,
            before: info.before,
            current: info.current,
          ),
          mode: mode,
          controller: moveController,
        ),
        Positioned(
          top: (info.current ~/ props.mode) *
              (props.blockWidth + props.borderWidth),
          left: (info.current % props.mode) *
              (props.blockWidth + props.borderWidth),
          child: Transform.scale(
            scale: animation.value,
            origin: Offset(0.5, 0.5),
            child: NumberText(value: this.info.value, size: props.blockWidth),
          ),
        )
      ],
    );
  }
}
