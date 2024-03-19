import 'package:flutter/material.dart';
import 'package:livefriend/screens/dashboard_girls_section/premium_girls_widget.dart';
import 'package:livefriend/screens/dashboard_girls_section/top_rated_normal_girls_list.dart';

class TopRatedPremiumGirlsSection extends StatelessWidget {
  const TopRatedPremiumGirlsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          PremiumGirlsWidget(),
          TopRatedNormalGirlsList(),
        ],
      ),
    );
  }
}
