import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:travel_app/profile.dart';

class SearchFlightPage extends StatefulWidget {
  const SearchFlightPage({super.key});

  @override
  State<SearchFlightPage> createState() => _SearchFlightPageState();
}

class _SearchFlightPageState extends State<SearchFlightPage> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalPages = 4; // Number of items in your carousel
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _totalPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 200,
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'images/profile.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Hi Nipun",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 180,
              ),
              const Icon(
                Icons.message,
                color: Colors.white,
                size: 30,
              ),
               const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              itemCount: _totalPages,
              itemBuilder: (BuildContext context, int index) {
                String imagePath;

                switch (index) {
                  case 0:
                    imagePath = 'images/place2.jpeg';
                    break;
                  case 1:
                    imagePath = 'images/place10.jpeg';
                    break;
                  case 2:
                    imagePath = 'images/place9.jpeg';
                    break;
                  case 3:
                    imagePath = 'images/place1.jpeg';
                    break;
                  default:
                    imagePath = 'images/default.jpeg';
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imagePath,
                          height: 300,
                          width: MediaQuery.of(context).size.width - 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
             controller: _pageController,
    onPageChanged: (int index) {
      setState(() {
        _currentPage = index;
        if (_currentPage == _totalPages - 1) {
          Future.delayed(const Duration(seconds: 1), () {
            _pageController.jumpToPage(0);
          });
        }
                });
              },
            ),
          ),
          Center(
            child: SizedBox(
              height: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _totalPages,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.black
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 23),
                child: SizedBox(
                  height: 50,
                  child: Text(
                    "Our Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 0.5,
          ),
          const SizedBox(
            height: 0.5,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 132,
            width: 390,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(1, 26, 41, 0.612),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10 May, 12.30 pm",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "11 May, 8.20 am",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ABC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("-----"),
                    Icon(Icons.flight),
                    Text("------"),
                    Text(
                      "XYZ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(173, 206, 225, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Srilanka, Colombo",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 1, 1, 0.612),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(173, 206, 225, 100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "India, Chennai",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 1, 1, 0.612),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Packages",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 160,
                    width: 95,
                    child: popularDestination('images/place1.jpeg', "Delhi", "India"),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 160,
                    width: 95,
                    child: popularDestination('images/place2.jpeg', "Paris", "France"),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 160,
                    width: 95,
                    child: popularDestination('images/place3.jpeg', "Paris", "France"),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 160,
                    width: 95,
                    child: popularDestination('images/place4.jpeg', "Paris", "France"),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 160,
                    width: 95,
                    child: popularDestination('images/place6.jpeg', "Pannala", "Sri Lanka"),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularDestination(String img, String city, String country) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 160,
      width: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 114,
            width: 91,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            city,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            country,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
