import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petshop/utils/colors/appColors.dart';

class BottomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.gray,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: 
                FaIcon(FontAwesomeIcons.home, size: 30, color: AppColors.brown), 
                onPressed: () {  }),
              IconButton(icon: 
                FaIcon(FontAwesomeIcons.paw, size: 30, color: AppColors.brown), 
                onPressed: () {  }),
              IconButton(icon: 
                FaIcon(FontAwesomeIcons.calendar, size: 30, color: AppColors.brown), 
                onPressed: () {  }),
              IconButton(icon: 
                FaIcon(FontAwesomeIcons.briefcase, size: 30, color: AppColors.brown), 
                onPressed: () {  }),
              IconButton(icon: 
                FaIcon(FontAwesomeIcons.cog, size: 30, color: AppColors.brown), 
                onPressed: () {  }),
            ],
          ),
        ),
      )
    ); 
  }
}