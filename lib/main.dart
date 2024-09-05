import 'package:flutter/material.dart';
import 'pomodoro.dart';
import 'main_theme.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: defaultTheme,
    home: Scaffold(
      appBar: AppBar(
        title: Text("TitleBar Text"),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavBarCons(selectedIndex: _selectedIndex, x: (int index) =>
            setState(() => _selectedIndex = index)),
          ContentPage(pageStatus: _selectedIndex)
        ],
      ),
    ),
  ); 
}

class ContentPage extends StatelessWidget {
  ContentPage({
    super.key,
    required this.pageStatus,
  });
  
  final int pageStatus;

  @override
  Widget build(BuildContext context) {
    return switch (pageStatus) {
      1 => PomodoroWidget(),        
      _ => Text("others")
    };
  }
}

//class BasicTextWidget extends StatelessWidget {
//   BasicTextWidget({
//     super.key,
//     required this.text,
//     this.padding = const EdgeInsets.all(8.0)
//   });

//   final EdgeInsets padding;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding,
//       child: Text(text),
//     );
//   }
// }