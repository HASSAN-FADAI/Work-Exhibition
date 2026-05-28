import 'package:flutter/material.dart';

class Selection2 extends StatefulWidget {
  const Selection2({super.key});

  @override
  State<Selection2> createState() => _Selection2State();
}

class _Selection2State extends State<Selection2> {
  List<String> photos = [
    "images/laptop/labtop1.png",
    "images/laptop/labtop2.png",
    "images/laptop/labtop3.png",
    "images/laptop/labtop4.png",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 167, 3),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5),
            // main container
            Container(
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(50),
              child: Image.asset(photos[selectedIndex], fit: BoxFit.cover),
            ),

            SizedBox(height: 0.1),
            //photos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(photos.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 70,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ),
                      child: Image.asset(photos[index], fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
