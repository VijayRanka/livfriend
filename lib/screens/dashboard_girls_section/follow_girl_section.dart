import 'package:flutter/material.dart';
import 'package:livefriend/screens/dashboard_girls_section/top_rated_normal_girls_list.dart';

class FollowGirlsSection extends StatelessWidget {
  const FollowGirlsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: TopRatedNormalGirlsList());
  }
}
