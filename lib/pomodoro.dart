import 'package:flutter/material.dart';
import 'package:tracker/pomodoro_theme.dart';


class PomodoroWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return Expanded(child: Center(child: SizedBox(
    //   child: Padding(padding: EdgeInsets.all(12.0), child: 
    //     ElevatedButton(onPressed: () {
    //       showTimePicker(context: context, 
    //       initialEntryMode: TimePickerEntryMode.inputOnly, initialTime: TimeOfDay(hour: 0, minute: 25),
    //       builder: 
    //       );
    //       TimePickerTheme;
    //       TimePickerThemeData;
    //     }, child: Text("pick")),)
    // )));
    return Expanded(child: TimerGenerator(),);
  }
}
/*class BasicTimer extends StatefulWidget {
  BasicTimer({
    super.key,
    required this.second,
    required this.minute,
    required this.hour
  });

  final int second;
  final int minute;
  final int hour;

  @override
  State<BasicTimer> createState() => _BasicTimerState();
}

class _BasicTimerState extends State<BasicTimer> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(widget.second.toString()),
      Text(widget.minute.toString()),
      Text(widget.hour.toString()),
    ]);
  }
}*/

class TimerGenerator extends StatefulWidget {
  const TimerGenerator({super.key});

  @override
  State<TimerGenerator> createState() => _TimerGeneratorState();
}

class _TimerGeneratorState extends State<TimerGenerator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  List<Widget> _finalRowButtonList = [];
  List<List<int>> _templateList = [];
  
  final hourController = TextEditingController(text: "0");
  final minuteController = TextEditingController(text: "25");
  final secondController = TextEditingController(text: "0");

  List<int>? inputParser(BuildContext context) {
     final res = [
        int.tryParse(hourController.text)!,
        int.tryParse(minuteController.text)!,
        int.tryParse(secondController.text)!
      ];
      if (res[0] == 0 && res[1] == 0 && res[2] == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("time cannot be zero"))
        );
        return null;
      } else {
        return res;
      }
    }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    hourController.dispose();
    minuteController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final startButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final res = inputParser(context);
          if (res == null) {return;}
          // TODO: start timer
        }
      },
      child: const Text('Start'),
    );

    final addButton = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final res = inputParser(context);
          if (res == null) {return;}
          final int h = res[0];
          final int m = res[1];
          final int s = res[2];

          // check if all zero
          print(res);
          for (var item in _templateList) {
            if (item[0] == h && item[1] == m && item[2] == s) {
              return;
            }
          }
          final template = [h, m, s];
          setState(() {
            _finalRowButtonList.add(
              ElevatedButton(onPressed: () {
                hourController.value = TextEditingValue(text: "$h");
                minuteController.value = TextEditingValue(text: "$m");
                secondController.value = TextEditingValue(text: "$s");
              },
              child: Text("$h:$m:$s"))
            );
            _templateList.add(template);
          });
        }
      },
      child: const Text('Add'),
    );
      
    var hourField = TimerFieldConstructor(fieldType: "hour", controller: hourController,);
    var minuteField = TimerFieldConstructor(fieldType: "minute", controller: minuteController);
    var secondField = TimerFieldConstructor(fieldType: "second", controller: secondController);

    return Form(key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Row( // First Column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [hourField, minuteField, secondField]
          ),
          Padding( //Second Column
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [startButton,addButton],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: _finalRowButtonList),
              ],
            )
          )
        ],
      ),
    );
  }
}