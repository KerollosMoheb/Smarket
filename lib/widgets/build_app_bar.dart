import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      title: Row(
        children: [
          Text(
            '61 Hopper Street...',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 5),
          Icon(Icons.arrow_drop_down, size: 24),
        ],
      ),
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/motor.svg', height: 24),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/basket.svg', height: 24),
        ),
      ],
    );
  }