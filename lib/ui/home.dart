import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";
  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "UnderWeight";
          // print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape";
          // print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25 &&
            result < 30) {
          _resultReading = "Overweight";
          // print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          _resultReading = "Obese";
          // print(_resultReading);
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI:${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: new Column(
                children: [
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "Add your age here",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in feet",
                        hintText: "height in feet",
                        icon: new Icon(Icons.graphic_eq)),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lb",
                        hintText: "weight in lb",
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(padding: new EdgeInsets.all(8.6)),
                  //calcualte button
                  new Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: _calculateBMI,
                      child: new Text("Calculate"),
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_finalResult",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
