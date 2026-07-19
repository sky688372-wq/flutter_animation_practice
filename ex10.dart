import 'package:flutter/material.dart';

class Ex10 extends StatefulWidget {
  const Ex10({super.key});

  @override
  State<Ex10> createState() => _Ex10State();
}

class _Ex10State extends State<Ex10> with TickerProviderStateMixin {
  late AnimationController _logoCtrl; // 심볼 팡
  late AnimationController _textCtrl; // 글자 펼침
  late AnimationController _bounce; // NEXT 통통
  bool _showSlogan = false;

  @override
  void initState() {
    super.initState();

    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    _textCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    _bounce = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    _bounce.dispose();
    super.dispose();
  }

  // 등장 순서 연출
  Future<void> _play() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    _logoCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    _textCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() => _showSlogan = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF724BDE),

      appBar: AppBar(centerTitle: true, title: Text('애니 10 · 미니 인트로 (응용)')),

      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: Tween<double>(begin: -0.5, end: 0).animate(
                        CurvedAnimation(
                          parent: _logoCtrl,
                          curve: Curves.easeOut,
                        ),
                      ),
                      child: ScaleTransition(
                        alignment: Alignment(-1, 0),
                        scale: CurvedAnimation(
                          parent: _logoCtrl,
                          curve: Curves.elasticOut,
                        ),
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ),

                    SizedBox(width: 30),

                    SizeTransition(
                      axis: Axis.horizontal,
                      alignment: Alignment(-1, 0),
                      sizeFactor: CurvedAnimation(
                        parent: _textCtrl,
                        curve: Curves.easeInOut,
                      ),
                      child: Text(
                        "CONNEX CHAT",
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                //슬로건 부분
                AnimatedSlide(
                  offset: _showSlogan ? Offset.zero : Offset(0, 0.5),
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: _showSlogan ? 1 : 0,
                    duration: Duration(milliseconds: 1000),
                    child: Text(
                      "언제 어디서든 안정적인 근무 환경을 위해",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: _buildBouncingNext(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBouncingNext() {
    return AnimatedBuilder(
      animation: _bounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 * _bounce.value),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () => setState(() {
          _play();
        }),

        child: Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'START',
            style: TextStyle(
              color: Color(0xFF724BDE),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}