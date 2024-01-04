import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late VideoPlayerController _controller;
  // ignore: unused_field
  late Future<void> _initializeVideoPlayerFuture;
  // ignore: unused_field, prefer_final_fields
  Color _colordetail = const Color.fromARGB(255, 84, 138, 183);
  Color _coloroffer = Colors.white.withOpacity(1.0);
  Color _colorreviews = Colors.white.withOpacity(1.0);
  bool isFabVisible = true;
  Icon myIcon = const Icon(Icons.notifications_none);

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
        child: Column(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: 16 / 13,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
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
                        Navigator.pushNamed(context, '/schedule');
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
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 8, 200, 8),
              child: Text(
                'What will you see',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 10, 8),
              child: Text(
                'This is a multiline paragraph in Flutter. You can add as many lines as you want to provide detailed information or content to your users. Flutter makes it easy to create rich text layouts with various formatting options.This is a multiline paragraph in Flutter. You can add as many lines as you want to provide detailed information or content to your users. Flutter makes it easy to create rich text layouts with various formatting options.This is a multiline paragraph in Flutter. You can add as many lines as you want to provide detailed information or content to your users. Flutter makes it easy to create rich text layouts with various formatting options.',
                textAlign: TextAlign.justify, // Set the text alignment
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 1.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 2, 5, 2),
                    child: Row(
                      children: [
                        const Icon(Icons.notification_important),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Get Alert to this remainder'),
                        IconButton(
                            iconSize: 30.0,
                            onPressed: () {
                              setState(() {
                                if(myIcon==const Icon(Icons.notifications))
                                {
                                  myIcon= const Icon(Icons.notifications_active_rounded);
                                }
                                else {
                                  myIcon= const  Icon(Icons.notifications);
                                }
                                // myIcon= const Icon(Icons.notifications);
                              });
                            },
                            icon: myIcon,
                    )],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 525),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                isFabVisible = false;
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          ),
        ),
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
