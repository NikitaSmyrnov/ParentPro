import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:parentpro/singletonChoice.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.choix});
  final String choix;

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {

  List<String> technique = [];
  String title = "";
  String descritpion = "";

  @override
  void initState() {
    super.initState();
   if(widget.choix == "Child Education"){
     technique = techniques;
     title = "Child Education";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Nutrition Advice"){
     technique = techniques;
     title = "Nutrition Advice";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Activities and Games"){
     technique = techniques;
     title = "Activities and Games";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Tech and Gadgets"){
     technique = techniques;
     title = "Tech and Gadgets";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Behavior Management"){
     technique = techniques;
     title = "Behavior Management";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Health and Safety"){
     technique = techniques;
     title = "Health and Safety";
     descritpion = "Tips and techniques for educating your child";
   }else if(widget.choix == "Sleep Training"){
     technique = techniques;
     title = "Sleep Training";
     descritpion = "Tips and techniques for educating your child";
   }
  }

  List<String> techniques = [
    "Positive reinforcement: Rewarding good behavior to encourage repetition.",
    "Setting boundaries: Clearly defining acceptable behavior and consequences.",
    "Active listening: Paying full attention to understand your child's feelings and needs.",
    "Consistency: Maintaining a predictable environment and responses.",
    "Time-outs: Providing a brief break to calm down and reflect on behavior.",
    "Modeling behavior: Demonstrating desired behaviors for children to emulate.",
    "Effective communication: Using clear, age-appropriate language to explain expectations.",
    "Empathy: Acknowledging and validating your child's emotions.",
    "Problem-solving: Collaboratively finding solutions to conflicts or challenges.",
    "Routine: Establishing consistent daily schedules for meals, sleep, and activities.",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: choiceOfChildBoy ? Colors.blue.shade100 : Colors.pink.shade100,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: choiceOfChildBoy ? Colors.blue : Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeIn(
              child: Text(
                descritpion,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FadeIn(
              child: Text(
                "Voici ce que vous pouvez faire",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Example of showing techniques (you can replace this with your actual technique widgets)
            ListView.builder(
              shrinkWrap: true,
              itemCount: technique.length,
              itemBuilder: (context, index) {
                return FadeInLeft(
                  child: ListTile(
                    title: Text(technique[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
