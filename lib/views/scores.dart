import 'package:flutter/material.dart';
import 'package:flutter_2048/service/gameInit.dart';
import 'package:flutter_2048/store/game_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_2048/generated/l10n.dart';

class Scores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ScoresProps>(
      converter: (store) => ScoresProps(
        scores: store.state.status.scores,
        total: store.state.status.total,
        isEnd: store.state.status.end,
        reset: () {
          gameInit(store, store.state.mode);
        }, mode: store.state.mode,
      ),
      // onDidChange: (props) {
      //   if (props.isEnd && props.scores > props.total) {
      //     SharedPreferences.getInstance().then((refs) {
      //       refs.setInt('total_' + props.mode.toString(), props.scores);
      //     });
      //   }
      // },
      builder: (context, props) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2048',
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xff776e65),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(23, 5, 23, 5),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            S.of(context).labelScore,
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            props.scores.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(23, 5, 23, 5),
                      decoration: BoxDecoration(
                        color: Color(0xffbbada0),
                        border: Border.all(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            S.of(context).labelBest,
                            style: TextStyle(
                                color: Color(0xffeee4da),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            props.total.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).titleWelcome,
                      style: TextStyle(
                          color: Color(0xff776e65),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      S.of(context).titleWelDesc,
                      style: TextStyle(color: Color(0xff776e65)),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => props.reset(),
                  child: Text(
                    S.of(context).btnNewGame,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ScoresProps {
  ScoresProps({required this.mode, required this.total, required this.scores, required this.isEnd, required this.reset});

  int mode;
  int total;
  int scores;
  bool isEnd;
  Function reset;
}
