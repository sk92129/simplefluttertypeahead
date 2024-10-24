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
      home: const MyHomePage(title: 'Type_Ahead demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


const List<SearchDropdownItem> allSearchDropdownItems = [
  SearchDropdownItem(
    name: "Organic Gala Apple",
    description: "1lb",
    id: 1,
  ),
  SearchDropdownItem(
    name: "Bayer Aspirin",
    description: "500mg, 100 Tablets",
    id: 8,
  ),
  SearchDropdownItem(
    name: "Ninja 4-Quart Air Fryer",
    id: 9,
  ),
  SearchDropdownItem(
    name: "Apple AirPods Pro",
    description: "with Wireless Charging Case",
    id: 249,
  ),
  SearchDropdownItem(
    name: "Amazon Echo 4th Gen",
    description: "Charcoal",
    id: 99,
  ),
  SearchDropdownItem(
    name: "Chiquita Bananas",
    description: "1 bunch",
    id: 99,
  ),
  SearchDropdownItem(
    name: "NutriBullet Pro Blender",
    description: "900W",
    id: 79,
  ),
  SearchDropdownItem(
    name: "JBL Flip 5 Bluetooth Speaker",
    description: "Waterproof",
    id: 119,
  ),
  SearchDropdownItem(
    name: "Harry Potter and the Sorcerer's Stone",
    description: "Hardcover",
    id: 24,
  ),
  SearchDropdownItem(
    name: "Duracell AA Alkaline Batteries",
    description: "8-Pack",
    id: 8,
  ),
  SearchDropdownItem(
    name: "Keurig K-Classic Single Serve Coffee Maker",
    id: 129,
  ),
  SearchDropdownItem(
    name: "Anker USB-C Fast Charger",
    description: "20W",
    id: 1999,
  ),
  SearchDropdownItem(
    name: "Canon EOS 5D Mark IV DSLR",
    id: 249999,
  ),
  SearchDropdownItem(
    name: "DJI Mavic Air 2 Drone",
    id: 7990,
  ),
  SearchDropdownItem(
    name: "Dawn Ultra Dishwashing Liquid",
    description: "162 oz",
    id: 299,
  ),
  SearchDropdownItem(
    name: "Inception",
    description: "Standard Edition DVD",
    id: 1499,
  ),
  SearchDropdownItem(
    name: "Organic Brown Eggs",
    description: "Dozen",
    id: 399,
  ),
  SearchDropdownItem(
    name: "Fidgetly CTRL High-Speed Fidget Spinner",
    id: 999,
  ),
  SearchDropdownItem(
    name: "Nintendo Switch Game Console",
    id: 29999,
  ),
  SearchDropdownItem(
    name: "Fender Acoustic Guitar",
    id: 19999,
  ),
  SearchDropdownItem(
    name: "Sony WH-1000XM4 Headphones",
    description: "Noise-Canceling",
    id: 34999,
  ),
  SearchDropdownItem(
    name: "Dyson Supersonic Hairdryer",
    id: 39999,
  ),
  SearchDropdownItem(
    name: "Ben & Jerry's Ice Cream",
    description: "1 pint",
    id: 499,
  ),
  SearchDropdownItem(
    name: "iPhone 13 Pro",
    description: "128GB",
    id: 9990,
  ),
  SearchDropdownItem(
    name: "Java Programming for Dummies",
    description: "Paperback",
    id: 2499,
  ),
  SearchDropdownItem(
    name: "Kellogg's Corn Flakes",
    description: "18oz Box",
    id: 399,
  ),
  SearchDropdownItem(
    name: "Kindle Paperwhite",
    description: "8GB, Wi-Fi",
    id: 12999,
  ),
  SearchDropdownItem(
    name: "KitchenAid Mixer",
    description: "5-Quart",
    id: 27999,
  ),
  SearchDropdownItem(
    name: "Kleenex Tissues",
    description: "Box of 160",
    id: 249,
  ),
  SearchDropdownItem(
    name: "Lysol Disinfectant Spray",
    description: "19 oz",
    id: 599,
  ),
  SearchDropdownItem(
    name: "LEGO Star Wars Millennium Falcon",
    id: 15999,
  ),
  SearchDropdownItem(
    name: "Microsoft Surface Laptop",
    description: "135-inch, 256GB",
    id: 99999,
  ),
  SearchDropdownItem(
    name: "Motorola Moto G Smartphone",
    description: "64GB",
    id: 19999,
  ),
  SearchDropdownItem(
    name: "Nutella Hazelnut Spread",
    description: "13 oz",
    id: 399,
  ),
  SearchDropdownItem(
    name: "Old Spice Deodorant",
    description: "3 oz",
    id: 499,
  ),
  SearchDropdownItem(
    name: "Organic Olive Oil",
    description: "169 fl oz",
    id: 899,
  ),
  SearchDropdownItem(
    name: "PlayStation 5 Console",
    id: 49999,
  ),
  SearchDropdownItem(
    name: "Queen-Size Mattress",
    description: "Memory Foam",
    id: 29999,
  ),
  SearchDropdownItem(
    name: "Roku Streaming Stick+",
    id: 4999,
  ),
  SearchDropdownItem(
    name: "Samsung Galaxy S21",
    description: "128GB",
    id: 79999,
  ),
  SearchDropdownItem(
    name: "Tide Laundry Detergent",
    description: "100 fl oz",
    id: 1199,
  ),
  SearchDropdownItem(
    name: "TP-Link WiFi Extender",
    id: 2999,
  ),
  SearchDropdownItem(
    name: "Umbrella",
    description: "Compact, Windproof",
    id: 1999,
  ),
  SearchDropdownItem(
    name: "Vitamix Blender",
    id: 34999,
  ),
  SearchDropdownItem(
    name: "WD 2TB External Hard Drive",
    id: 5999,
  ),
  SearchDropdownItem(
    name: "Whirlpool Washing Machine",
    description: "Top-Loading",
    id: 49999,
  ),
  SearchDropdownItem(
    name: "YETI Rambler Tumbler",
    description: "20 oz",
    id: 2999,
  ),
  SearchDropdownItem(
    name: "Yamaha Acoustic Guitar",
    id: 19999,
  ),
  SearchDropdownItem(
    name: "Ziploc Storage Bags",
    description: "Gallon, 75 Count",
    id: 899,
  ),
  SearchDropdownItem(
    name: "San Diego Zoo Tickets",
    description: "Adult Admission",
    id: 620,
  ),
];



class _MyHomePageState extends State<MyHomePage> {

  final  SearchDropdownController dropdownController = ValueNotifier<Map<SearchDropdownItem, int>>({});


  final List<SearchDropdownItem> allItemsList = [
    const SearchDropdownItem(
      name: "Organic Gala Apple",
      description: "1lb",
      id: 1,
    ),
    const SearchDropdownItem(
      name: "Bayer Aspirin",
      description: "500mg, 100 Tablets",
      id: 2,
    ),

  ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),




      // the container that must visibly contain the search dropdown typeahead seems to need to be large.
      body: Center(
        child: Container(
          width: 600,
          height: 600
          ,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width ,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          color: const Color.fromARGB(241, 250, 238, 17),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const Text("SearchDropdownTypeAhead1"),
              const SizedBox(height: 10,),
              const Text("SearchDropdownTypeAhead2"),
              const SizedBox(height: 10,),
              Expanded(
                child: SearchDropdownTypeAhead(
                  controller: TextEditingController(),
                  dropdownController: dropdownController,
                  settings: FieldSettings(),
                  allItemList: allSearchDropdownItems,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {}, child: const Text("Clear"))
            ],
          ),
        ),
      ),

    );
  }
}
