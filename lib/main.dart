import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your BMI"),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Colors.yellowAccent,
                Colors.orange,
                Colors.pink,
                // Colors.blue,
                // Colors.purple,
              ],
            )
          ),
          // color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      label: Text("Enter your weight kgs."),
                      fillColor: Colors.red,
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: heightController,
                    decoration: InputDecoration(
                      label: Text("Enter your height in feet"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: inchController,
                    cursorHeight: 20,
                    autofocus: false,
                    // controller: TextEditingController(text: "Initial Text here"),
                    decoration: InputDecoration(
                      labelText: 'Enter your height inches',
                      hintText: "Height",

                      prefixIcon: Icon(Icons.star),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      //   borderSide: BorderSide(color: Colors.grey, width: 2),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      //   borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 22),
                  ElevatedButton(
                      onPressed: () {
                        var weight = weightController.text.toString();
                        var height = heightController.text.toString();
                        var inch = inchController.text.toString();
                        if (weight != "" && height != "" && inch != "") {
                          var mywt = int.parse(weight);
                          var myhgt = int.parse(height);
                          var myich = int.parse(inch);

                          var tinch = (myhgt * 12) + myich;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = mywt / (tm * tm);
                          var message = "";
                          if (bmi > 25) {
                            message = "You are over weight";
                            bgColor = Colors.red;
                          } else if (bmi < 18) {
                            message = "You are under weight";
                            bgColor = Colors.yellow;
                          } else {
                            message = "You are Healthy";
                            bgColor = Colors.green;
                          }
                          setState(() {
                            result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill the required fields";
                          });
                        }
                      },
                      child: Text("Calculate BMI")),
                  Text(
                    result,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
