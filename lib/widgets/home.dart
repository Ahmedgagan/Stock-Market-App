import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/markets/markets.dart';
import 'package:sma/widgets/news/news.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  int _selectedIndex = 0;
  PageController _controller = PageController();

  final tabs = [
    PortfolioSection(),
    MarketsSection(),
    NewsSection(),
    Center(
      child: Text(
        'Search Screen coming soon.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: PageView.builder(
        controller: _controller,
        onPageChanged: _onItemTapped,
        itemBuilder: (context, index) => tabs[index],
        itemCount: tabs.length, // Can be null
      ),
      bottomNavigationBar: _bottomNavigationBar()
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          gap: 8,
          activeColor: Colors.white60,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          duration: Duration(milliseconds: 800),
          tabBackgroundColor: Colors.white30,
          selectedIndex: _selectedIndex,
          tabs: _bottomNavigationBarItemItems(),
          onTabChange: (index) {
            _onItemTapped(index);
            _controller.jumpToPage(index);
          }
        ),
      ),
    );
  }

  List<GButton> _bottomNavigationBarItemItems() {
    return [
      GButton(
        icon: FontAwesomeIcons.shapes,
        text: 'Home',
      ),
      GButton(
        icon: FontAwesomeIcons.suitcase,
        text: 'Markets',
      ),
      GButton(
        icon: FontAwesomeIcons.globeAmericas,
        text: 'News',
      ),
      GButton(
        icon: FontAwesomeIcons.search,
        text: 'Search',
      ),
    ];
  }
}