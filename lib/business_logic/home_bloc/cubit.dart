import 'package:bmi_calculator/business_logic/home_bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  bool isMale=true;
  double height =170;
  int age =25;
  int weight =70;

  void changeGenderToMale(){
    isMale=true;
    emit(GenderMaleState());
  }
  void changeGenderToFemale(){
    isMale=false;
    emit(GenderFemaleState());
  }
  void incAge(){
    age++;
    emit(AgeState());
  }
  void decAge(){
    age--;
    emit(AgeState());
  }
  void incWeight(){
    weight++;
    emit(WeightState());
  }
  void decWeight(){
    weight--;
    emit(WeightState());
  }
  void changeHeight(double myHeight){
    height=myHeight;
    emit(HeightState());
  }
}