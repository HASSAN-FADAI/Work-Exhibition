import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToogleSelection extends StatefulWidget {
  const ToogleSelection({super.key});

  @override
  State<ToogleSelection> createState() => _ToogleSelectionState();
}

class _ToogleSelectionState extends State<ToogleSelection> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('images/laptop/hassan.png'),
                ),
                //Positioned من اجل التحريك
                Positioned(
                  bottom: -18,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.pink,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 60),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isFollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Fadai Hassan',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
