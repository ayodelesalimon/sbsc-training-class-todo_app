import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sbsc_todo_app/details.dart';
import 'package:sbsc_todo_app/model/todo_model.dart';
import 'package:sbsc_todo_app/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        backgroundColor: customBackgroundColor,
        scaffoldBackgroundColor: customScaffoldBackgroundColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final format = DateFormat("d MMMM, y");
  bool valuefirst = false;

  DateTime selectedDate = DateTime.now();
  // TextEditingController _controller2;
  // String _valueChanged2 = '';
  // String _valueToValidate2 = '';
  // String _valueSaved2 = '';

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  //Keep track of how many TODO we have
  List<TodoModelClass> todos = [];

  void _showInputFieldWidget(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        title: Text(
          "Create TODO",
          style: GoogleFonts.lateef(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          const SizedBox(height: 24),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: "Eg. Eat Food",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          //SizedBox(height: 10),

          SizedBox(
            height: 20.0,
          ),
          
          
          DateTimeField(
            decoration: InputDecoration(
              hintText: 'Enter DateTime',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            controller: dateController,
            format: format,
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          ),

          TextFormField(
            controller: descController,
            //maxLines: 5,
            decoration: InputDecoration(
                hintText: "What is your TODO for",
                hintStyle: GoogleFonts.lateef(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  setState(() {
                    todos.add(TodoModelClass(
                        title: titleController.text,
                        description: descController.text,
                        dateTime: dateController.text));
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "SAVE",
                style: GoogleFonts.lateef(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Media query helps us get the device SIZE (height, width) property
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("My Todos"),
      ),
      body: Column(
        children: [
          Container(
            height: size.height / 4,
            color: Colors.white,
            //Stack widget stacks widgets on top of each other
            child: Stack(
              children: [

                
                // first child of the stack
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1508558936510-0af1e3cccbab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80"),
                    ),
                  ),
                ),
                // second child
                // Positioned(
                //   bottom: 10,
                //   right: 4,
                //   child:
                // ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Don't stop when you are tired.\nStop when you are DONE!",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.lateef(
                      color: Colors.white,
                      height: .8,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Welcome back, Khalifa',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20.0,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
            child: Text(
              'ONGOING TODO',
              style: GoogleFonts.lateef(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green[400],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          //Todo list will appear here
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                title: todos[index].title,
                                content: todos[index].description,
                                date: todos[index].dateTime,
                              )),
                    );
                    // showModalBottomSheet<void>(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Container(
                    //       height: 800,
                    //       color: Colors.amber,
                    //       child: Center(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: <Widget>[
                    //             Text(
                    //               todos[index].title,
                    //             ),
                    //             Text(
                    //               todos[index].description,
                    //             ),
                    //             Text(
                    //               todos[index].dateTime,
                    //             ),
                    //             ElevatedButton(
                    //               child: Text('Close BottomSheet'),
                    //               onPressed: () => Navigator.pop(context),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.white,
                    child: SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                             
                                  //   secondary: const Icon(Icons.alarm),
                               Column(
                                 children: [
                                   Text(
                                        todos[index].title,
                                        style: GoogleFonts.lateef(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),

                                      Text(
                                    todos[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lateef(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                 ],
                               ),
                                   
                                 
                                
                              
                                // Text(
                                //   todos[index].title,
                                //   style: GoogleFonts.lateef(
                                //     color: Colors.black,
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w900,
                                //   ),
                                // ),
                                Text(
                                  //The Datetime comes as a Date time type, so we turned it to a string with the toString method and then we split to get the desired value
                                  todos[index].dateTime,

                                  style: GoogleFonts.lateef(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: () {
          // clear the controller value as soon as you tap on the FAB
          titleController.clear();
          descController.clear();
          dateController.clear();
          _showInputFieldWidget(context);
        },
        tooltip: 'Add Todo',
        child: Icon(
          Icons.edit,
          size: 34,
        ),
      ),
    );
  }
}
