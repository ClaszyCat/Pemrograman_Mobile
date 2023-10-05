import 'package:flutter/material.dart';
import 'package:flutter_coffe_shop/util/coffee_tile.dart';
import 'package:flutter_coffe_shop/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Americano',
      false,
    ],
    [
      'Caramel',
      false,
    ],
  ];
  //user click on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.menu),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.person),
              )
            ]),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ]),
        body: Column(children: [
          //Find the Best Coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best Coffee for you",
              style: GoogleFonts.poppins(
                fontSize: 48,
              ),
            ),
          ),
          SizedBox(height: 25),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your Coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  )),
            ),
          ),

          SizedBox(height: 25),
          //horizontal listview coffe tiles
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    });
              },
            ),
          ),
          // scrollDirection: Axis.horizontal,
          // children: [
          //   CoffeeType(
          //     coffeeType: 'Cappucino',
          //     isSelected: true,
          //     onTap: coffeeTypeSelected,
          //   ),
          //   CoffeeType(
          //     coffeeType: 'Caramel',
          //     isSelected: false,
          //     onTap: coffeeTypeSelected,
          //   ),
          //   CoffeeType(
          //     coffeeType: 'Americano',
          //     isSelected: false,
          //     onTap: coffeeTypeSelected,
          //   ),
          // ],
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeImagePath: 'lib/images/Caramel-latte.jpg',
                coffeName: 'Caramel',
                coffePrice: '15.000',
              ),
              CoffeeTile(
                coffeImagePath: 'lib/images/Americano-Hot.jpeg',
                coffeName: 'Americano',
                coffePrice: '20.000',
              ),
              CoffeeTile(
                coffeImagePath: 'lib/images/Espresso.jpg',
                coffeName: 'Espresso',
                coffePrice: '18.000',
              ),
            ],
          ))
        ]));
  }
}
