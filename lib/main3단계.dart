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
        children: getMyList2(),
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
  // List<Widget> getMyList1() {
  //   List<Widget> myList = [
  //     ListTile(
  //       leading: FlutterLogo(size: 50.0),
  //       title: Text('Basic #1'),
  //       subtitle: Text('타이틀과 서브 타이틀로만 구성'),
  //       trailing: Icon(Icons.more_vert),
  //       onTap: () {
  //         print('Basic #1');
  //       },
  //     ),
  //     Divider(
  //       color: Colors.black,
  //       height: 5,
  //       // indent: 10,
  //       // endIndent: 10,
  //     ),
  //   ];
  //   return myList;
  // }

  // 3단계 : 데이터를 이용해서 개수만큼 반복해서 List 생성
  List<Widget> getMyList2() {
    // 데이터로 사용할 리스트 생성
    List<Person> Persons = [];
    /**
    내부 데이터를 통해 단순 반복한다. 차후에는 Spring서버에서 REST API를 통해 데이터를 가져올 수 있다.
     */
    for (int i = 0; i < 10; i++) {
      Persons.add(Person(i + 21, '홍길동$i', true));
    }

    // 데이터를 이용하여 리스트 생성
    List<Widget> myList = [];
    for (int i = 0; i < Persons.length; i++) {
      /**
      데이터의 개수만큼 리스트타일을 생성하여 List에 추가한다. ListTile은 widget으로 받을 수 있다. 
       */
      Widget wid = ListTile(
        leading: FlutterLogo(size: 50.0),
        title: Text('Basic #$i'),
        subtitle: Text('${Persons[i].name} - ${Persons[i].age}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic #$i');
        },
      );
      // 리스트타일 인스턴스를 생성 후 List에 추가
      myList.add(wid);
    }
    return myList;
  }
}

// 데이터로 사용할 클래스
class Person {
  // 멤버변수
  int age;
  String name;
  bool isLeftHand;
  // 생성자
  Person(this.age, this.name, this.isLeftHand);
}
