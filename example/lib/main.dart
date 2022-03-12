import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/date_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Date Picker Timeline Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blueGrey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You Selected:"),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(_selectedValue.toString()),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                child: Stack(
                  children: [
                    DatePicker(
                      DateTime.now(),
                      width: 60,
                      weekDayPosition: WeekDayPosition.bottom,
                      height: 60,
                      controller: _controller,
                      selectionColor: Color.fromRGBO(11, 225, 161, 1),
                      selectedTextColor: Colors.white,
                      initialSelectedDate: DateTime.now(),
                      inactiveDates: [
                        DateTime.now().add(Duration(days: 3)),
                        DateTime.now().add(Duration(days: 4)),
                        DateTime.now().add(Duration(days: 7))
                      ],
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                    Positioned(
                        bottom: 1,
                        left: 1,
                        right: 1,
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
