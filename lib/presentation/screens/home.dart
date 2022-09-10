import 'package:bmi_calculator/business_logic/home_bloc/cubit.dart';
import 'package:bmi_calculator/business_logic/home_bloc/states.dart';
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text("BMI Calculator"),
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
                                          ? Colors.greenAccent
                                          : Colors.teal),
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
                                        style: TextStyle(color: Colors.black,fontSize: 20),
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
                                          ? Colors.teal
                                          : Colors.greenAccent),
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
                                        style: TextStyle(color: Colors.black,fontSize: 20),
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
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Height",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children:  [
                              Text("${homeCubit.height.round()}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              const SizedBox(width: 2,),
                              const Text("CM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                            ],
                          ),
                          Slider(
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
                                      color: homeCubit.isMale
                                          ? Colors.greenAccent
                                          : Colors.teal),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      const Text("Age",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                       Text("${homeCubit.age}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
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
                                      color: homeCubit.isMale
                                          ? Colors.greenAccent
                                          : Colors.teal),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      const Text("Weight",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Text("${homeCubit.weight}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
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
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: OutlinedButton(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResultScreen()));
                        },
                        child: const Text("CALCULATE",style: TextStyle(color: Colors.black),)),
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
