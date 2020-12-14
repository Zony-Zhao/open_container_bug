import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'PageA',
      routes: {
        'PageA':(_)=>PageA(),
        'PageB':(_)=>PageB()
      },
    );
  }
}
class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('PageA'),
      ),
      body: Builder(
        builder:(_)=> Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children:
            [
              OpenContainer(
              closedBuilder: (_,__)=>ListTile(title: Text('click here, it will go to PageB (works well)'),),
              openBuilder: (_,__)=>PageB(),
            ),
              OpenContainer(
              closedBuilder: (_,__)=>ListTile(title: Text('click here, it will go to PageC. Inside PageC, I will route to Page B with Page A as the root. '),),
              openBuilder: (_,__)=>PageC(),
            ),
            ],
          ),
        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pageB'),),
      body: Center(child: Text(' you are in page B'),),);
  }
}
class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pageC'),),
      body: Center(child: RaisedButton(child:Text('click here to route to pageB. And then click the back button on PageB, you will see the error'), onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>PageB()),   ModalRoute.withName('PageA'));

      },),),);
  }
}

