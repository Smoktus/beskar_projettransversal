import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/models/NavItem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui/models/NavItemCommercant.dart';

class MyBottomNavBarCommercant extends StatelessWidget {
  const MyBottomNavBarCommercant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItemsCommercant>(
      builder: (context, navItemsCommercant, child) => Container(
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
              navItemsCommercant.items.length,
              (index) => buildIconNavBarItem(
                isActive:
                    navItemsCommercant.selectedIndex == index ? true : false,
                icon: navItemsCommercant.items[index].icon,
                label: navItemsCommercant.items[index].label,
                press: () {
                  navItemsCommercant.changeNavIndex(index: index);
                  if (navItemsCommercant.items[index]
                      .destinationCheckerCommercant())
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              navItemsCommercant.items[index - 1].destination),
                    );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          navItemsCommercant.items[index].destination,
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
