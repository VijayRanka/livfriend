import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/dashboard_premium_girl_widget.dart';
import 'package:livefriend/screens/dashboard_girls_section/top_rated_normal_girls_list.dart';
import 'package:livefriend/screens/girls_list_screen/premium_girl_screen.dart';

class TopRatedPremiumGirlsSection extends StatelessWidget {
  const TopRatedPremiumGirlsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isDarkTheme ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: isDarkTheme
                            ? Colors.white.withOpacity(0.05)
                            : Colors.black.withOpacity(0.2))
                  ]),
              height: 250,
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Premium",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const PremiumGirlsScreen()));
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PremiumGirlWidget(index: index);
                        }),
                  ),
                ],
              ),
            ),
            const TopRatedNormalGirlsList(),
          ],
        ),
      ),
    );
  }
}
