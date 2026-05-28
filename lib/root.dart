import 'package:application_flutter/screens/multiselection.dart';
import 'package:application_flutter/screens/singleselection.dart';
import 'package:application_flutter/screens/selection_2.dart';
import 'package:application_flutter/screens/toogle_selection.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    Singleselection(),
    Selection2(),
    ToogleSelection(),
    Multiselection(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Back
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex - 1);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [Icon(Icons.arrow_back, color: Colors.black)],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex + 1);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          ' Next Page',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 14),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
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
