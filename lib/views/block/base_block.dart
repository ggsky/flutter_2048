import 'package:flutter/widgets.dart';
import 'package:flutter_2048/store/game_state.dart';
import 'package:flutter_2048/utils/screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

/// AnimatedWidget 是一个抽象类，它继承自 StatefulWidget，它的作用是根据监听的动画的变化来刷新 UI。
abstract class BaseBlock extends AnimatedWidget {
  BaseBlock({Key? key, required Animation animation})
      : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, BlockProps>(
      converter: (store) => BlockProps(
        blockWidth: Screen.getBlockWidth(store.state.mode),
        borderWidth: Screen.getBorderWidth(store.state.mode),
        mode: store.state.mode,
      ),
      builder: buildBlock,
    );
  }

  @protected
  Widget buildBlock(
    BuildContext context,
    BlockProps props,
  );
}

class BlockProps {
  double blockWidth;
  double borderWidth;
  int mode;

  BlockProps(
      {required this.blockWidth,
      required this.borderWidth,
      required this.mode});
}
