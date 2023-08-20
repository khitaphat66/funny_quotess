import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quoteList = [
    'หนังที่ดีที่สุด ยกให้หนังไก่ทอด',
    'เป็นโรคซึมเศร้า แต่ถ้ามีเงินเข้าเดี๋ยวก็หาย',
    'คนอื่นไม่ต้องยุ่ง แค่หัวยุ่งก็พอแล้ว',
    'อดข้าวไม่ว่า เสื้อผ้าห้ามซ้ำ',
    'ผิวที่แตกลาย ยังดีกว่าใจที่แตกร้าว',
  ];
  static const List<MaterialColor> _colorList = [
    Colors.deepPurple, Colors.lightBlue, Colors.red,
  ];

  var _quote = _quoteList[0]; //state varible
  var _color = _colorList[0];

  void _handleClickGo(){
    var rand = Random();
    var newQuote = '';

    do{
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }while(newQuote == _quote);

    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    }while(newColor == _color);


    setState(() {
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวน ๆ')),
      floatingActionButton: FloatingActionButton(
        child: Text('GO'),
          onPressed: _handleClickGo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote,
            style: TextStyle(
              color: _color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
