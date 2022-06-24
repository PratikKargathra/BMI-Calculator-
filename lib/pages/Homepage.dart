import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}
double bmi = 0.0;
Color textColor = Colors.white;
String text = "";
String weightStatus = "";

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {

  //variables
  late AnimationController controller;
  bool? isMale;
  double heightCM = 50;
  int weight = 0;
  int age = 0;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -1,
      upperBound: 0,
    );
    controller.animateTo(0,curve: Curves.easeOut, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xff0F1538),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            setState((){
              isMale = null;
              heightCM = 50;
              weight = 0;
              age = 0;
            });
          }, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 8,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        child: ElevatedButton(
                          onPressed: (){
                            setState((){
                              isMale = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.all(10),
                            fixedSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
                            primary: const Color(0xff272D4D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.male,
                                  color: (isMale==true)?const Color(0xffFF0C63):const Color(0xffB2B9D5),
                                  size: 90,
                              ),
                              const Text("MALE",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        builder: (BuildContext context,Widget? child){
                          return Transform.translate(
                              offset: Offset(controller.value*200,0),
                              child: child,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        child: ElevatedButton(
                          onPressed: (){
                            setState((){
                              isMale = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.all(10),
                            fixedSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
                            primary: const Color(0xff272D4D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(
                                Icons.female,
                                color: (isMale==false)?const Color(0xffFF0C63):const Color(0xffB2B9D5),
                                size: 90,
                              ),
                              const Text("FEMALE",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        builder:(BuildContext context,Widget? child){
                          return Transform.translate(
                              offset: Offset(controller.value*-200,0),
                              child: child,
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            Expanded(
              flex: 10,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context ,Widget? child){
                    return Transform.translate(
                        offset: Offset(controller.value*-200,0),
                        child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff272D4D),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT",style: TextStyle(color: Color(0xffB2B9D5), fontSize: 18, fontWeight: FontWeight.w500),),
                        RichText(
                          text: TextSpan(
                            children:  <TextSpan>[
                              TextSpan(text: heightCM.toInt().toString(), style: const TextStyle(color: Colors.white, fontSize: 60,fontWeight: FontWeight.w500)),
                              const TextSpan(text: 'CM', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Slider(
                          inactiveColor: const Color(0xffB2B9D5),
                          activeColor: const Color(0xffA7164A),
                          thumbColor: const Color(0xffFF0C63),
                            min: 50,
                            max:  250,
                            value: heightCM,
                            onChanged: (val){
                              setState((){
                                heightCM = val;
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 30,),
            Expanded(
              flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: ( context, Widget? child){
                          return Transform.translate(
                              offset: Offset(controller.value*200,0),
                              child: child,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff272D4D),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("WEIGHT",style: TextStyle(color: Color(0xffB2B9D5), fontSize: 18, fontWeight: FontWeight.w500),),
                              Text(weight.toString(),style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor:const Color(0xff0F1538),
                                      onPressed: (){
                                        setState((){
                                          weight++;
                                        });
                                      },
                                      child: const Icon(Icons.add),
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor:const Color(0xff0F1538),
                                    onPressed: (){
                                      setState((){
                                        if(weight>0){
                                          weight--;
                                        }else{
                                          Fluttertoast.showToast(
                                              msg: "Wrong Argument",
                                              gravity: ToastGravity.CENTER,
                                              backgroundColor: const Color(0xffFF0C63),
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context,Widget? child){
                          return Transform.translate(
                              offset: Offset(controller.value*-200,0),
                              child: child,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff272D4D),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("AGE",style: TextStyle(color: Color(0xffB2B9D5), fontSize: 18, fontWeight: FontWeight.w500),),
                              Text(age.toString(),style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor:const Color(0xff0F1538),
                                    onPressed: (){
                                      setState((){
                                        age++;
                                      });
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor:const Color(0xff0F1538),
                                    onPressed: (){
                                      setState((){
                                        if(age>0){
                                          age--;
                                        }else{
                                          Fluttertoast.showToast(
                                              msg: "Wrong Argument",
                                              gravity: ToastGravity.CENTER,
                                              backgroundColor: const Color(0xffFF0C63),
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            Expanded(
                flex: 4,
                child:  AnimatedBuilder(
                  animation: controller,
                  builder: (context, Widget? child){
                    return Transform.translate(
                        offset: Offset(0,controller.value*-100),
                        child: child,
                    );
                  },
                  child: ElevatedButton(
                    onPressed: (){
                      setState((){
                          if(isMale!=null && weight != 0 && age != 0){
                            double heightM = heightCM/100;
                            bmi = weight/(heightM*heightM);
                            if(bmi<18.5){
                              weightStatus = "Underweight";
                              textColor= Colors.yellowAccent;
                              text = "Your Weight is too low eat some health food.";
                            }else if(bmi>18.5 && bmi<24.9){
                              weightStatus = "	Healthy Weight";
                              text = "You have a healthy body weight good job.";
                              textColor= Colors.green;
                            } else if(bmi>25.0 && bmi<29.9){
                              weightStatus = "	Overweight";
                              textColor= Colors.orangeAccent;
                              text = "Your body id overweight keep doing workout.";
                            }else{
                              weightStatus = "Obesity";
                              textColor= Colors.redAccent;
                              text = "Your weight is too heavy go to GYM.";
                            }

                            Navigator.pushNamedAndRemoveUntil(context, 'result', (route) => false);
                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "Please fill all inputs",
                                gravity: ToastGravity.CENTER,
                                backgroundColor: const Color(0xffFF0C63),
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
                      primary: const Color(0XFFFF0C63),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text("Check Your BMI",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                  ),
                ),
            )

          ],
        ),
      ),
      backgroundColor: const Color(0xff0F1538),
    );
  }
}