import 'package:flutter/material.dart';

class Ex6 extends StatefulWidget {
  const Ex6({super.key});

  @override
  State<Ex6> createState() => _Ex6State();
}

class _Ex6State extends State<Ex6> with SingleTickerProviderStateMixin { //요기 with ~ 필수
  
  late AnimationController _ctrl; //애니메이션 컨트롤러 선언
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('애니 6 · AnimationController'),
      ),

      //메인 콘텐츠 부분
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition( //크기를 조정하는 애니메이션 위젯
              scale: _ctrl,
              child: Container(
                width: 150,
                height: 150,
                
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
            ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //재생 버튼
                _controlButton(_ctrl.forward, "재생"),
                _controlButton(_ctrl.reverse, "거꾸로"),
                _controlButton(() => _ctrl.repeat(reverse: true), "반복"),
                _controlButton(_ctrl.stop, "멈춤"),
              ],
            )
          ],
        ),
      ),

    );
  }

  Widget _controlButton(VoidCallback action, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: action,
          child: Text(text)
      ),
    );
  }
}
