import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _weightController= new TextEditingController();
int radioValue=0;
double _finalResult=0.0;
String _formattedText="";
void handleRadioValueChanged(int value){
  setState(() {
    radioValue=value;
    switch(radioValue){
      case 0:
        _finalResult= calculateWeight(_weightController.text, 0.06);
        _formattedText="Your Weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
        break;
      case 1:
        _finalResult=calculateWeight(_weightController.text, 0.38);
        _formattedText="Your Weight on Mars is ${_finalResult.toStringAsFixed(1)}";
        break;
      case 2:
        _finalResult=calculateWeight(_weightController.text,0.91);
        _formattedText="Your Weight on Venus is ${_finalResult.toStringAsFixed(1)}";
        break;

    }
  });

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Weight On Planet X'),
        centerTitle:true,
        backgroundColorStart: Colors.cyanAccent,
        backgroundColorEnd: Colors.indigo,
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9
              ],
              colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal
              ]
          )
        ),
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 250.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'Weight in Pound',
                      icon: new Icon(Icons.person_outline),

                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
//                  radio buttons
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio<int>(
                      activeColor: Colors.orangeAccent,
                        value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),

                    new Text("Pluto",style: new TextStyle(fontSize: 15.0, fontWeight:FontWeight.w500),),

                    new Radio<int>(
                        activeColor: Colors.redAccent,
                        value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),

                    new Text("Mars",style: new TextStyle(fontSize: 15.0, fontWeight:FontWeight.w500),),

                    new Radio<int>(
                      activeColor: Colors.yellowAccent.shade200,
                        value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),

                    new Text("Venus",style: new TextStyle(fontSize: 15.0, fontWeight:FontWeight.w500),),
                  ],

                ),
                  new Padding(padding: const EdgeInsets.all(15.0)),
                  new Text(_weightController.text.isEmpty ? "Please Enter Weight" : _formattedText + "lbs",
                    style: new TextStyle(color: Colors.white, fontSize:20.0,fontWeight: FontWeight.w800
                  , fontStyle: FontStyle.italic),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
  if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
    return int.parse(weight)*multiplier;
  }
  else{
    print("wrong");
    return int.parse("180")*0.38;
  }

  }
}