import 'package:flutter/material.dart';
import 'package:my_app/components/SideMenu.dart';
import 'package:provider/provider.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import '../responsive.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomPaint(
                          painter: DashboardHeader(),
                          child: SizedBox(
                              height: 350,
                              child: Column(
                                children: [
                                  const SizedBox(height: 100),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 20),
                                      if (!Responsive.isDesktop(context))
                                        IconButton(
                                          icon: const Icon(Icons.menu),
                                          iconSize: 40,
                                          onPressed: context
                                              .read<MenuController>()
                                              .controlMenu,
                                        ),
                                      const SizedBox(width: 30),
                                      const Text("Frequently Asked Questions",
                                          style: TextStyle(
                                              color: Color(0xff0B3F24),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40)),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: RichText(
                            text: const TextSpan(
                              text: '',
                              style: TextStyle(color: Color(0xff0B3F24)),
                              children: <TextSpan>[
                                TextSpan(text: 'What is CBT?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: '''
            Cognitive Behavioral Therapy (CBT) is a type of psychological treatment 
            that can be used for alcohol and drug use problems, severe mental illness 
            and depression. CBT, based on research studies, can be as effective if 
            not more effective than other psychological treatments and mediations 
            and can lead to improvements in one’s quality of life. ''', 
                                  style: TextStyle(fontSize: 18)),
                                TextSpan(text: '\n\n\nHow does CBT work?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: '''
            CBT is based on the idea that thoughts, feelings, physical sensations 
            and actions are interconnected and that negative ones can trap you in 
            a vicious cycle. It aims to break down problems into smaller parts to 
            help deal with them and focuses on current problems rather than one’s 
            past. CBT also works to change behavioral patterns with strategies such 
            as “using role playing to prepare for potentially problematic 
            interactions with others.” As well as “learning to calm one’s mind and 
            relax one’s body.” Individuals play an important role by completing 
            “homework,” developing their own coping skills and learning to change 
            their thinking and behavior. While many people who use CBT have mental 
            health disorders, it is an effective tool for anyone who wants to manage 
            stressful life situations. ''', 
                                  style: TextStyle(fontSize: 18)),
                                TextSpan(text: '\n\n\nWhat is SMART Recovery?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,)),
                                TextSpan(
                                  text: '''
            Self-Management and Recovery Training (SMART) is a support program for 
            people with addictions and behavioral disorders. It teaches people how 
            to control their addictive behavior by focusing on underlying thoughts 
            and feelings. Participants in SMART learn skills to manage their cravings 
            and urges for the long term. Participants can tackle a specific point in 
            any order based on their needs. SMART recovery uses principles of CBT 
            in the recovery process.''', 
                                  style: TextStyle(fontSize: 18)),
                                TextSpan(text: '\n\n\nWhat is Motivational Interviewing? \n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: '''
            The definition of Motivational Interviewing used by Miller & Rollnick 
            is “a collaborative, goal-oriented style of communication with 
            particular attention to the language of change. It is designed to 
            strengthen personal motivation for and commitment to a specific goal by 
            eliciting and exploring the person’s own reasons for change within an 
            atmosphere of acceptance and compassion.” Motivational Interviewing was 
            initially developed in 1983 by William R. Miller in response to his 
            experience with problem drinkers and since then has been analyzed in 
            studies as an aspect of substance abuse treatment. There are four main 
            principles that are referred to by the acronym OARS which stands for Open 
            ended questions, Affirmations, Reflections, Summaries. Motivational 
            interviewing encourages what is referred to as ‘change talk’ which 
            involves 4 types of statements surrounding the goals of the client. These 
            statements are categorized by desire, ability, reason, and need. ''', 
                                  style: TextStyle(fontSize: 18)),
                                TextSpan(text: '\n\n\nWhat is disengagement?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: '''
            Disengagement refers to the rejection of partaking in violent extremist 
            behavior and actions. Through refusing to participate in such activities, 
            one is able to pursue their goals of self help and reintegration in a 
            peaceful manner. Disengagement implies a change which is “inherently 
            social and behavioral,” not ideological. That being said, the practice of 
            disengagement often can lead to deradicalization. ''', 
                                  style: TextStyle(fontSize: 18)),
                                TextSpan(text: '\n\n\nWhat is deradicalization? \n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                                TextSpan(
                                  text: '''
            Deradicalization refers to an individual's gradual shifting away from 
            violent or hateful extremist ideologies. As opposed to disengagement, 
            deradicalization not only refers to a rejection on the part of former 
            extremists of violent tactics/behaviors, but also of those extremist 
            ideologies in general. Deradicalization primarily concerns ideology and 
            personal beliefs, and thus can be more difficult to track, but it is the 
            ultimate goal of helping a person grow away from extremism and hate.\n\n\n\n''', 
                                  style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
    );
  }
}