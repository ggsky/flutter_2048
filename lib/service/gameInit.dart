import 'package:flutter_2048/reducers/updateState.dart';
import 'package:flutter_2048/store/game_state.dart';
import 'package:flutter_2048/model/game_status.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

gameInit(Store<GameState> store, int mode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var key = 'total_' + mode.toString();

  if (store.state.status.total != null &&
      store.state.status.scores > store.state.status.total) {
    prefs.setInt(key, store.state.status.scores);
  }
  var state = GameState.initial(mode);

  state.status = GameStatus(
    adds: 0,
    end: false,
    moves: 0,
    total: prefs.getInt(key) ?? 0,
    scores: 0,
  );

  store.dispatch(UpdateStateAction(state));
}
