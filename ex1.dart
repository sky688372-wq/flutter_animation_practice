import 'package:flutter/material.dart';

class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  List<String> AnimatedContainer_rule = [
    "1. AnimatedContainer는 일반적인 Container처럼 사용한다.",
    "2. AnimatedContainer는 duration과 curve만 지정하면, width/height/color/decoration 등의 값이 바뀔 때 자동으로 애니메이션 된다.",
    "3. 애니메이션을 실행시키려면 setState()로 값(예: width, color)을 바꿔주기만 하면 된다. Controller는 필요 없다.",
    "4. duration은 애니메이션이 진행되는 시간, curve는 애니메이션의 속도 변화(가속/감속) 곡선을 의미한다. (예: Curves.easeInOut)",
    "5. AnimatedContainer는 이전 값과 새 값 사이를 자동으로 보간(값을 서서히 채워서 변화)해준다.",
    "6. 색상이 바뀔 때는 color 대신 decoration의 BoxDecoration(color: ...)을 써야 borderRadius 등 다른 속성과 함께 애니메이션이 자연스럽게 적용된다.",
    "7. AnimatedContainer는 '값만 바뀌면 알아서 보간해주는' 암시적(implicit) 애니메이션 위젯이다.",
  ];

  bool _isCircle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "애니 1 · AnimatedContainer",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),

      //메인 콘텐츠 시작 부분
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),

            Center(
              child: Column(
                children: [
                  Text(
                    "버튼을 누르면 레디우스가 천천히 바뀜",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 40),

                  AnimatedContainer(
                    duration: Duration(seconds: 10),
                    curve: Curves.easeInOut,
                    width: _isCircle ? 150 : 200,
                    //정사각형은 200, 원은 150
                    height: _isCircle ? 150 : 200,
                    //정사각형은 200, 원은 150
                    decoration: BoxDecoration(
                      color: _isCircle ? Colors.blue : Colors.red,
                      borderRadius: BorderRadius.circular(
                        _isCircle ? 100 : 0,
                      ), //정사각형은 0, 원은 100
                    ),
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () => setState(() {
                      _isCircle = !_isCircle;
                    }),
                    child: Text(
                      "애니메이션 실행!",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //설명 타일
            ListView.builder(
              itemCount: AnimatedContainer_rule.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = AnimatedContainer_rule[index];

                return ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text(item),
                  contentPadding: EdgeInsetsGeometry.symmetric(vertical: 10),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
