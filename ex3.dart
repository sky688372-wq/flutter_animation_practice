import 'package:flutter/material.dart';

class Ex3 extends StatefulWidget {
  const Ex3({super.key});

  @override
  State<Ex3> createState() => _Ex3State();
}

class _Ex3State extends State<Ex3> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('애니 3 · AnimatedSlide')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSlide(
              offset: _isShow ? Offset.zero : Offset(0, 2),
              duration: Duration(milliseconds: 4000),
              child: AnimatedOpacity(
                opacity: _isShow ? 1 : 0,
                duration: Duration(milliseconds: 4000),
                child: Text(
                  "지금은 저녁먹고 다시 공부하는 중...",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            ElevatedButton(
                onPressed: () => setState(() {
                  _isShow = !_isShow;
                }),
                child: Text(
                  _isShow? "힘들구만 힘들어..." : "애니메이션이 끝나면 json을 연습하다가 자야지..."
                )
            )
          ],
        ),
      ),
    );
  }
}
