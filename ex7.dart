import 'package:flutter/material.dart';


class AnimExample7 extends StatefulWidget {
  const AnimExample7({super.key});

  @override
  State<AnimExample7> createState() => _AnimExample7State();
}

class _AnimExample7State extends State<AnimExample7>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  // 곡선 하나당 한 줄: 왼쪽 → 오른쪽으로 굴러가는 공
  Widget _buildLane(String label, Curve curve, Color color) {
    // 컨트롤러(0→1)에 곡선을 씌운다
    final animation = CurvedAnimation(parent: _ctrl, curve: curve);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(label, style: const TextStyle(fontSize: 13))),
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                // Align 의 x: -1(왼쪽 끝) ~ 1(오른쪽 끝)
                return Align(
                  alignment: Alignment(animation.value * 2 - 1, 0),
                  child: child,
                );
              },
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('애니 7 · Curve 비교')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLane('linear', Curves.linear, Colors.grey),
            _buildLane('easeInOut', Curves.easeInOut, Colors.blue),
            _buildLane('bounceOut', Curves.bounceOut, Colors.orange),
            _buildLane('elasticOut', Curves.elasticOut, const Color(0xFF724BDE)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _ctrl.forward(from: 0), // 처음부터 재생
              child: const Text('출발! (같은 1.5초, 다른 리듬)'),
            ),
          ],
        ),
      ),
    );
  }
}
