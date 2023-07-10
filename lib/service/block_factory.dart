import 'package:flutter/widgets.dart';
import 'package:flutter_2048/views/block/combin_block.dart';
import 'package:flutter_2048/views/block/move_block.dart';
import 'package:flutter_2048/views/block/new_block.dart';
import 'package:flutter_2048/views/block/static_block.dart';
import 'package:flutter_2048/model/block_info.dart';

class BlockFactory {
  late AnimationController combinController;
  late AnimationController addController;
  late AnimationController moveController;
  int _mode = 0;

  BlockFactory(TickerProvider provider, int mode) {
    combinController = AnimationController(
        duration: const Duration(milliseconds: 60), vsync: provider);
    addController = AnimationController(
        duration: const Duration(milliseconds: 80), vsync: provider);
    moveController = AnimationController(
        duration: const Duration(milliseconds: 95), vsync: provider);
    _mode = mode;
  }

  Widget create(BlockInfo info) {
    if (info.myis) {
      return NewBlock(
        info: info,
        controller: this.addController,
      );
    }

    if (info.needMove && info.needCombine) {
      return CombinBlock(
        info: info,
        mode: _mode,
        combinController: combinController,
        moveController: moveController,
      );
    }

    if (info.needMove && info.needCombine != true) {
      return MoveBlock(info: info, mode: _mode, controller: moveController);
    }

    return StaticBlock(
      info: info,
      controller: this.addController,
    );
  }

  play() {
    moveController.forward().whenComplete(() {
      addController.forward();
      combinController.forward().whenComplete(() {
        combinController.reverse();
      });
    });
  }
}
