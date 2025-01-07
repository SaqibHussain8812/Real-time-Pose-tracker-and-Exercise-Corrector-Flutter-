import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:poseapp/common/bottom_navigation.dart';
import 'package:poseapp/common/color2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List info = [];

  _initData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("json/info.json");
    setState(() {
      info = jsonDecode(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        title: const Text(
          "Fitness",
          style: TextStyle(color: text1, fontWeight: FontWeight.w700),
        ),
        backgroundColor: bluescreen,
      ),
      bottomNavigationBar: const MyBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "DON'T\nGIVE UP",
                        style: TextStyle(
                          color: text1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "On Your Dreams",
                      style: TextStyle(
                        color: text2,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: size.width * 0.03),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/exercise");
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 15, right: 10),
                        width: double.infinity,
                        height: 240,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/images/5008.jpg"),
                              fit: BoxFit.fill),
                          color: cardcolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lets\nStart\nExercise",
                              style: TextStyle(
                                  color: text1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, "/exercise");
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Continue",
                                style: TextStyle(
                                  color: text1,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kFirstColor),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/progress");
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: bluescreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Row(
                          children: [
                            Icon(Icons.bar_chart, color: kFirstColor, size: 40),
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Report",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Your exercise report",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Area of Focus",
                      style: TextStyle(color: text1, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (_, i) {
                        int a = 2 * i;
                        int b = 2 * i + 1;
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 170,
                                margin:
                                    const EdgeInsets.only(left: 25, bottom: 15),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(info[a]['img']),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: cardcolor,
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: cardcolor,
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[a]['title'],
                                    style: const TextStyle(
                                        color: text1, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 170,
                                margin:
                                    const EdgeInsets.only(left: 25, bottom: 15),
                                padding: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(info[b]['img']),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: cardcolor,
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: cardcolor,
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[b]['title'],
                                    style: const TextStyle(
                                        color: text1, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
