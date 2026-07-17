import 'package:flutter/material.dart';

class Ex5 extends StatefulWidget {
  const Ex5({super.key});

  @override
  State<Ex5> createState() => _Ex5State();
}

class _Ex5State extends State<Ex5> {
  double _target = 0; // 목표 점수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('애니 5 · TweenAnimationBuilder'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween(begin: 0, end: _target), //시작값과 끝값을 지정해준다.
              duration: Duration(milliseconds: 4000),
              curve: Curves.easeInOut, //처음에 느렸다가 중간에 빨랐다가 마지막에 느려진다.
              builder: (context, value, child) {
                return Column(
                  children: [
                    Text(
                      value.toInt().toString(), // 지나가는 값을 정수로 표시
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF724BDE),
                      ),
                    ),
                    SizedBox(height: 20),
                    // 같은 값으로 게이지도 그리기 (0~100 → 0.0~1.0)
                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                        value: value / 100, //1이 최대 0이 최소임
                        minHeight: 12,
                        color: Colors.purple, //칠해질 색깔
                        backgroundColor: Colors.blue, //원래 색깔
                      ),
                    ),

                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => setState(() => _target = 100),
                      child: Text('점수 발표! (0 → 100)'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
