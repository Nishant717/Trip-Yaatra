// ignore_for_file: depend_on_referenced_packages, avoid_print

// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:test_firebase/pages/indianpackage.dart';
// ignore: unused_import
import 'package:test_firebase/pages/trippage.dart';
// ignore: unused_import
// import 'package:test_firebase/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/Manali.jpg'},
    {"id": 2, "image_path": 'assets/Goa.jpg'},
    {"id": 3, "image_path": 'assets/Spiti.jpg'},
    {"id": 4, "image_path": 'assets/kerela.jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 249, 246, 246),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(2, 1),
            colors: <Color>[
              Color.fromARGB(255, 84, 138, 183),
              Color.fromARGB(255, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
            child: ListView(children: [
          Column(children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 150.0, 5.0),
                  child: IconButton(
                    iconSize: 60.0,
                    onPressed: () {
                      // Add your button's onPressed logic here
                    },
                    icon: Image.asset(
                      'assets/tripyatra.png',
                      fit: BoxFit.cover,
                    ), // Replace with your image path
                  ),
                ),
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  "Nishant",
                  style: TextStyle(
                    color: Color.fromARGB(255, 58, 90, 116),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 5.0, 10.0),
              child: TextFormField(
                cursorColor: const Color.fromARGB(255, 0, 0, 0),
                decoration: InputDecoration(
                  suffixIconColor: Colors.black,
                  hintText: "Search",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed logic here
                    Navigator.pushNamed(context, "/internationalpackages");
                  },
                  style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use, prefer_const_constructors
                      primary: Color.fromARGB(255, 170, 197, 219),
                      shadowColor: Colors.black),
                  child: const Text(
                    'International Packages', // Replace with your desired text
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      // Adjust the text size as needed
                      fontWeight:
                          FontWeight.bold, // You can customize the font weight
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed logic here
                    // ignore: unused_label

                    Navigator.pushNamed(context, "/indianpackages");
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use, prefer_const_constructors
                    primary: Color.fromARGB(255, 170, 197, 219),
                    shadowColor: Colors.black,
                  ),
                  child: const Text(
                    'India Packages', // Replace with your desired text
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black, // Adjust the text size as needed
                      fontWeight:
                          FontWeight.bold, // You can customize the font weight
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (item) => Image.asset(item['image_path'],
                                  fit: BoxFit.cover, width: double.infinity),
                            )
                            .toList(),
                        //  carouselController: CarouselController,
                        options: CarouselOptions(
                          autoPlayAnimationDuration:const  Duration(milliseconds: 800),
                          
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 250, 0),
              child: Text(
                "Travel places",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF41465D),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Card(
                          elevation: 1.0,
                          color: const Color.fromARGB(255, 170, 197, 219),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/Manali.jpg',
                                  width: 200.0),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Manali,India',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40.0,
                                    ),
                                    IconButton(
                                        iconSize: 30.0,
                                        onPressed: () {
                                          Share.share(
                                              'check out my website https://whatsapp.com');
                                        },
                                        icon: const Icon(Icons.share_sharp)),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '6 Days 7 Nights',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text('4.5'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "₹15000/-",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Implement booking functionality
                                      Navigator.pushNamed(context, '/details');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // ignore: deprecated_member_use
                                      primary: const Color.fromARGB(
                                          255, 84, 138, 183),
                                      // ignore: deprecated_member_use
                                      onPrimary: Colors.white,
                                    ),
                                    child: const Text('Details'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(3, 5, 220, 0),
              child: Text(
                "Best Destination",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF41465D),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Card(
                        elevation: 1.0,
                        color: const Color.fromARGB(255, 170, 197, 219),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset('assets/Manali.jpg',
                                      width: 200.0)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 0.0, 10.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Manali,India',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 10.0, 55.0, 10.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text('4.5'),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Implement booking functionality
                                        Navigator.pushNamed(
                                            context, '/details');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        // ignore: deprecated_member_use
                                        primary: const Color.fromARGB(
                                            255, 84, 138, 183),
                                        // ignore: deprecated_member_use
                                        onPrimary: Colors.white,
                                      ),
                                      child: const Text('Details'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ])
        ])),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: BottomAppBar(
          padding: const EdgeInsets.all(6.0),
          color: const Color.fromARGB(255, 84, 138, 183),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  iconSize: 30.0,
                  onPressed: () {},
                  icon: const Icon(Icons.add_comment_outlined)),
              IconButton(
                  iconSize: 30.0,
                  onPressed: () {},
                  icon: const Icon(Icons.airplane_ticket_outlined)),
              IconButton(
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  icon: const Icon(Icons.home_outlined)),
              IconButton(
                  iconSize: 30.0,
                  onPressed: () {},
                  icon: const Icon(Icons.rate_review_outlined)),
              IconButton(
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: const Icon(Icons.account_circle_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
