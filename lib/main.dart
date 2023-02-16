import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      // left: false,
      //right: false,
      //bottom: false,
      child: Scaffold(
        // appBar: AppBar(title: Text('aaaaa')),
        // body: SizedBox(width: double.infinity, child: Text('aaaaaa'),),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey.shade500),
          // margin: EdgeInsets.all(10),
          // width: double.maxFinite,
          //height: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  // height: 100,
                  // width: 100,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
                },
                child: Text('풀스크린'),
              ),
              ElevatedButton(
                onPressed: () async {
                  exitFullScreen();
                },
                child: Text('풀스크린 닫기'),
              ),
              Expanded(
                child: Container(
                  //margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.blue),
                  // width: 100,
                  // height: 100,
                  // child: Text('aaaa'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
