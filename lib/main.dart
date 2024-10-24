import 'package:flutter/material.dart';

import 'search_dropdown_controller.dart';
import 'search_dropdown_field_settings.dart';
import 'search_dropdown_item.dart';
import 'search_dropdown_typeahead_config.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  int _counter = 0;


  final  SearchDropdownController dropdownController = ValueNotifier<Map<SearchDropdownItem, int>>({});


  final List<SearchDropdownItem> allItemsList = [
    SearchDropdownItem(
      name: "Organic Gala Apple",
      description: "1lb",
      id: 1,

    ),
    SearchDropdownItem(
      name: "Bayer Aspirin",
      description: "500mg, 100 Tablets",
      id: 2,

    ),

  ];

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),





      body: Center(
        child: Container(
          width: 800,
          height: 800,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 40,
            maxHeight: MediaQuery.of(context).size.height - 40,
          ),
          color: const Color(0xB312122A),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SearchDropdownTypeAhead(
                  controller: TextEditingController(),
                  dropdownController: dropdownController,
                  settings: FieldSettings(),
                  allItemList: allItemsList,
                ),
              ),
            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
