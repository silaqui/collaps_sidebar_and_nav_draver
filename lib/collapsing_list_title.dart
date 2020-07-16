import 'package:collaps_sidebar_and_nav_draver/theme.dart';
import 'package:flutter/material.dart';

class CollapsingListTitle extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  const CollapsingListTitle(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.animationController,
      @required this.isSelected,
      this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollapsingListTitleState();
}

class _CollapsingListTitleState extends State<CollapsingListTitle> {
  Animation<double> widthAnimation;
  Animation<double> sizeBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 70).animate(widget.animationController);
    sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isSelected ? selectedColor : Colors.white30,
              size: 38.0,
            ),
            SizedBox(
              width: sizeBoxAnimation.value,
            ),
            (widthAnimation.value >= 220)
                ? Text(widget.title,
                    style: widget.isSelected
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle)
                : Container()
          ],
        ),
      ),
    );
  }
}
