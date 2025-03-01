import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/models/NavItem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: kNavBarHeight,
        decoration: BoxDecoration(
          color: kNavBarColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 5,
              color: Color(0xFF4B1A39).withOpacity(0.2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.items.length,
              (index) => buildIconNavBarItem(
                isActive: navItems.selectedIndex == index ? true : false,
                icon: navItems.items[index].icon,
                label: navItems.items[index].label,
                press: () {
                  navItems.changeNavIndex(index: index);
                  if (navItems.items[index].destinationChecker())
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            navItems.items[index - 1].destination,
                      ),
                    );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => navItems.items[index].destination,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildIconNavBarItem(
      {String icon, String label, Function press, bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            icon,
            color: isActive ? kIconSelectedColor : kIconColor,
            //height: kNavBarHeight,
          ),
          //iconSize: kIconSize,
          onPressed: press,
        ),
        /*Text(
          label!=null?label:'Default Value',
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: kTextColorDark,
            height: 0,
          ),
        ),*/
      ],
    );
    /*return IconButton(
      icon: SvgPicture.asset(
        icon,
        color: isActive ? kIconSelectedColor : kIconColor,
        //height: kNavBarHeight,
      ),
      //iconSize: kIconSize,
      onPressed: press,
    );*/
  }
}
