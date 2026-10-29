import 'package:flutter/material.dart';

import 'colors.dart';
import 'drink.dart';
import 'dart:math' as math;

class DrinkCard extends StatelessWidget {
  Drink drink;
  double pageOffset;
  double? animation;
  double animate = 0;
  double rotate = 0;
  double columnAnimation = 0;
  int index;
  DrinkCard(
    this.drink,
    this.pageOffset,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 60;
    double cardHeight = size.height * .55;
    double count = 0;
    double page;
    rotate = index - pageOffset;
    for (page = pageOffset; page > 1;) {
      page--;
      count++;
    }
    animation = Curves.easeOutBack.transform(page);
    animate = 100 * (count + animation!);
    columnAnimation = 50 * (count + animation!);
    for (int i = 0; i < index; i++) {
      animate -= 100;
      columnAnimation -= 50;
    }

    return Container(
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          buildTopText(),
          buildBackgroundImage(cardWidth, cardHeight, size),
          buildAboveCard(cardWidth, cardHeight, size),
          buildCupImage(size),
          buildBlurImage(cardWidth, size),
          buildSmallImage(size),
          buildTopImage(cardWidth, cardHeight, size),
        ],
      ),
    );
  }

  Widget buildTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            drink.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 46,
              color: drink.lightColor,
            ),
          ),
          Text(
            drink.conName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 46,
              color: drink.darkColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundImage(
    double cardWidth,
    double cardHeight,
    Size size,
  ) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            drink.backgroundImage!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildAboveCard(
    double cardWidth,
    double cardHeight,
    Size size,
  ) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: drink.darkColor?.withOpacity(.50),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(20),
        child: Transform.translate(
          offset: Offset(-columnAnimation, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frappuccino',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                drink.description!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 5),
                  Image.asset('assets/images/cup_L.png'),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/cup_M.png'),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/cup_s.png'),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: mAppGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '4.',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '70',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCupImage(Size size) {
    return Positioned(
      bottom: 20,
      right: -size.width * .2 / 2 + 30,
      child: Transform.rotate(
        angle: -math.pi / 14 * rotate,
        child: Image.asset(
          drink.cupImage!,
          height: size.height * .55 - 20,
        ),
      ),
    );
  }

  Widget buildBlurImage(double cardWidth, Size size) {
    return Positioned(
      right: cardWidth / 2 - 60 + animate,
      bottom: size.height * .10,
      child: Image.asset(drink.imageBlur!),
    );
  }

  Widget buildSmallImage(Size size) {
    return Positioned(
      right: -1 + animate,
      top: size.height * .3,
      child: Image.asset(drink.imageSmall!),
    );
  }

  Widget buildTopImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      left: cardWidth / 4 - animate,
      bottom: size.height * .15 + cardHeight - 25,
      child: Image.asset(drink.imageTop!),
    );
  }
}
