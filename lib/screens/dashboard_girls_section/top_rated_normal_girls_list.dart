import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/top_rated_cubit/top_rated_cubit.dart';
import 'package:livefriend/model/girl_model.dart';
import 'package:livefriend/screens/girl_details/girl_details_screen.dart';

class TopRatedNormalGirlsList extends StatelessWidget {
  const TopRatedNormalGirlsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        bool isLoading = state is TopRatedLoading;
        List<AllGirls>? normalGirls = [];
        if (state is TopRatedLoaded) {
          normalGirls = state.normalGirls;
        }
        return isLoading
            ? Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              )
            : (normalGirls?.isEmpty ?? true)
                ? Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Text(
                      "No Users Found",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                : GridView.count(
                    padding: const EdgeInsets.all(0),
                    childAspectRatio: 0.75,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(normalGirls?.length ?? 0, (index) {
                      AllGirls girl = normalGirls![index];
                      return GirlListItem(
                        girlName: girl.name??"-",
                        mainIndex: index,
                        girlId: girl.id??"-",
                        imagePath: girl.mainImage??"-",
                      );
                    }));
      },
    );
  }
}

class GirlListItem extends StatelessWidget {
  final int mainIndex;
  final String girlId;
  final String girlName;
  final String imagePath;

  const GirlListItem(
      {this.mainIndex = 0, this.girlId = "-",this.imagePath = "-", this.girlName = "-", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) =>  GirlDetailsScreen(girlId: girlId,)));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: (mainIndex == 0 || mainIndex % 2 == 0) ? 10 : 0,
            right: 10,
            bottom: 10,
            top: (mainIndex == 0 || mainIndex == 1) ? 10 : 0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                imagePath,
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/verify.png",
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 5,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.black.withOpacity(0.3),
                  child: Text(
                    girlName,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
