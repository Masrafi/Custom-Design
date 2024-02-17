import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../navbar_bloc/landing_page_bloc.dart';
import 'one.dart';
import 'three.dart';
import 'two.dart';
import 'widget.dart';

// List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
//   BottomNavigationBarItem(
//     icon: Icon(Icons.home_outlined),
//     label: 'Home',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.grid_3x3),
//     label: 'Category',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.search_outlined),
//     label: 'Search',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.favorite_outline),
//     label: 'Favourite',
//   ),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.shopping_bag_outlined),
//     label: 'Cart',
//   ),
// ];

// const List<Widget> bottomNavScreen = <Widget>[
//   Text('Index 0: Home'),
//   Text('Index 1: Category'),
//   Text('Index 2: Search'),
//   Text('Index 3: Favourite'),
//   NavMenuWidget(),
// ];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LandingPageBloc>(context).add(TabChange(tabIndex: 0));
  }

  List pages = [
    const One(),
    const Two(),
    const Three(),
    const NavMenuWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {
        if (state is LandingPageInitial) {
          setState(() {
            currentIndex = state.tabIndex;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: Container(
            //margin: EdgeInsets.o(20),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 35),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(
                    () {
                      state.tabIndex = index;
                      BlocProvider.of<LandingPageBloc>(context)
                          .add(TabChange(tabIndex: index));
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == state.tabIndex ? 0 : 0,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == state.tabIndex ? 5 : 0,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        // borderRadius: BorderRadius.vertical(
                        //   bottom: Radius.circular(10),
                        // ),
                      ),
                    ),
                    //const Spacer(),
                    const SizedBox(height: 10),
                    Icon(
                      listOfIcons[index],
                      size: 25,
                      color: index == state.tabIndex
                          ? Colors.blueAccent
                          : Colors.black38,
                    ),
                    Text(
                      listofText[index].toString(),
                      style: index == state.tabIndex
                          ? const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)
                          : const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                    ),
                    const Spacer(),
                    //const SizedBox(width: 100),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List listofText = [
    'Home',
    'Find Jobs',
    'Profile',
    'More',
  ];
}
