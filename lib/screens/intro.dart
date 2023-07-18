import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool hasLogin = false;
  late TabController tabController;
  final box = GetStorage();

  bool done = false;
  String check = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasLogin = box.read('hasLogin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double sheight = mediaQuery.size.height;
    double swidth = mediaQuery.size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.jpeg'),
                  fit: BoxFit.fill),
            ),
          ),
          SafeArea(
            child: Center(
              child: Material(
                color: Colors.white,
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: (370 * sheight) / 844,
                  width: (300 * swidth) / 390,
                  child: DefaultTabController(
                    length: 3,
                    child: Builder(
                      builder: (BuildContext context) {
                        tabController = DefaultTabController.of(context)!;
                        return Padding(
                          padding: EdgeInsets.all(18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: TabBarView(
                                  children: [
                                    TabData(
                                      content:
                                          'Aims to help you increase your safety before heading anywhere.',
                                      imge: 'assets/images/img5.jpeg',
                                    ),
                                    TabData(
                                        content:
                                            'Find the safest route for a destination using ALTER ROUTE .',
                                        imge: 'assets/images/security.jpeg'),
                                    TabData2(
                                        content:
                                            'Update yourself to the latest security related events around you only at your fingertips.',
                                        imge: 'assets/images/img1.jpeg'),
                                  ],
                                  physics: NeverScrollableScrollPhysics(),
                                ),
                              ),
                              TabPageSelector(
                                selectedColor: Colors.blue,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.8, 0.35),
            child: Material(
              elevation: 20,
              color: Colors.white,
              borderRadius: BorderRadius.circular((45 * sheight) / 844),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((45 * sheight) / 844),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, '/login');
                  if (tabController.index == 0)
                    tabController.animateTo(tabController.index + 1);
                  else if (tabController.index == 1) {
                    tabController.animateTo(tabController.index + 1);
                    setState(() {
                      done = true;
                    });
                  } else {
                    if (hasLogin) {
                      Navigator.pushNamed(context, '/placesListScreen');
                      tabController.animateTo(0);
                      setState(() {
                        done = false;
                      });
                    } else {
                      box.write('hasLogin', !hasLogin);
                      Navigator.pushNamed(context, '/login');
                      tabController.animateTo(0);
                      setState(() {
                        done = false;
                      });
                    }
                  }
                },
                splashColor: Colors.grey,
                child: Container(
                  child: Icon(
                    done ? Icons.done : Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                  height: (45 * sheight) / 844,
                  width: (45 * sheight) / 844,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabData extends StatelessWidget {
  late final String content;
  late final String imge;
  TabData({required String content, required String imge}) {
    this.content = content;
    this.imge = imge;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          content,
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Image(
          image: AssetImage(imge),
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }
}

class TabData2 extends StatelessWidget {
  late final String content;
  late final String imge;
  TabData2({required String content, required String imge}) {
    this.content = content;
    this.imge = imge;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          content,
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Image(
          image: AssetImage(imge),
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
