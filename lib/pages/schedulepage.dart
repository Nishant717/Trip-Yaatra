import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late VideoPlayerController _controller;
  // ignore: unused_field
  late Future<void> _initializeVideoPlayerFuture;
  // ignore: unused_field, prefer_final_fields
  Color _colordetail = Colors.white.withOpacity(1.0);
  Color _coloroffer = const Color.fromARGB(255, 84, 138, 183);
  Color _colorreviews = Colors.white.withOpacity(1.0);
  bool isFabVisible = true;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/Sample.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: ListView(children: <Widget>[
          Column(children: [
            // FutureBuilder(
            //   future: _initializeVideoPlayerFuture,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       return AspectRatio(
            //         aspectRatio: 16 / 13,
            //         child: VideoPlayer(_controller),
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: _colordetail,
                        shadowColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/details');
                        setState(() {
                          _colordetail = const Color.fromARGB(255, 84, 138, 183);
                          _coloroffer = Colors.white.withOpacity(1.0);
                          _colorreviews = Colors.white.withOpacity(1.0);
                          // Change the color to your desired color on click
                        });
                      },
                      child: const Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: _coloroffer,
                        shadowColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _colordetail = Colors.white.withOpacity(1.0);
                          _coloroffer = const Color.fromARGB(255, 84, 138, 183);
                          _colorreviews = Colors.white.withOpacity(1.0);
                        });
                      },
                      child: const Text(
                        'Schedule', // Replace with your desired text
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black, // Adjust the text size as needed
                          fontWeight: FontWeight
                              .bold, // You can customize the font weight
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: _colorreviews,
                        shadowColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _colordetail = Colors.white.withOpacity(1.0);
                          _coloroffer = Colors.white.withOpacity(1.0);
                          _colorreviews = const Color.fromARGB(255, 84, 138, 183);
                          // Change the color to your desired color on click
                        });
                      },
                      child: const Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 180, 10),
              child: Text(
                "Schedule",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF41465D),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "DAY-1",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF41465D),
              ),
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Reporting at Manali Campsite",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF41465D),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Day-1.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "DAY-2",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF41465D),
              ),
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Trekking towards Advanced Base Camp",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF41465D),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Day-2.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "DAY-3",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF41465D),
              ),
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Trek to Bhrigu Lake, Visit & Back",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF41465D),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Day-3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "DAY-4",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF41465D),
              ),
            ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Return trek to Gulaba & Disperse",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF41465D),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Day-4.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ]),
        ]),
      ),
      // floatingActionButton: Visibility(
      //   visible: isFabVisible, // Set the visibility based on the flag
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(0, 0, 150, 525),
      //     child: FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           isFabVisible = false;
      //           if (_controller.value.isPlaying) {
      //             _controller.pause();
      //           } else {
      //             _controller.play();
      //           }
      //         });
      //       },
      //       child: Icon(
      //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //       ),
      //     ),
      //   ),
      // ),
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
