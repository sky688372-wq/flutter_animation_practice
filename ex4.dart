import 'package:flutter/material.dart';

class Ex4 extends StatefulWidget {
  const Ex4({super.key});

  @override
  State<Ex4> createState() => _Ex4State();
}

class _Ex4State extends State<Ex4> {

  int _currentNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('애니 4 · AnimatedSwitcher'),
      ),

      //메인 콘텐츠

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 4000),
              //교체 방식을 정하는 부분
              transitionBuilder: (child, animation) {
                // 위젯을 화면에 정상적으로 렌더링하기 위해 return 키워드가 필요
                return ScaleTransition(
                  scale: animation, child: child,
                );
              },
              child: Text(
                _currentNum.toString(),
                key: ValueKey(_currentNum), // _currentNum이 변화나는 것이 트리거다.
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
            ),

            SizedBox(height: 30,),

            ElevatedButton(
                onPressed: () => setState(() {
                  _currentNum++;
                }),
                child: Text(
                    "+"
                )
            )
          ],
        ),
      ),
    );
  }
}