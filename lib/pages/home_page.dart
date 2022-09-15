import 'package:flutter/material.dart';
import '../colors/colors.dart';
import '../widgets/app_text/app_large_text.dart';
import '../widgets/app_text/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    'balloning.png': 'Ballooning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: 'Բացահայտել'),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const CircleTabIndicator(
                color: AppColors.mainColor,
                radius: 4,
              ),
              tabs: const [
                Tab(
                  text: 'Վայրեր',
                ),
                Tab(
                  text: 'Փաթեթներ',
                ),
                Tab(
                  text: 'Գներ',
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 300,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image:  const DecorationImage(
                            image: AssetImage('img/mountain.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  const Text('Test'),
                  const Text('Test'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppLargeText(
                  text: 'Explore More',
                  size: 22,
                ),
                AppText(
                  text: 'See all',
                  color: AppColors.textColor1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              'img/${images.keys.elementAt(index)}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      AppText(
                        text: images.values.elementAt(index),
                        color: AppColors.textColor2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size;
    if(size == null){
      return;
    }
    final paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    final circleOffset = Offset(
      size.width / 2 - radius / 2,
      size.height,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
