import 'package:flutter/material.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/screens/common_widgets/status_bar_container.dart';

class GirlDetailsScreen extends StatelessWidget {
  const GirlDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusBarContainer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/girl.webp"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: Navigator.of(context).pop,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.all_inclusive_sharp,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/girl.webp"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 140,
                              width: 90,
                            ),
                            Spacer(),
                            SizedBox(
                              height: 120,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Row(
                                  children: [
                                    "image1",
                                    "image2",
                                    "image3",
                                    "image3",
                                    "image4",
                                    "image5",
                                    "image6",
                                    "image7",
                                    "image8",
                                    "image9",
                                    "image0",
                                    "image11",
                                  ]
                                      .asMap()
                                      .map((key, value) => MapEntry(
                                          key,
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: key == 0 ? 10 : 0,
                                                right: 10),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/girl.webp"),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            height: 70,
                                            width: 70,
                                          )))
                                      .values
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nikita",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                  Text(
                                    " Offline",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.red, Colors.pink])),
                          child: Text(
                            "21",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          "Hello I'm new here.... Call me",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.grey[300],
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "37679",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Followers",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 20, right: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.red[400]!,
                                        Colors.pink[400]!
                                      ])),
                              child: Text(
                                "✓ Following",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Follow to get notified when they come online",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.grey[300],
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Interests:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        "hfdjkh",
                        "dfdkfdjfd",
                        "fddf",
                        "dfdfdfd",
                        "d",
                        "fdfdfggdf"
                      ]
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Constants.darkMode
                                        ? Colors.blue[900]
                                        : Colors.blue[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(value),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.grey[300],
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Languages:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        "hfdjkh",
                        "dfdkfdjfd",
                        "fddf",
                        "dfdfdfd",
                        "d",
                        "fdfdfggdf"
                      ]
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Constants.darkMode
                                        ? Colors.blue[900]
                                        : Colors.blue[100],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(value),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "ID: 655433",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                  children: [
                    Expanded(
                      child: GestureDetector(
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
                                    offset: Offset(2, 5),
                                    blurRadius: 1,
                                    color: Colors.black.withOpacity(0.2))
                              ],
                              color: Colors.white,
                              border: Border.all(color: Colors.green)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.green,
                                size: 16,
                              ),
                              const Text(
                                " Message",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
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
                                    offset: Offset(2, 5),
                                    blurRadius: 1,
                                    color: Colors.black.withOpacity(0.3))
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green[300]!,
                                    Colors.green[500]!
                                  ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 16,
                              ),
                              const Text(
                                " Call",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
