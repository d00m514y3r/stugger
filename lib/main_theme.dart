import 'package:flutter/material.dart';

var defaultTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark
  ),
  navigationRailTheme: railTheme,
  appBarTheme: AppBarTheme(
    // color: Colors.blue,
    centerTitle: true,
  ),

);

var railTheme = NavigationRailThemeData(
    elevation: 20.0,
  );

class NavBarCons extends StatelessWidget {  
  NavBarCons({
    super.key,
    required this.selectedIndex,
    required this.x
  });

  static const railNames = ["Home", "Pomodoro", "Analysis", "Schedule", "Lessons"];
  final int selectedIndex;
  final void Function(int) x;
  

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: Text("rail example"),
      trailing: null,
      extended: true,
      selectedIndex: selectedIndex,
      destinations: [for (var title in railNames) 
      NavigationRailDestination(icon: Icon(Icons.add_home_work), label: Text(title))],
      onDestinationSelected: (index) => x(index)
    );
  }
}

/*class TimeTemplateButton extends StatelessWidget {
  TimeTemplateButton({
    super.key,
    required this.h,
    required this.m,
    required this.s
  });

  final int h;
  final int m;
  final int s;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final int h = int.tryParse(hourController.text)!;
          final int m = int.tryParse(minuteController.text)!;
          final int s = int.tryParse(secondController.text)!;
          
          // check if all zero
          if (h == 0 && m == 0 && s == 0) {
            print(Exception("time cannot be zero"));
          } else {
            print("$h, $m, $s");
          }
        }
      },
      child: const Text('Start'),
    );
  }
}*/