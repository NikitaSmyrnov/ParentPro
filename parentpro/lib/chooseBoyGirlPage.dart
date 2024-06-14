
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:parentpro/singletonChoice.dart';

import 'homePage.dart';
import 'main.dart';

class chooseGirlBoy extends StatefulWidget {
  const chooseGirlBoy({super.key, required this.title});



  final String title;

  @override
  State<chooseGirlBoy> createState() => _chooseGirlBoy();
}

class _chooseGirlBoy extends State<chooseGirlBoy> {

  void choiceMade(bool isBoy){
    choiceOfChildBoy = isBoy;
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => HomePage()),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated text
            FadeInUp(
              child: Text(
                "Your child is a",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Animated buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: FadeInUp(
                    delay: Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed: () {choiceMade(true);},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // text color
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Boy",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  flex: 2,
                  child: FadeInUp(
                    delay: Duration(milliseconds: 600),
                    child: ElevatedButton(
                      onPressed: () {choiceMade(false);},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink, // text color
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Girl",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
