import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:parentpro/singletonChoice.dart';

import 'listsTechniques.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.choix});
  final String choix;

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  List<Technique> techniqueList = [];
  String title = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    if (widget.choix == "Child Education") {
      techniqueList = techniquesEducation;
      title = "Child Education";
      description = "Tips and techniques for educating your child";
    }else if (widget.choix == "Parenting Tips") {
      techniqueList = techniquesParenting;
      title = "Parenting Tips";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Nutrition Advice") {
      techniqueList = dietTechniques;
      title = "Nutrition Advice";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Activities and Games") {
      techniqueList = activityTechniques;
      title = "Activities and Games";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Tech and Gadgets") {
      techniqueList = techAssistanceTechniques;
      title = "Tech and Gadgets";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Behavior Management") {
      techniqueList = behaviorManagementTechniques;
      title = "Behavior Management";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Health and Safety") {
      techniqueList = healthAndSafetyTechniques;
      title = "Health and Safety";
      description = "Tips and techniques for educating your child";
    } else if (widget.choix == "Sleep Training") {
      techniqueList = sleepTrainingTechniques;
      title = "Sleep Training";
      description = "Tips and techniques for educating your child";
    }
  }


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
                description,
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
            Column(
              children: techniqueList.map((tech) {
                return FadeInRightBig(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0), // Customize your border radius here
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: tech.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ': ${tech.description}',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
