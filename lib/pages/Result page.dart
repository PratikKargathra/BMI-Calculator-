import 'package:flutter/material.dart';

import 'Homepage.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YOUR BMI RESULT"),
        centerTitle: true,
        backgroundColor: const Color(0xff0F1538),
        elevation: 0,
      ),
      body: Center(
        child:  Column(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff272D4D),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(weightStatus,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: textColor ),),
                  const SizedBox(height: 20,),
                  Text(bmi.toStringAsFixed(2),style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 70,color: Colors.white),),
                  const SizedBox(height: 20,),
                  Text(text,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(MediaQuery.of(context).size.width*0.9,60),
                primary: const Color(0XFFFF0C63),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Re-Check BMI",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
      backgroundColor: const Color(0xff0F1538),
    );
  }
}

