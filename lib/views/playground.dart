import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../reducers/moveDown.dart';
import '../reducers/moveLeft.dart';
import '../reducers/moveRight.dart';
import '../reducers/moveUp.dart';
import '../store/game_state.dart';
import '../utils/screen.dart';

const pressTimeout = 200;
const dragLength = 300;
/// 上下左右滑动事件
class Playground extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, PlaygroundProps>(
      converter: (store) {
        return PlaygroundProps(
          end: store.state.status.end,
          mode: store.state.mode,
          startTime: 0,
          onDown: () => store.dispatch(MoveDownAction()),
          onLeft: () => store.dispatch(MoveLeftAction()),
          onRight: () => store.dispatch(MoveRightAction()),
          onUp: () => store.dispatch(MoveUpAction()),
        );
      },
      builder: (context, props) {
        return props.end != true
            ? Center(
              child: GestureDetector(
                  onHorizontalDragStart: (evt) => onDragStart(evt, props),
                  onHorizontalDragEnd: (evt) => onHorizontalDragEnd(evt, props),
                  onVerticalDragStart: (evt) => onDragStart(evt, props),
                  onVerticalDragEnd: (evt) => onVerticalDragEnd(evt, props),
                  child: Container(
                    color: Colors.transparent,
                    height: Screen.stageWidth,
                  ),
                ),
            )
            : Center(child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(255, 255, 255, 0.4)),
                  height: Screen.stageWidth,
                  child: Center(
                    child: Text(
                      'Game Over',
                      style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff776e65),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),);
      },
    );
  }

  void onDragStart(DragStartDetails evt, PlaygroundProps props) {
    props.startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void onHorizontalDragEnd(DragEndDetails evt, PlaygroundProps props) {
    if (DateTime.now().millisecondsSinceEpoch - props.startTime >
            pressTimeout ||
        evt.primaryVelocity!.abs() < dragLength) return;

    if (evt.primaryVelocity! > 0) {
      props.onRight();
    } else {
      props.onLeft();
    }
  }

  void onVerticalDragEnd(DragEndDetails evt, PlaygroundProps props) {
    if (DateTime.now().millisecondsSinceEpoch - props.startTime >
            pressTimeout ||
        evt.primaryVelocity!.abs() < dragLength) return;
    // 是否ios和android纵轴是相反的？
    if (evt.primaryVelocity! < 0) {
      props.onUp();
    } else {
      props.onDown();
    }
  }
}

class PlaygroundProps {
  int mode;
  bool end;
  int startTime;
  Function onLeft;
  Function onRight;
  Function onUp;
  Function onDown;

  PlaygroundProps({
    required this.end,
    required this.mode,
    required this.startTime,
    required this.onDown,
    required this.onLeft,
    required this.onRight,
    required this.onUp,
  });
}
