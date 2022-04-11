import 'package:my_app/responsive.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'DashboardOptionCard.dart';

List option = [
  const DashboardOptionCard(
    svgSrc: "assets/icons/Journal.svg",
    title: "Journal",
  ),
  const DashboardOptionCard(
    svgSrc: "assets/icons/CheckIn.svg",
    title: "Daily Check-In",
  ),
  const DashboardOptionCard(
    svgSrc: "assets/icons/Progress.svg",
    title: "Progress Tracking",
  ),
  const DashboardOptionCard(
    svgSrc: "assets/icons/Meditation.svg",
    title: "Meditation",
  ),
  const DashboardOptionCard(
    svgSrc: "assets/icons/Resources.svg",
    title: "Resources",
  ),
];

class DashboardOptions extends StatelessWidget {
  const DashboardOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Dashboard",
              style: TextStyle(
                  color: Color(0xff0B3F24),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: DashboardOptionCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: const DashboardOptionCardGridView(),
          desktop: DashboardOptionCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class DashboardOptionCardGridView extends StatelessWidget {
  const DashboardOptionCardGridView({
    Key? key,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: option.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => option[index],
    );
  }
}
