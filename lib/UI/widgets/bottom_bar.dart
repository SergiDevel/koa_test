import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

const _bottomBarHeightMultiplier = 0.1;
const _iconSize = 20.0;

class _BottomNavigation {
  _BottomNavigation({
    required this.title,
    required this.icon,
    this.active = false,
  });
  final String title;
  final IconData icon;
  final bool active;
}

final _bottomNavigationList = <_BottomNavigation>[
  _BottomNavigation(
    title: 'PROGRAM',
    icon: SimpleLineIcons.note,
  ),
  _BottomNavigation(
    title: 'MESSAGES',
    icon: MaterialCommunityIcons.message_text_outline,
  ),
  _BottomNavigation(
    title: 'THOUGHTS',
    icon: Ionicons.md_cloud,
    active: true,
  ),
  _BottomNavigation(
    title: 'ME',
    icon: EvilIcons.user,
  ),
];

class KoaBottomBar extends StatelessWidget {
  const KoaBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * _bottomBarHeightMultiplier,
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
          for (_BottomNavigation navigation in _bottomNavigationList)
            BottomNavigationBarItem(
              icon: Icon(
                size: _iconSize,
                navigation.icon,
              ),
              label: navigation.title,
            ),
        ],
      ),
    );
  }
}
