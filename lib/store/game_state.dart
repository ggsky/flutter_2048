import 'dart:math';

import 'package:flutter_2048/model/block_info.dart';
import 'package:flutter_2048/model/game_status.dart';

class GameState {
  GameState({required this.data, required this.status, required this.mode});

  int mode;
  GameStatus status;
  List<List<BlockInfo>> data;

  /// 初始化
  static GameState initial(int mode) {
    var random = Random(DateTime.now().millisecondsSinceEpoch);
    var gamesize = mode * mode;
    var block1 = random.nextInt(gamesize);
    var block2 = random.nextInt(gamesize);

    while (block1 == block2) {
      block2 = random.nextInt(gamesize);
    }

    var newdata = <List<BlockInfo>>[];

    for (var i = 0; i < mode; i++) {
      var row = <BlockInfo>[];
      for (var j = 0; j < mode; j++) {
        var current = i * mode + j;
        row.add(BlockInfo(
            before: current,
            value: current == block1 || current == block2 ? 2 : 0,
            current: current));
      }
      newdata.add(row);
    }

    return GameState(
      mode: mode,
      status: GameStatus(end: false, scores: 0, total: 0, adds: 0, moves: 0),
      data: newdata,
    );
  }

  BlockInfo getBlock(int i, int j) {
    return this.data[i][j];
  }

  void update() {
    // 获取空格数, 将上一次的所有格子设成旧的
    int count = 0;
    for (var i = 0; i < mode; i++) {
      for (var j = 0; j < mode; j++) {
        var block = getBlock(i, j);
        block.myis = false;
        if (block.value == 0) {
          count++;
        }
      }
    }

    // 有空格
    if (count > 0) {
      // 生成新的数字
      var random = Random(DateTime.now().millisecondsSinceEpoch);
      var newpos = getBlankPosition(random.nextInt(count));

      var newblock = getBlock(newpos ~/ mode, newpos % mode);
      newblock.value = (random.nextInt(2) + 1) * 2;
      newblock.before = newblock.current = newpos;
      newblock.myis = true;
      newblock.needCombine = newblock.needMove = false;
    }

    // 检测
    status.end = false;
    if (count <= 1) {
      status.end = isEnd();
    }
  }

  bool isEnd() {
    int i, j;
    for (i = 0; i < mode; i++) {
      for (j = 0; j < mode - 1; j++) {
        if (data[i][j].value == data[i][j + 1].value) {
          return false;
        }
      }
    }

    for (j = 0; j < mode; j++) {
      for (i = 0; i < mode - 1; i++) {
        if (data[i][j].value == data[i + 1][j].value) {
          return false;
        }
      }
    }
    return true;
  }

  int getBlankPosition(int blank) {
    var index = 0;
    for (int i = 0; i < mode; i++) {
      for (int j = 0; j < mode; j++) {
        if (getBlock(i, j).value == 0) {
          if (index == blank) {
            return i * mode + j;
          } else {
            index++;
          }
        }
      }
    }
    return -1;
  }

  void swapBlock(int block1, int block2) {
    data[block1 ~/ mode][block1 % mode].current = block2;
    data[block1 ~/ mode][block1 % mode].before = block1;
    data[block2 ~/ mode][block2 % mode].current = block1;
    data[block2 ~/ mode][block2 % mode].before = block2;
    var temp = data[block1 ~/ mode][block1 % mode];
    data[block1 ~/ mode][block1 % mode] = data[block2 ~/ mode][block2 % mode];
    data[block2 ~/ mode][block2 % mode] = temp;
  }

  GameState clone() {
    var newdata = <List<BlockInfo>>[];
    for (var i = 0; i < mode; i++) {
      var row = <BlockInfo>[];
      for (var j = 0; j < mode; j++) {
        row.add(BlockInfo(
          current: data[i][j].current,
          value: data[i][j].value,
          myis: false,
          before: data[i][j].before,
        ));
      }
      newdata.add(row);
    }

    return GameState(
      data: newdata,
      mode: this.mode,
      status: GameStatus(
        adds: this.status.adds,
        end: this.status.end,
        moves: this.status.moves,
        scores: this.status.scores,
        total: this.status.total,
      ),
    );
  }
}
