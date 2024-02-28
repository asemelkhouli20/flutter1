import 'package:flutter/material.dart';
import 'package:namer_app/history_kist_view.dart';
import 'big_card.dart';
import '/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final pair = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: HistoryListView()),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          GeneratorAcation(appState: appState),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}

class GeneratorAcation extends StatelessWidget {
  const GeneratorAcation({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    final pair = appState.current;
    final isFav = appState.favorites.contains(pair);
    IconData icon = isFav ? Icons.favorite : Icons.favorite_border;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: appState.toggleFavorite,
          icon: Icon(icon),
          label: Text("Like"),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: appState.goNext,
          child: Text("Next"),
        ),
      ],
    );
  }
}
