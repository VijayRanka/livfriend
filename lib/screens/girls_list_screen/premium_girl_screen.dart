import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/dashboard_girls_section/top_rated_normal_girls_list.dart';

class PremiumGirlsScreen extends StatelessWidget {
  const PremiumGirlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonAppBar(
              onTap: Navigator.of(context).pop,
              text: "Premium",
            ),
            TopRatedNormalGirlsList(),
          ],
        ),
      ),
    );
  }
}
