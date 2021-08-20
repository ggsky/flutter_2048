import 'package:flutter/material.dart';
import 'package:flutter_2048/service/gameInit.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/game_state.dart';

// 选择模式界面
class ModeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ModeSelectorProps>(
      converter: (store) {
        return ModeSelectorProps(
          mode: store.state.mode,
          onChange: (mode) => gameInit(store, mode),
        );
      },
      builder: (context, vm) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: () => vm.onChange(3),
                child: Text('3 x 3'),
              ),
              TextButton(
                onPressed: () => vm.onChange(4),
                child: Text('4 x 4'),
              ),
              TextButton(
                onPressed: () => vm.onChange(6),
                child: Text('6 x 6'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ModeSelectorProps {
  ModeSelectorProps({this.mode, this.onChange});

  int mode;
  Function onChange;
}
