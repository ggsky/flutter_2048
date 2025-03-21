import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutter_2048/service/gameInit.dart';
import 'package:flutter_2048/views/blocks.dart';
import 'package:flutter_2048/views/scores.dart';
import '../views/game_bg.dart';
import '../views/mode_selector.dart';
import '../views/playground.dart';
import '../model/display.dart';
import '../reducers/index.dart';
import '../store/game_state.dart';

/// 首页
class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 640));

    return StoreProvider(
      store: Store<GameState>(
        gameReducer,
        middleware: [thunkMiddleware],
        initialState: GameState.initial(4),
      ),
      child: StoreConnector<GameState, GameProps>(
        converter: (store) =>
            GameProps(started: store.state.status.total != null),
        onInit: (store) {
          gameInit(store, 4);
        },
        builder: (context, props) {
          return props.started
              ? Container(
                  margin: EdgeInsets.all(Display.borderMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ModeSelector(),
                      Scores(),
                      Stack(
                        children: [
                          GameBg(),
                          Blocks(),
                          Playground(),
                        ],
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}

class GameProps {
  bool started;

  GameProps({required this.started});
}