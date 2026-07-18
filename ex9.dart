import 'package:flutter/material.dart';

class Ex9 extends StatefulWidget {
  const Ex9({super.key});

  @override
  State<Ex9> createState() => _Ex9State();
}

class _Ex9State extends State<Ex9> {
  final List<bool> _show = [false, false, false, false]; //각 애니메이션의 트리거

  //이제 _show의 각 인덱스의 값을 true로 만들함수가 필요함
  Future<void> _start() async {
    for (int i = 0; i < _show.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      if(!mounted) {
        return;
      }

      setState(() {
        _show[i] = true;
      });
    }
  }

  void _reset() {
    for(int i = 0; i < _show.length; i++) {
      setState(() {
        _show[i] = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('애니 9 · 순서대로 등장')),
      //메인 콘텐츠 시작
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("애니메이션 연습 중..."),

            SizedBox(height: 30),

            item(0, "나는 지금...."),
            item(1, "밤 11시 21분에"),
            item(2, "애니메이션 공부중...."),
            item(3, "근데 너무 재밌음"),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: _start,
                    child: Text(
                      "애니메이션 시작하기",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: _reset,
                    child: Text(
                      "초기화",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget item(int i, String text) {
    return AnimatedSlide(
      offset: _show[i] ? Offset.zero : Offset(0, 3),
      duration: Duration(seconds: 1),

      child: AnimatedOpacity(
        opacity: _show[i] ? 1 : 0,
        duration: Duration(seconds: 1),

        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
