import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  late final double height;

  TextStyle bold18TextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle red22TextStyle = TextStyle(color: Colors.red, fontSize: 22);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Venue Name", style: bold18TextStyle, ),
        actions: const [Icon(Icons.close, size: 30,)],
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalImages(),
              SizedBox(height: 20),
              solProperties(),
              SizedBox(height: 20),
              about(),
              SizedBox(height: 30,),
              addOns(),
              SizedBox(height: 25,),
              help(),
            ],
          )
        ],
      ),
    );
  }

  about() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("About", style: bold18TextStyle,),
          SizedBox(height: 20,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ratings(23)", style: TextStyle(color: Colors.grey),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.red,),
                      Icon(Icons.star, color: Colors.red,),
                      Icon(Icons.star, color: Colors.red,),
                      Icon(Icons.star, color: Colors.red,),
                      Icon(Icons.star, color: Colors.red,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Time Min/Max", style: TextStyle(color: Colors.grey)),
                  Text("   2hr/10hr", style: TextStyle(color: Colors.red, fontSize: 18)),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Capacity", style: TextStyle(color: Colors.grey),),
                  Text("100",style: TextStyle(color: Colors.red, fontSize: 18)),
                  SizedBox(height: 10,),
                  Text("Space", style: TextStyle(color: Colors.grey)),
                  Text("1500 Sq Ft", style: TextStyle(color: Colors.red, fontSize: 18)),

                ],
              ),

            ],
          )
        ],
      ),
    );
  }

  solProperties() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16 ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset("assets/images/place4.jpg",height: 60, width: 60,fit: BoxFit.fill,),
          ),
          Text(" Sol Properties \n Venue Hosts \n 3rd World"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text("\$200/hr", style: red22TextStyle,),
          )
        ],
      ),
    );
  }

  horizontalImages() {
    return Scrollbar(
      child: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            img("assets/images/place1.jpg"),
            img("assets/images/place3.jpg"),
            img("assets/images/place4.jpg"),
            img("assets/images/place2.jpg"),
            img("assets/images/place5.jpg")
          ],
        ),
      ),

    );
  }

  Widget img(String path){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,  bottom: 8, left: 16),
      // padding: const EdgeInsets.all(0),
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(path, width: 150,fit: BoxFit.fill,)),
    );
  }

  addOns() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Equipment Add-Ons", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Service Add-Ons", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  help() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Rules", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Ameneties", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Covid 19 Protocols", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Spacer(),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ],
      ),
    );
  }

}


