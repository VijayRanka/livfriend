import 'package:flutter/material.dart';
import 'package:livefriend/screens/girl_details/girl_details_screen.dart';

class PremiumGirlWidget extends StatelessWidget {
  const PremiumGirlWidget({this.index = 0, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    double width = 120;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const GirlDetailsScreen()));
      },
      child: Container(
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10),
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
                    "Anupama",
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
