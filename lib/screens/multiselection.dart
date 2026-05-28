import 'package:flutter/material.dart';

class Multiselection extends StatefulWidget {
  const Multiselection({super.key});

  @override
  State<Multiselection> createState() => _MultiselectionState();
}

class _MultiselectionState extends State<Multiselection> {
  List<String> types = [
    'New',
    'Sports',
    'Media',
    'Buisness ',
    'Technology',
    'Flutter',
    'Fashion',
    'Gaming',
    'Lifestyle',
    'Movies',
    'Ai',
    'Travel',
    'Food',
    'Comedy',
    'Helth ',
    'Beauty',
  ];

  Set<String> empty = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'What do you want to see on X?',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),

              Wrap(
                spacing: 20,
                runSpacing: 15,
                children: List.generate(types.length, (index) {
                  final type = types[index];
                  final isSelected = empty.contains(type);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isSelected) {
                          empty.add(type);
                        } else {
                          empty.remove(type);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      width: 100,
                      height: 50,
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeInCubic,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.yellow : Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 7,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: FittedBox(
                        fit: BoxFit
                            .scaleDown, // تصغيرالخط اذا  كانت الكلمة اطول من المساحة
                        child: Text(
                          type,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 30),

              // empty List
              Center(
                child: Column(
                  spacing: 5,
                  children: empty.map((v) {
                    return Text(v, style: TextStyle(color: Colors.white));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
