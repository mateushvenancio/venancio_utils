import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<HomeScreenTab> tabs;

  const HomeScreen({Key? key, required this.tabs}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();
  int _index = 0;

  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    setState(() {
      _index = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tabs[_index].title)),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.tabs.map((e) {
          return e.page;
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: goToPage,
        items: widget.tabs.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
          );
        }).toList(),
      ),
    );
  }
}

class HomeScreenTab {
  final String title;
  final String label;
  final IconData icon;
  final Widget page;

  HomeScreenTab({
    required this.title,
    required this.label,
    required this.icon,
    required this.page,
  });
}
