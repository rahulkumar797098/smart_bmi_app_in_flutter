import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightFeetController = TextEditingController();
  TextEditingController heightInchController = TextEditingController();
  String bmi = "" ;
  String status = "" ;
  Color backGround = Colors.white;
  Image bmiImage = Image.asset("assets/image/bmi.png");
  Color textColor = Colors.black ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // BMI IMAGE
             SizedBox(
               height: 200,
                 width: 200,
                 child: bmiImage),

             const SizedBox(height: 40,),
              // VALUE SHOW BOX
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfffdf1b0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          status,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold , color: textColor),
                        ),
                        if (bmi.isNotEmpty)
                          Text(
                            "BMI Value : ${bmi}",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),



                      ],
                    ),
                  ),
                ),
              ),
              // WEIGHT BOX
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: weightController,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xfffdf5c9),
                      hintText: "Enter Weight in Kg",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border by default
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orange),
                        // Border when focused
                      ),
                      prefixIcon: const Icon(
                        Icons.line_weight_outlined,
                        size: 30,
                        color: Colors.orange,
                      )),
                ),
              ),
              // FEET BOX
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: heightFeetController,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xfffdf5c9),
                      hintText: "Enter Height (in Feet)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border by default
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orange),
                        // Border when focused
                      ),
                      prefixIcon: const Icon(
                        Icons.height,
                        size: 30,
                        color: Colors.orange,
                      )),
                ),
              ),
              // INCH BOX
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: heightInchController,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xfffdf5c9),
                      hintText: "Enter Height (in Inch)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border by default
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // No border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.orange),
                        // Border when focused
                      ),
                      prefixIcon: const Icon(
                        Icons.height,
                        size: 30,
                        color: Colors.orange,
                      )),
                ),
              ),

              const SizedBox(height: 20,),
              // BMI FIND BUTTON
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xfffdf5c9),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      
                      if (weightController.text.isEmpty && heightFeetController.text.isEmpty && heightInchController.text.isEmpty) {
                        status = "Fill all the required blanks!!";
                        textColor = Colors.redAccent ;
                        setState(() {


                        });
                        
                      }  
                      
                      int weight = int.parse(weightController.text.toString());
                      int feet = int.parse(heightFeetController.text.toString());
                      int inch = int.parse(heightInchController.text.toString());
          
                      // Formula Of BMI
                      // BMI = weight/(heightMeter * heightMeter)
          
                      var totalInch = (feet * 12) + inch;
                      var totalCm = totalInch * 2.54;
                      var totalMeter = totalCm / 100;
          
                      double bmiValue = weight / (totalMeter * totalMeter);
          
                      setState(() {
                        bmi = bmiValue.toStringAsFixed(2);
                        
                        
                        if (bmiValue > 25 ) {
                          status = "You are OverWeight 😒😒 " ;
                          backGround = Colors.orangeAccent.shade100;
                          bmiImage = Image.asset("assets/image/normal-removebg-preview.png");

                        }
                        else if(bmiValue < 18){
                          status = "You are UnderWeight 🤔🤔 " ;
                          backGround = Colors.redAccent.shade100 ;
                          bmiImage = Image.asset("assets/image/sad-emoji-poster.png");

                        }
                        else{
                          status = "You are Healthy 💚💚 " ;
                          backGround = Colors.greenAccent.shade100;
                          bmiImage = Image.asset("assets/image/happy-removebg-preview.png");

                        }
                      });
                    },
                    child: const Text(
                      "BMI",
                      style: TextStyle(fontSize: 30,
                          letterSpacing: 10.0,
                          shadows: [
                        Shadow(
                            color: Colors.red,
                            blurRadius: 8,
                            offset: Offset(2.0, 2.5))
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
