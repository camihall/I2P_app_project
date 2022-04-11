import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:my_app/routes/router.gr.dart';


class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // logo 
        SizedBox(
          width: 70,
          height: 60,
          child: Image.asset('../assets/logo.png'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {},
                child: const Text('About',
                    style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff28313b),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1.627907,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('Community',
                  style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff28313b),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.627907,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('Support',
                  style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff28313b),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.627907,
                ),
              ),
            ),

            
          ],
        )
      ],
    );
  }
}

class LandingDescription extends StatelessWidget {
  const LandingDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height:100),
        // title
        const FittedBox(
          child: Text('''A tool to help the process of disengagement.''',
                style: TextStyle(
                color: Color(0xff28313b),
                fontSize: 50,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                //letterSpacing: 1.5,
                )
            ),
        ),
        const SizedBox(height: 50,),
        InkWell(
              onTap: () {
                AutoRouter.of(context).push(LoginRoute());
              },
              child: Container(
                width: 150,
                height: 57,
                child: const Center(
                  child: Text("Join",
                      style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2,
                      )
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff0B3F24),
                  borderRadius: BorderRadius.circular(8)
                )
              ),
            ),
        const SizedBox(height: 100,)
      ],
    );
  }
}