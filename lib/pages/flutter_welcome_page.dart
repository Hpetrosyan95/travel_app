import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../widgets/app_text/app_large_text.dart';
import '../widgets/app_text/app_text.dart';

class MyWelcomePage extends StatefulWidget {
  const MyWelcomePage({Key? key}) : super(key: key);

  @override
  State<MyWelcomePage> createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {
  List<String> images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  List description = [
    'Լեռնային արշավները ձեզ տալիս են անհավատալի ազատության զգացում, դիմացկունության թեստերի հետ մեկտեղ...',
    'Լավ են սարերը։ Երբ դու այստեղ ես, բոլոր վատ բաները մնում են ներքևում, և դա այնքան հեշտ է դառնում հոգու համար...',
    'Լեռներում լուսաբացը լավագույն իրադարձությունն է, որը կարող է պատահել մարդու հետ...'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'img/${images[index]}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        text: 'Մեր',
                      ),
                      const AppText(
                        text: 'Սարերը',
                        size: 30,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text: description[index],
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.mainColor,
                          ),
                        ),
                        child: Image.asset('img/button-one.png'),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
