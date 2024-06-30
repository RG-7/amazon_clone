import 'dart:developer';

import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();
  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boAt';
      case 2:
        return 'Sony';
      case 3:
        return 'OnePlus';
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return 'Kurtas, saree & more';
      case 1:
        return 'Tops, dresses &  more';
      case 2:
        return 'T-Shirts, jeans & more';
      case 3:
        return 'View all';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: const HomePageAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomeScreenUserAddressBar(),
              CommonFunctions.divider(),
              const HomeScreenCategoriesList(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              const HomeScreenBanner(),
              TodaysDealhomeScreenWidget(
                  todaysDealsCarouselController: todaysDealsCarouselController),
              CommonFunctions.divider(),
              otherOfferGridWidget(
                title: 'Latest Launches in Headphones',
                textBtnName: 'Explore More',
                productPicNamesList: headphonesDeals,
                offerFor: 'headphones',
              ),
              CommonFunctions.divider(),
              SizedBox(
                height: height * 0.5,
                width: width,
                child: const Image(
                  image: AssetImage(
                    'assets/images/offersNsponcered/insurance.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              CommonFunctions.divider(),
              otherOfferGridWidget(
                title: 'Minimum 70% Off | Top Offers on Clothing',
                textBtnName: 'See all deals',
                productPicNamesList: clothingDealsList,
                offerFor: 'clothing',
              ),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Text(
                      'Watch Sixer only on miniTV',
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ),
                  Container(
                    // height: height * 0.4,
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.01,
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/offersNsponcered/sixer.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container otherOfferGridWidget({
    required String title,
    required String textBtnName,
    required List<String> productPicNamesList,
    required String offerFor,
  }) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: greyShade3),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/offersNsponcered/${productPicNamesList[index]}',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CommonFunctions.blankSpace(0, 10),
                          Text(
                            offerFor == 'headphones'
                                ? headphoneDeals(index)
                                : clothingDeals(index),
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                textBtnName,
                style: textTheme.bodySmall!.copyWith(color: blue),
              ),
            ),
          ],
        ));
  }
}

class TodaysDealhomeScreenWidget extends StatelessWidget {
  const TodaysDealhomeScreenWidget({
    super.key,
    required this.todaysDealsCarouselController,
  });

  final CarouselController todaysDealsCarouselController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '50% - 80% off | Latest deals.',
              style: textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ),
            CarouselSlider(
              carouselController: todaysDealsCarouselController,
              options: CarouselOptions(
                  height: height * 0.23, autoPlay: true, viewportFraction: 1),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: white,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/todays_deals/$i',
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: red),
                  child: Text(
                    'Upto 62% off',
                    style: textTheme.labelMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 00.03),
                Text(
                  'Deal of the Day',
                  style: textTheme.labelMedium!
                      .copyWith(color: red, fontWeight: FontWeight.bold),
                )
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log(index.toString());
                    todaysDealsCarouselController.animateToPage(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/todays_deals/${todaysDeals[index]}',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all Deals',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.23, autoPlay: true, viewportFraction: 1),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/carousel_slideshow/$i',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: height * 0.11,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.01,
              vertical: height * 0.01,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/categories/${categories[index]}.png',
                  height: height * 0.07,
                ),
                Text(
                  categories[index],
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenUserAddressBar extends StatelessWidget {
  const HomeScreenUserAddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.012,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.83,
            child: TextField(
              onTap: () {
                log('Redirecting you to search product screen');
              },
              cursorColor: black,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: black,
                  ),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.camera_alt_sharp,
                    color: black,
                  ),
                  onPressed: () {},
                ),
                fillColor: white,
                filled: true,
                hintText: 'Search Amazon.in',
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic),
          ),
        ],
      ),
    );
  }
}
