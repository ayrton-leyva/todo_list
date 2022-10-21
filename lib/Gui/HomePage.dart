import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/Gui/2D_Task.dart';
import 'package:todo_list/Gui/3D_Task.dart';
import 'package:todo_list/Gui/Code.dart';
import 'package:todo_list/Gui/Writing_Task.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  void changeColor(Color color) {
    setState(() {
      globals.standard_color = color;
    });
  }

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
          SpeedDialChild(
            child: Icon(
              Ionicons.color_palette_outline,
              color: globals.standard_color,
            ),
            backgroundColor: Colors.white,
            label: "Colors",
            onTap: () {
              Fluttertoast.showToast(msg: "Select Colors ...", fontSize: 20);
              List<Color> colors = [
                Color(0xff000000),
                Color(0xff3032034),
                Color(0xff798f7d),
                Color(0xff0e7906),
                Color(0xff1e508b),
                Color(0xff2196f3),
                Color(0xff92e1c1),
                Color(0xff09A54D),
                Color(0xffF295E0),
                Color(0xffffc0cb),
                Color(0xff800080),
                Color(0xff420da2),
                Color(0xff2F19DB),
                Color(0xff808080),
                Color(0xffc4b46c),
                Color(0xffffbf00),
                Color(0xffffa500),
                Color(0xffDF0000),
                Color(0xff800000),
                Color(0xff964C00),
              ];
              colors.sort((a, b) => a.value.compareTo(b.value));
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: globals.standard_color,
                        onColorChanged: changeColor,
                        availableColors: colors,
                        layoutBuilder: pickerLayoutBuilder,
                        itemBuilder: pickerItemBuilder,
                      ),
                    ),
                  );
                },
              );
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
      return Slider_Difficulty_(type: type, formKey: _formKey);
    },
  );
}

class Slider_Difficulty_ extends StatefulWidget {
  Slider_Difficulty_({
    super.key,
    required this.type,
    required this.formKey,
  });
  String type;
  GlobalKey<FormState> formKey;

  @override
  State<Slider_Difficulty_> createState() => _Slider_Difficulty_State();
}

class _Slider_Difficulty_State extends State<Slider_Difficulty_> {
  TextEditingController controller_superTask = TextEditingController();
  TextEditingController controller_name = TextEditingController();
  TextEditingController controller_description = TextEditingController();

  var current_value = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.type),
      content: Stack(
        children: <Widget>[
          Form(
            key: widget.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller_superTask,
                    decoration: InputDecoration(
                      hintText: "SuperTask",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller_name,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller_description,
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: Center(
                          child: Text(
                        current_value.toInt().toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (current_value == 1)
                            ? globals.standard_color.withOpacity(0.6)
                            : (current_value == 2)
                                ? globals.standard_color.withOpacity(0.7)
                                : (current_value == 3)
                                    ? globals.standard_color.withOpacity(0.8)
                                    : (current_value == 4)
                                        ? globals.standard_color
                                            .withOpacity(0.9)
                                        : globals.standard_color.withOpacity(1),
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Slider(
                      thumbColor: globals.standard_color,
                      activeColor: globals.standard_color.withOpacity(0.8),
                      inactiveColor: globals.standard_color.withOpacity(0.3),
                      value: current_value.toDouble(),
                      min: 1,
                      max: 5,
                      onChanged: (value) {
                        setState(() {
                          current_value = int.parse(value.ceil().toString());
                        });
                      },
                    ),
                  ],
                ),
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
                      functions.create_new_Task(
                          job: widget.type,
                          superTask: controller_superTask.text,
                          name: controller_name.text,
                          description: controller_description.text,
                          gradeLevel: current_value);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget pickerLayoutBuilder(
  BuildContext context,
  List<Color> colors,
  PickerItem child,
) {
  Orientation orientation = MediaQuery.of(context).orientation;
  return SizedBox(
    width: 300,
    height: orientation == Orientation.portrait ? 360 : 240,
    child: GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 4 : 5,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: [for (Color color in colors) child(color)],
    ),
  );
}

Widget pickerItemBuilder(
    Color color, bool isCurrentColor, void Function() changeColor) {
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: color,
      boxShadow: [
        BoxShadow(
            color: color.withOpacity(0.8),
            offset: const Offset(1, 2),
            blurRadius: 5)
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: changeColor,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedOpacity(
          opacity: isCurrentColor ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: Icon(
            Icons.done,
            size: 32,
            color: useWhiteForeground(color) ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
