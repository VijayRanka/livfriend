import 'package:flutter/material.dart';
import 'package:livefriend/screens/girl_details/girl_details_screen.dart';

class PremiumGirlItemWidget extends StatelessWidget {
  const PremiumGirlItemWidget(
      {this.index = 0,
      this.girlId = "-",
      this.imagePath = "-",
      this.girlName = "-",
      Key? key})
      : super(key: key);
  final String girlId;
  final String girlName;
  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = 120;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => GirlDetailsScreen(
                      girlId: girlId,
                    )));
      },
      child: Container(
        width: width,
        margin: EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10),
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
                width: width,
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
