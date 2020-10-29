import 'package:custom_appbar/core/values.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final ValueChanged<int> onTapChanged;
  final int currentIndex;
  final List<Person> items;

  const CustomNavBar({
    Key key,
    @required this.items,
    @required this.onTapChanged,
    this.currentIndex,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar>
    with SingleTickerProviderStateMixin {
  Person active;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: kBottomNavigationBarHeight + 10,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 100),
              alignment: Alignment(widget.items[widget.currentIndex].x, 0.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: height * 0.2,
                width: width * 0.28,
                decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(widget.items.length, (index) {
                final child = widget.items[index];
                return GestureDetector(
                  onTap: () {
                    widget.onTapChanged(index);
                  },
                  child: NavBarItem(
                    selected: index == widget.currentIndex,
                    title: child.title,
                    icon: child.icon,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  const NavBarItem({Key key, this.selected, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : appColor,
            size: 28,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              selected ? title : '',
              style: TextStyle(
                color: selected ? Colors.white : appColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
