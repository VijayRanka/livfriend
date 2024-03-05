import 'package:flutter/material.dart';
import 'package:livefriend/screens/girl_details/girl_details_screen.dart';

class TopRatedNormalGirlsList extends StatelessWidget {
  const TopRatedNormalGirlsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> girlsList = [
      ["vin1", "vina2"],
      ["vin3", "vina5"],
      ["vin3", "vina6"],
      ["vin3", "vina4"],
    ];
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: girlsList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 250,
              child: Row(
                  children: girlsList[index]
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          GirlListItem(
                            mainIndex: index,
                            insiderIndex: key,
                            girlName: value,
                          ),
                        ),
                      )
                      .values
                      .toList()));
        });
  }
}

class GirlListItem extends StatelessWidget {
  final int mainIndex, insiderIndex;
  final String girlName;

  const GirlListItem(
      {this.mainIndex = 0,
      this.insiderIndex = 0,
      this.girlName = "-",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Visibility(
      visible: girlName != "vina4",
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const GirlDetailsScreen()));
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              left: insiderIndex == 0 ? 10 : 0,
              right: 10,
              bottom: 10,
              top: mainIndex == 0 ? 10 : 0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/girl.webp",
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
      ),
    ));
  }
}
