import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/top_rated_cubit/top_rated_cubit.dart';
import 'package:livefriend/common/common_circular_screen.dart';
import 'package:livefriend/model/girl_model.dart';
import 'package:livefriend/screens/dashboard_girls_section/premium_girl_item_widget.dart';
import 'package:livefriend/screens/girls_list_screen/premium_girl_screen.dart';

class PremiumGirlsWidget extends StatelessWidget {
  const PremiumGirlsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        bool isLoading = state is TopRatedLoading;
        List<AllGirls>? premiumGirls = [];
        if (state is TopRatedLoaded) {
          premiumGirls = state.premiumGirls;
        }
        return (premiumGirls?.isEmpty ?? true)
            ? const SizedBox.shrink()
            : Container(
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
                              if (isLoading) {
                                return;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const PremiumGirlsScreen()));
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
                      child: isLoading
                          ? const CommonCircularLoadingScreen(
                              isLoading: true,
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: ListView.builder(
                                  itemCount: premiumGirls?.length ?? 0,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    AllGirls girl = premiumGirls![index];
                                    return PremiumGirlItemWidget(
                                      index: index,
                                      girlName: girl.name??"-",
                                      girlId: girl.id??"-",
                                      imagePath: girl.mainImage??"-",
                                    );
                                  }),
                            ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
