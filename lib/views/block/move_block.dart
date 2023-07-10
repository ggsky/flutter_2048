import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2048/views/number_text.dart';
import 'package:flutter_2048/views/block/base_block.dart';
import 'package:flutter_2048/model/block_info.dart';

double getBegin(BlockInfo info, int mode) {
  return (info.current % mode == info.before % mode
          ? info.before ~/ mode - info.current ~/ mode
          : info.before % mode - info.current % mode) *
      1.0;
}

class MoveBlock extends BaseBlock {
  final BlockInfo info;
  final int mode;

  MoveBlock({
    Key? key,
    required this.info,
    required this.mode,
    required AnimationController controller,
  }) : super(
          key: key,
          animation: Tween<double>(begin: getBegin(info, mode), end: 0)
              .animate(controller),
        );

  @override
  Widget buildBlock(BuildContext context, BlockProps props) {
    Animation<double> animation = listenable as Animation<double>;
    var direction = info.current % mode == info.before % mode ? 1 : 0;
    return Positioned(
      top:
          (info.current ~/ props.mode) * (props.blockWidth + props.borderWidth),
      left:
          (info.current % props.mode) * (props.blockWidth + props.borderWidth),
      child: Transform.translate(
        offset: direction == 0
            ? Offset(
                animation.value * (props.blockWidth + props.borderWidth), 0)
            : Offset(
                0, animation.value * (props.blockWidth + props.borderWidth)),
        child: NumberText(value: this.info.value, size: props.blockWidth),
      ),
    );
  }
}

void getDirection(double current, double before) {}
