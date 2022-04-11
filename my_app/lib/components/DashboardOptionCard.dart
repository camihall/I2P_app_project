import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class DashboardOptionCard extends StatelessWidget {
  final String? svgSrc, title;
  const DashboardOptionCard({
    Key? key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 3,
          child: InkWell(
              splashColor: const Color(0xffB1CEBF),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                width: 200,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(defaultPadding * 0.75),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SvgPicture.asset(
                        svgSrc!,
                        color: Colors.black,
                        alignment: Alignment.center,
                      ),
                    ),
                    Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))),
    );
  }
}
