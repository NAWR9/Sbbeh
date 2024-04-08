import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter = 0;

  setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", counter);
  }

  loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt("counter")!;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devWidth = MediaQuery.of(context).size.width;
    final devHeight = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Container(
                height: devHeight,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center)),
                child: Stack(
                  children: [
                    const Center(
                        heightFactor: 2.5,
                        child: Text(
                          "سَــبِّـحْ",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.amber,
                              fontFamily: "Reem"),
                        )),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: devHeight * 0.25,
                          ),
                          Text(
                            "$counter",
                            style: TextStyle(fontSize: 50, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: devHeight * 0.20),
                            width: 270,
                            height: 270,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff19173D),
                                      Color(0xff272367)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topRight,
                                    stops: [0.1, 0.6]),
                                borderRadius: BorderRadius.circular(500),
                                border: const Border(
                                    bottom: BorderSide(
                                        width: 5, color: Color(0xff00D7FF)),
                                    left: BorderSide(
                                        width: 2, color: Color(0xff00D7FF))),
                                color: const Color(0xff2D296F)),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  ++counter;
                                  setData();
                                });
                              },
                              child: Text(""),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: devWidth * 0.40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff19173D),
                                            Color(0xff272367)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topRight,
                                          stops: [0.1, 0.6]),
                                      borderRadius: BorderRadius.circular(500),
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 2,
                                              color: Color(0xff00D7FF)),
                                          left: BorderSide(
                                              width: 1,
                                              color: Color(0xff00D7FF))),
                                      color: const Color(0xff2D296F)),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        counter = 0;
                                        setData();
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.replay,
                                      color: Color(0xff00D7FF),
                                    ),
                                    iconSize: 45,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
