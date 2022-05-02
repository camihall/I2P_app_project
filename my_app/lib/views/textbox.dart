import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../components/DashboardHeader.dart';
import '../components/MenuController.dart';
import 'package:provider/provider.dart';
import 'package:my_app/responsive.dart';
import '../../../constants.dart';
import 'exercises.dart';

String now = DateFormat('MM/dd/yyyy').format(DateTime.now());

class TxtbxRoute extends StatelessWidget {
  const TxtbxRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20),
                          if (!Responsive.isDesktop(context))
                            IconButton(
                              icon: const Icon(Icons.menu),
                              iconSize: 40,
                              onPressed:
                                  context.read<MenuController>().controlMenu,
                            ),
                          const SizedBox(width: 30),
                          const Text("Exercise",
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: _size.width * 0.75,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 10,
                              child: Container(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // const Text(
                                    //   "Today",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    const SizedBox(height: 10),
                                    Text(now),
                                    const SizedBox(height: 10),
                                    Card(
                                      color: const Color(0xffB1CEBF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(
                                            defaultPadding),
                                        child: Text(clickedQ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // TextField(
                                    //   decoration: InputDecoration(
                                    //     enabledBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: const BorderSide(
                                    //         color: Colors.transparent,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //     focusedBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: const BorderSide(
                                    //         width: 2,
                                    //         color: Color(0xffB1CEBF),
                                    //       ),
                                    //     ),
                                    //     border: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       borderSide: const BorderSide(
                                    //         color: Colors.transparent,
                                    //         width: 2,
                                    //       ),
                                    //     ),
                                    //     filled: true,
                                    //     hintStyle: TextStyle(
                                    //       color: Colors.blueGrey[300],
                                    //     ),
                                    //     hintText: "Title ...",
                                    //     fillColor: Colors.white,
                                    //   ),
                                    // ),
                                    //const SizedBox(height: 10),
                                    TextField(
                                      minLines: 11,
                                      maxLines: null, // make true multiline
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            width: 2,
                                            color: Color(0xffB1CEBF),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey[300]!,
                                            width: 2,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(
                                          color: Colors.blueGrey[300],
                                        ),
                                        hintText:
                                            "Answer the prompt here ...",
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: const Color(
                                                0xff0B3F24), // Text Color
                                          ),
                                          child: const Text('Save'),
                                          onPressed: () {/* ... */},
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            primary: const Color(
                                                0xff0B3F24), // Text Color
                                          ),
                                          child: const Text(
                                              'View other responses'),
                                          onPressed: () {/* ... */},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
