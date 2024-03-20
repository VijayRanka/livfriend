import 'package:flutter/material.dart';
import 'package:livefriend/model/talktime_list_model.dart';

class PriceItem extends StatelessWidget {
  final int mainIndex;
  final int selectedPrice;
  final Function()? onTap;
  final TalktimeDetails talktime;

  const PriceItem(
      {required this.talktime,
      this.mainIndex = 0,
      this.selectedPrice = 0,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: 10, right: 10, bottom: 10, top: mainIndex > 2 ? 0 : 10),
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedPrice == talktime.amount
                    ? Colors.red[800]!
                    : Colors.grey[300]!,
                width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Stack(
                  children: [
                    ((talktime.isBest) == 0)
                        ? const SizedBox.shrink()
                        : Positioned(
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800]!,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: const Text(
                                "Best",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: Text("Get"),
                          ),
                          Text(
                            "₹${talktime.given}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: selectedPrice == talktime.amount
                      ? Colors.red[800]!
                      : Colors.yellow[700],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Pay",
                        style: TextStyle(
                            color: selectedPrice == talktime.amount
                                ? Colors.white
                                : Colors.black),
                      ),
                      Text(
                        "₹${talktime.amount}",
                        style: TextStyle(
                            color: selectedPrice == talktime.amount
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
