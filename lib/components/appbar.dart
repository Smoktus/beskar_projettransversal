import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends PreferredSize {
  Size get preferredSize => Size.fromHeight(kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppBarColor,
      toolbarHeight: kAppBarHeight,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: kIconSize,
          color: kIconColor,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset("assets/images/logo.png", color: kIconColor, scale: 10),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/profil.svg", color: kIconColor),
          onPressed: () {},
        )
      ],
    );
  }
}