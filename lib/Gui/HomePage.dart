import 'package:flutter/material.dart';
import 'package:todo_list/Gui/2D_Task.dart';
import 'package:todo_list/Gui/3D_Task.dart';
import 'package:todo_list/Gui/Code.dart';
import 'package:todo_list/Gui/Writing_Task.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final _formKey = GlobalKey<FormState>();
  PageController controller = PageController(initialPage: 0);
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: globals.standard_color,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spaceBetweenChildren: 8,
        children: [
          SpeedDialChild(
              child: Icon(
                LineIcons.cube,
                color: globals.standard_color,
              ),
              backgroundColor: Colors.white,
              label: "3D",
              onTap: () {
                Fluttertoast.showToast(msg: "3D Images Tasks...", fontSize: 20);
                form_dialog(context, _formKey, "3D Task");
              }),
          SpeedDialChild(
            child: Icon(
              LineIcons.fileInvoice,
              color: globals.standard_color,
            ),
            backgroundColor: Colors.white,
            label: "Writing",
            onTap: () {
              Fluttertoast.showToast(msg: "Writing Tasks ...", fontSize: 20);
              form_dialog(context, _formKey, "Writing Task");
            },
          ),
          SpeedDialChild(
            child: Icon(
              LineIcons.paintBrush,
              color: globals.standard_color,
            ),
            backgroundColor: Colors.white,
            label: "2D",
            onTap: () {
              Fluttertoast.showToast(msg: "2D Images Tasks ...", fontSize: 20);
              form_dialog(context, _formKey, "2D Task");
            },
          ),
          SpeedDialChild(
            child: Icon(
              LineIcons.code,
              color: globals.standard_color,
            ),
            backgroundColor: Colors.white,
            label: "Unity",
            onTap: () {
              Fluttertoast.showToast(msg: "Unity Tasks ...", fontSize: 20);
              form_dialog(context, _formKey, "Unity Task");
            },
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
            print("changed");
          });
        },
        children: [
          Home_3D(),
          Home_Writing(),
          Home_2D(),
          Home_Unity(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: globals.standard_color,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.cube,
                  text: '3D Task',
                ),
                GButton(
                  icon: LineIcons.fileInvoice,
                  text: 'Writing',
                ),
                GButton(
                  icon: LineIcons.paintBrush,
                  text: '2D Task',
                ),
                GButton(
                  icon: LineIcons.code,
                  text: 'Unity',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  controller.jumpToPage(index);
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

void form_dialog(
    BuildContext context, GlobalKey<FormState> _formKey, String type) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(type),
        content: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "SuperClass",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                      ),
                    ),
                  ),
                  Slider_Difficulty_(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            globals.standard_color),
                      ),
                      child: Text("Submitß"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class Slider_Difficulty_ extends StatefulWidget {
  const Slider_Difficulty_({super.key});

  @override
  State<Slider_Difficulty_> createState() => _Slider_Difficulty_State();
}

class _Slider_Difficulty_State extends State<Slider_Difficulty_> {
  double _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Urgency " + _currentValue.toInt().toString(),
            ),
          ),
        ),
        Slider(
          thumbColor: Color.fromARGB(255, 5, 43, 2),
          activeColor: globals.standard_color,
          inactiveColor: Color.fromARGB(72, 14, 121, 6),
          value: _currentValue,
          min: 1,
          max: 5,
          onChanged: (value) {
            setState(() {
              _currentValue = double.parse(value.ceil().toString());
            });
          },
        )
      ],
    );
  }
}
