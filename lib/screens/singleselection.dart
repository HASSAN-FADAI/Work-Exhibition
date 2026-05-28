import 'package:flutter/material.dart';

class Singleselection extends StatefulWidget {
  const Singleselection({super.key});

  @override
  State<Singleselection> createState() => _SingleselectionState();
}

class _SingleselectionState extends State<Singleselection> {
  List<Map> gift = [
    {'name': 'Lion', 'image': 'images/animals/lion.png'},
    {'name': 'Cow', 'image': 'images/animals/cow (1).png'},
    {'name': 'Deer', 'image': 'images/animals/deer.png'},
    {'name': 'Giraffe', 'image': 'images/animals/giraffe.png'},
    {'name': 'Pingeon', 'image': 'images/animals/pingeon.png'},
    {'name': 'Rat', 'image': 'images/animals/rat.png'},
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: GridView.builder(
          itemCount: gift.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 4,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black12,
                                  Colors.black26,
                                  Colors.black26,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Column(
                    children: [
                      Image.asset(
                        width: 300,
                        height: selectedIndex == index ? 100 : 82,
                        gift[index]['image'],
                      ),

                      SizedBox(height: 20),
                      selectedIndex == index
                          ? SizedBox.shrink()
                          : Text(
                              '${gift[index]['name']}',
                              style: TextStyle(
                                color: const Color.fromARGB(150, 255, 255, 255),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                    ],
                  ),
                  selectedIndex == index
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            color: const Color.fromARGB(255, 248, 195, 2),

                            child: Center(
                              child: Text(
                                "Send",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
