import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      /**
      방법1 : 명시적으로 ListVeiw의 children으로 List를 넘겨서 생성. 리스트뷰가 로드될때 데이터까지
        같이 로드되므로 항목의 개수가 적을때 적합한 방법 
       */
      // 1. 명시적으로 LiveView의 children으로 List를 넘겨서 생성
      body: ListView(
        children: getMyList1(),
        // children: [
        //   ListTile(
        //     // 좌측아이콘(or 이미지)
        //     leading: FlutterLogo(size: 50.0),
        //     // 타일에 출력할 제목
        //     title: Text('Basic #1'),
        //     // 출력할 내용
        //     subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        //     // 우측아이콘
        //     trailing: Icon(Icons.more_vert),
        //     // 타일을 터치했을때 액션 처리
        //     onTap: () {
        //       print('Basic #1');
        //     },
        //   ),
        // ],
        // children: getMyList1(),
        // children: getMyList2(),
      ),
    );
  }

  // 2단계 : body 내에 작성했던 코드를 외부 함수로 구현
  List<Widget> getMyList1() {
    List<Widget> myList = [
      ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text('Basic #1'),
        subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #1');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
        // indent: 10,
        // endIndent: 10,
      ),
    ];
    return myList;
  }

  // // 메서드의 리턴값으로 Scaffold의 body에 들어갈 ListView를 생성할 수 있음
  // List<Widget> getMyList2() {...}
}
