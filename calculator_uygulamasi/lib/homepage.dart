import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List displayedOperation = <String>[];
  List newOperation = <String>[];
  List calculatedOperation = [];
  double sum = 0;
  String result = "0";

  Future<void> onButtonClick(value) async{

    if(double.tryParse(value) == null){
      if(value == "+" || value == "."){
        setState(() {
          displayedOperation.add(value);
        });
      }else if(value == "="){
        setState(() {
          calculatedOperation.clear();
          newOperation = displayedOperation.join().split("+");
          for(var i=0; i<newOperation.length; i++){
            calculatedOperation.add(double.parse(newOperation[i]));
          }
          print(calculatedOperation);
          sum = calculatedOperation.reduce((a, b) => a + b);

          if(sum % 1 == 0){ // sum int ise ekranda .0 yazmasını engeller
            result = sum.toInt().toString();
          }else{ // double ise noktadan sonrasını görmeliyiz
            result = sum.toString();
          }

        });
      }else if(value == "AC"){
        setState(() {
          displayedOperation.clear();
          result = "0";
        });
      }
    } else {
       setState(() {
         displayedOperation.add(value);
       });
    }
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;

    //print(screenHeight);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
                height: screenHeight/3.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(displayedOperation.isNotEmpty ?"=":"", style: TextStyle(fontSize: 30,color: Colors.grey),),
                        Flexible(child: Text(displayedOperation.join(), style: TextStyle(fontSize: 30,color: Colors.grey,),maxLines: 2,))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(result, style: TextStyle(fontSize: 60),)
                      ],
                    ),
                  ],
                )
            ),
            Container(
              height: screenHeight/1.52,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorButton(content: "AC", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "+/-", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "%", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "/", foregroundColor: Colors.orange, callback: onButtonClick,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorButton(content: "7", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "8", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "9", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "x", foregroundColor: Colors.orange, callback: onButtonClick,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorButton(content: "4", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "5", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "6", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "-", foregroundColor: Colors.orange, callback: onButtonClick,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorButton(content: "1", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "2", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "3", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "+", foregroundColor: Colors.orange, callback: onButtonClick,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorButtonZero(content: "0", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: ".", foregroundColor: Colors.black, callback: onButtonClick,),
                      calculatorButton(content: "=", foregroundColor: Colors.orange, callback: onButtonClick,),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}



class calculatorButton extends StatelessWidget {

  String content;
  Color foregroundColor;
  Function callback;

  calculatorButton({required this.content, required this.foregroundColor, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: () => callback(content),
        child: Text(content, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
        style: ElevatedButton.styleFrom(
          //shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.white, // <-- Button color
          foregroundColor: foregroundColor, // <-- Splash color
        ),
      ),
    );
  }
}

class calculatorButtonZero extends StatelessWidget {

  String content;
  Color foregroundColor;
  Function callback;

  calculatorButtonZero({
    required this.content,
    required this.foregroundColor,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 80,
      child: ElevatedButton(
        onPressed: () => callback(content),
        child: Text(content, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // <-- Button color
          foregroundColor: foregroundColor, // <-- Splash color
        ),
      ),
    );
  }
}





