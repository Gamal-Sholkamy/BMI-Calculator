import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class ResultScreen extends StatelessWidget{
  late final String state;
  late final String result;
  late final String feedback;
  ResultScreen(this.state,this.result,this.feedback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myInActiveColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: MyColors.myActiveColor,
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            const SizedBox(height: 15,),
            const Expanded(
              child: Text(
                "Your Result",textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Expanded(
              flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.myActiveColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text(state,style: const TextStyle(fontSize: 22,color: Colors.green),),
                      const SizedBox(height: 5,),
                      Text(result,style: const TextStyle(fontSize: 72,color: Colors.white,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      const Text("Normal BMI range :",style:  TextStyle(fontSize: 24,color: Colors.grey),),
                      const Text("18.5 - 25 kg/m2",style:  TextStyle(fontSize: 20,color: Colors.white),),
                      const SizedBox(height: 15,),
                      Text(feedback,textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),

                )
            ),
            const SizedBox(height: 15,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: MyColors.myBottomColor,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("RE-CALCULATE",style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}