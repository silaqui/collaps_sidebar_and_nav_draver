import 'package:collaps_sidebar_and_nav_draver/model/navigation_model.dart';
import 'package:collaps_sidebar_and_nav_draver/theme.dart';
import 'package:flutter/material.dart';

import 'collapsing_list_title.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250.0;
  double minWidth = 70.0;
  bool isCollapsed = false;
  AnimationController _controller;
  Animation<double> widthAnimation;
  int currentSelected = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation =
        Tween<double>(begin: maxWidth, end: minWidth).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) =>
          getWidget(context, child),
    );
  }

  Widget getWidget(BuildContext context, Widget child) {
    return Material(
      elevation: 8.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            CollapsingListTitle(
              isSelected: false,
              title: "Sara",
              icon: Icons.person,
              animationController: _controller,
            ),
            Divider(color: Colors.grey, height: 30.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,counter){
                  return Divider(height: 12.0,);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTitle(
                    onTap:(){setState(() {
                      currentSelected = counter;
                    });},
                      isSelected: currentSelected == counter,
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _controller);
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed ? _controller.forward() : _controller.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _controller,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
