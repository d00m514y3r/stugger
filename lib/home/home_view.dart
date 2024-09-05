// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var word = appState.current;
//     final theme = Theme.of(context);

//     final titleText = Padding(
//       padding: const EdgeInsets.only(top: 13.0),
//       child: Text("Here's a word generator for ya!",
//           style: theme.textTheme.displayMedium),
//     );

//     final wordCard = BigCard(word: word);

//     final nextButton = SmallButton(action: appState.getNext, text: "Next");

//     final likeButton =
//         SmallButton(text: 'Like', action: appState.toggleFavorite);

//     return Scaffold(
//         body: Row(
//       children: [
//         NavigationRail(destinations: [
//           NavigationRailDestination(
//               icon: Icon(Icons.home), label: Text('Generate')),
//           NavigationRailDestination(
//               icon: Icon(Icons.heat_pump_rounded), label: Text('Liked'))
//         ], selectedIndex: 0),
//         Center(
//           child: Column(children: [
//             titleText,
//             wordCard,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [nextButton, likeButton],
//             )
//           ]),
//         ),
//       ],
//     ));
//   }
// }
