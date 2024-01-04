import 'package:flutter/material.dart';
 class InternationalPackages extends StatefulWidget {
  const InternationalPackages({super.key});

  @override
  State<InternationalPackages> createState() => _InternationalPackagesState();
}

class _InternationalPackagesState extends State<InternationalPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 246),
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
            Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 10),
                  child: Row(
                    children: [
                      const Text(
                        "International",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "Destination",
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 90, 116),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 40.0,
                      ),
                      IconButton(
                    iconSize: 30.0,
                    onPressed: () {},
                    icon:  const Icon(Icons.settings_outlined)),
                    ],
                  ),
                ),
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Card(
                        elevation: 1.0,
                        color:const Color.fromARGB(255, 170, 197, 219),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.asset('assets/Manali.jpg',
                                      width: 300.0)),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8, 5, 200, 0),
                              child: Text(
                                'Manali,India',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // const Row(
                            //   children: [
                            //     Text(
                            //       '6 Days 7 Nights',
                            //       style: TextStyle(
                            //         fontSize: 15.0,
                            //         fontWeight: FontWeight.w300,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 40.0,
                            //     ),
                            //     Icon(
                            //       Icons.star,
                            //       color: Colors.yellow,
                            //     ),
                            //     Text('4.5'),
                            //   ],
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                              child: Row(
                                children: [
                                  const Text(
                                    "₹15000/-",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 100.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Implement booking functionality
                                      Navigator.pushNamed(context, '/details');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // ignore: deprecated_member_use
                                      primary: const Color.fromARGB(255, 84, 138, 183),
                                      // ignore: deprecated_member_use
                                      onPrimary: Colors.white,
                                    ),
                                    child: const Text('Details'),
                                  ),
                                ],
                              ),
                            ),  
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
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