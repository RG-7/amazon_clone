import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  height: height * 0.04,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: height * 0.035,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: black,
                    size: height * 0.035,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                const UserGreetingYouScreen(),
                CommonFunctions.blankSpace(height * 0.01, 0),
                const YourGidButtons(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                const UsersOrder(),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                const KeepShooping(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonFunctions.divider(),
                const BuyAgain(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonFunctions.divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buy Again',
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          SizedBox(
            height: height * 0.14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: height * 0.14,
                  width: height * 0.14,
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyShade3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
              itemCount: 5,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class KeepShooping extends StatelessWidget {
  const KeepShooping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keep Shoping for',
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Browsing History',
                  style: textTheme.bodySmall!.copyWith(
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          GridView.builder(
              physics: const PageScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: greyShade3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      'Product',
                      style: textTheme.bodyMedium,
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}

class UsersOrder extends StatelessWidget {
  const UsersOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Orders',
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: textTheme.bodySmall!.copyWith(
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: height * 0.17,
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                  ),
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyShade3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
              itemCount: 5,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class YourGidButtons extends StatelessWidget {
  const YourGidButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return GridView.builder(
        itemCount: 4,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3.5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(50),
              color: greyShade2,
            ),
            alignment: Alignment.center,
            child: Builder(builder: (context) {
              if (index == 0) {
                return Text(
                  'Your Orders',
                  style: textTheme.bodyMedium,
                );
              } else if (index == 1) {
                return Text(
                  'Buy Again',
                  style: textTheme.bodyMedium,
                );
              } else if (index == 0) {
                return Text(
                  'Your Account',
                  style: textTheme.bodyMedium,
                );
              } else {
                return Text(
                  'Your Wish List',
                  style: textTheme.bodyMedium,
                );
              }
            }),
          );
        });
  }
}

class UserGreetingYouScreen extends StatelessWidget {
  const UserGreetingYouScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Hello, ', style: textTheme.bodyLarge),
                TextSpan(
                  text: 'Ratn',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: greyShade3,
            radius: height * 0.025,
          ),
        ],
      ),
    );
  }
}
