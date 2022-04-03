import 'package:flutter/material.dart';

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

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              detail,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
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
                Navigator.pushNamed(context, '/login');
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