import 'package:flutter_2048/store/game_state.dart';

class UpdateStateAction {
  GameState state;

  UpdateStateAction(this.state);
}

GameState updateState(GameState state, UpdateStateAction action) {
  return action.state;
}
