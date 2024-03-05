import 'package:flutter/material.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';

class TalktimeScreen extends StatelessWidget {
  const TalktimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonAppBar(
            text: "TALKTIME",
            onTap: Navigator.of(context).pop,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TotalTalkTime(),
                  TalktimeList(),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(-10, 0),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5))
            ]),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Secure by ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Trusted Indian Banks",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.3))
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.green[300]!, Colors.green[500]!])),
                    child: const Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TotalTalkTime extends StatelessWidget {
  const TotalTalkTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Talktime",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 17),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$0',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class TalktimeList extends StatefulWidget {
  const TalktimeList({Key? key}) : super(key: key);

  @override
  State<TalktimeList> createState() => _TalktimeListState();
}

class _TalktimeListState extends State<TalktimeList> {
  int selectedPrice = 1;

  @override
  Widget build(BuildContext context) {
    List<List<int>> priceList = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Add Talktime",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: priceList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              double height = 160;
              return SizedBox(
                  height: height,
                  child: Row(
                      children: priceList[index]
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              PriceItem(
                                  mainIndex: index,
                                  insideIndex: key,
                                  price: value,
                                  height: height,
                                  onTap: () {
                                    setState(() {
                                      selectedPrice = priceList[index][key];
                                    });
                                  },
                                  selectedPrice: selectedPrice),
                            ),
                          )
                          .values
                          .toList()));
            })
      ],
    );
  }
}

class PriceItem extends StatelessWidget {
  final int mainIndex, insideIndex;
  final int price, selectedPrice;
  final double height;
  final Function()? onTap;

  const PriceItem(
      {this.mainIndex = 0,
      this.insideIndex = 0,
      this.selectedPrice = 0,
      this.onTap,
      this.height = 0,
      this.price = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
              left: insideIndex == 0 ? 10 : 0,
              right: 10,
              bottom: 10,
              top: mainIndex == 0 ? 10 : 0),
          height: height,
          decoration: BoxDecoration(
              border: Border.all(
                  color: selectedPrice == price
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
                      Positioned(
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
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                              "\$270",
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
                    color: selectedPrice == price
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
                              color: selectedPrice == price
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        Text(
                          "\$270",
                          style: TextStyle(
                              color: selectedPrice == price
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
      ),
    );
  }
}
