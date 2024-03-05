import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/status_bar_container.dart';
import 'package:livefriend/screens/dashboard/talktime_price_widget.dart';
import 'package:livefriend/screens/dashboard_girls_section/all_girls_dashboard.dart';
import 'package:livefriend/screens/dashboard_girls_section/follow_girl_section.dart';
import 'package:livefriend/screens/dashboard_girls_section/new_girls_section.dart';
import 'package:livefriend/screens/dashboard_girls_section/popular_girl_section.dart';
import 'package:livefriend/screens/dashboard_girls_section/top_rated_premium_girl_section.dart';

class GirlsDashboardWidget extends StatefulWidget {
  const GirlsDashboardWidget({Key? key}) : super(key: key);

  @override
  State<GirlsDashboardWidget> createState() => _GirlsDashboardWidgetState();
}

class _GirlsDashboardWidgetState extends State<GirlsDashboardWidget> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: tabIndex,
      child: Column(
        children: [
          const StatusBarContainer(),
          Container(
            color: Colors.green,
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    isScrollable: true,
                    overlayColor: MaterialStateProperty.all(Colors.green),
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: const EdgeInsets.only(bottom: 3),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Top Rated",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: tabIndex == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "New",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: tabIndex == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: tabIndex == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: tabIndex == 3
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: tabIndex == 4
                                  ? FontWeight.w600
                                  : FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                const TalktimePriceWidget(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                TopRatedPremiumGirlsSection(),
                NewGirlSection(),
                PopularGirlSection(),
                AllGirlSection(),
                FollowGirlsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
