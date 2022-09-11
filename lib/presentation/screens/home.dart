import 'package:bmi_calculator/business_logic/home_bloc/cubit.dart';
import 'package:bmi_calculator/business_logic/home_bloc/states.dart';
import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/data/calculator.dart';
import 'package:bmi_calculator/presentation/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: MyColors.myInActiveColor,
            appBar: AppBar(
              elevation: 10.0,
              centerTitle: true,
              backgroundColor: MyColors.myInActiveColor,
              title: const Text("BMI Calculator",style: TextStyle(color: Colors.white),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  homeCubit.changeGenderToMale();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeCubit.isMale
                                          ? MyColors.myActiveColor
                                          : MyColors.myInActiveColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                          "assets/images/harry.jpg",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: (){
                                  homeCubit.changeGenderToFemale();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeCubit.isMale
                                          ? MyColors.myInActiveColor
                                          : MyColors.myActiveColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                          "assets/images/alex.jpg",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Female",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.myActiveColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Height",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children:  [
                                Text("${homeCubit.height.round()}",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                const SizedBox(width: 5,),
                                const Text("CM",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15))
                              ],
                            ),
                            Slider(
                              inactiveColor:MyColors.myInActiveColor,
                              activeColor: MyColors.myInActiveColor,
                              thumbColor: MyColors.myBottomColor,
                              min: 110,
                              max: 220,
                              value: homeCubit.height,
                              onChanged: (v) {
                                homeCubit.changeHeight(v);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:MyColors.myActiveColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      const Text("Age",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                       Text("${homeCubit.age}",style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: MyColors.myActiveColor,
                                            radius: 20,
                                            child: IconButton(
                                              onPressed: (){
                                                homeCubit.decAge();
                                              },
                                              icon: Icon(Icons.remove),
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          CircleAvatar(
                                            backgroundColor: MyColors.myActiveColor,
                                            radius: 20,
                                            child: IconButton(
                                              onPressed: (){
                                                homeCubit.incAge();
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ),
                                          
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.myActiveColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      const Text("Weight",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Text("${homeCubit.weight}",style: const TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: MyColors.myActiveColor,
                                            radius: 20,
                                            child: IconButton(
                                              onPressed: (){
                                                homeCubit.decWeight();
                                              },
                                              icon: Icon(Icons.remove),
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          CircleAvatar(
                                            backgroundColor: MyColors.myActiveColor,
                                            radius: 20,
                                            child: IconButton(
                                              onPressed: (){
                                                homeCubit.incWeight();
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MyColors.myBottomColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: OutlinedButton(

                        onPressed: () {
                          Calculator calculator=Calculator(height: homeCubit.height.toInt(), weight: homeCubit.weight);
                          String result=calculator.calculateBMI();
                          String state=calculator.getFinalState();
                          String feedback=calculator.getFinalFeedback();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(state,result,feedback)));
                        },
                        child: const Text("CALCULATE",style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
