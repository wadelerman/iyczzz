import 'package:flutter/material.dart';
import 'package:iycz/component/drawer_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void openDrawer() {
      scaffoldKey.currentState?.openDrawer();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              Container(
                width: double.maxFinite,
                height: 49,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset.zero,
                        blurRadius: 5.0,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                      splashRadius: 10,
                    ),
                    SizedBox(
                      width: screenWidth - 160,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          focusColor: Colors.black,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      splashRadius: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: MusicItem(
                        image: "assets/ic_disc.png",
                        musicName: "Music $index",
                        artist: "Siapa kek",
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return DraggableScrollableSheet(
                                    initialChildSize: 0.85,
                                    maxChildSize: 0.85,
                                    minChildSize: 0.85,
                                    builder: (context, controller) {
                                      return Container(
                                        height: screenHeight * 0.85,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(70.0),
                                          ),
                                          color: Color.fromARGB(
                                              255, 242, 242, 242),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 5,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(2.5),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "Music $index",
                                              style: const TextStyle(
                                                  fontSize: 24.0,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            const Text(
                                              "Siapa kek",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 12.0,
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                controller: controller,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text("test"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Nama Profile",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(360.0),
                  child: Image.asset(
                    "assets/ic_disc.png",
                    width: 127,
                    height: 127,
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                DrawerItem(
                  text: "Lagu",
                  onTap: () {},
                ),
                DrawerItem(
                  text: "Profile",
                  onTap: () {},
                ),
                DrawerItem(
                  text: "Sign Out",
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
