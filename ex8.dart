import 'package:flutter/material.dart';

class Ex8 extends StatefulWidget {
  const Ex8({super.key});

  @override
  State<Ex8> createState() => _Ex8State();
}

class _Ex8State extends State<Ex8> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl; // 애니메이션 컨트롤러 선언

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('애니 8 · 무한 반복(통통)')),

      //메인 콘텐츠
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _ctrl,
              builder: (context, child) {
                // _bounce.value: 0~1 왕복 → 0 ~ -20 (위로 떠오르는 거리)로 변환
                final double moveUp = -20 * _ctrl.value;

                return Transform.translate(
                  offset: Offset(0, moveUp),
                  child: child,
                );
              },
              child: Container(
                width: 50,
                height: 50,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
