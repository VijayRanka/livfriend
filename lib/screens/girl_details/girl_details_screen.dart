import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/girl_detail_cubit/girl_detail_cubit.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/model/girl_detail_model.dart';
import 'package:livefriend/screens/common_widgets/status_bar_container.dart';
import 'package:livefriend/screens/girl_details/follow_button.dart';
import 'package:livefriend/screens/girl_details/video_widget.dart';

class GirlDetailsScreen extends StatefulWidget {
  final String girlId;

  const GirlDetailsScreen({this.girlId = "-", Key? key}) : super(key: key);

  @override
  State<GirlDetailsScreen> createState() => _GirlDetailsScreenState();
}

class _GirlDetailsScreenState extends State<GirlDetailsScreen> {
  bool isFollowed = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      BlocProvider.of<GirlDetailCubit>(context)
          .getGirlDetails(girlId: widget.girlId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GirlDetailCubit, GirlDetailState>(
        builder: (context, state) {
          bool isUserFound = false;
          GirlDetailModel? girlDetailModel = GirlDetailModel(status: false);
          bool isPremium = false;
          bool isFake = false;
          Data? girlDetail;
          List<Gallery>? gallery;
          List<Interests>? interest;
          List<Language>? language;
          String status = Constants.offlineStatus;
          if (state is GirlDetailLoaded) {
            isUserFound = (state.girlDetailModel.status ?? false);
            girlDetailModel = state.girlDetailModel;
            isPremium = (girlDetailModel.data?.isPremium ?? "0") == "1";
            isFake = (girlDetailModel.data?.isFake ?? "0") == "1";
            girlDetail = state.girlDetailModel.data;
            gallery = state.girlDetailModel.gallery;
            interest = state.girlDetailModel.interests;
            language = state.girlDetailModel.language;
            status = girlDetail?.status ?? Constants.offlineStatus;
            isFollowed = !(girlDetail?.follower == null);
          }
          return state is GirlDetailLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (!isUserFound || !(girlDetailModel.status ?? false))
                  ? Column(
                      children: [
                        AppBar(
                          automaticallyImplyLeading: true,
                          backgroundColor: Colors.green,
                          title: const Text("Details"),
                          titleSpacing: 0,
                        ),
                        const Expanded(
                          child: Center(
                            child: Text("No User Found"),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const StatusBarContainer(),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            girlDetail?.mainImage ?? "-"),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    shape: BoxShape.circle),
                                                child: IconButton(
                                                    onPressed:
                                                        Navigator.of(context)
                                                            .pop,
                                                    icon: const Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.all_inclusive_sharp,
                                                    color: Colors.white,
                                                  )),
                                            ],
                                          ),
                                          !isPremium
                                              ? const SizedBox.shrink()
                                              : ((girlDetail?.videoPath ?? "")
                                                      .isNotEmpty)
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: VideoWidget(
                                                          videoPath: girlDetail
                                                                  ?.videoPath ??
                                                              ""),
                                                    )
                                                  : const SizedBox.shrink(),
                                          const Spacer(),
                                          !isPremium
                                              ? const SizedBox.shrink()
                                              : SizedBox(
                                                  height: 150,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    physics:
                                                        const AlwaysScrollableScrollPhysics(),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: (gallery ?? [])
                                                          .asMap()
                                                          .map((key, value) =>
                                                              MapEntry(
                                                                  key,
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        left: key ==
                                                                                0
                                                                            ? 10
                                                                            : 0,
                                                                        right:
                                                                            10),
                                                                    decoration: BoxDecoration(
                                                                      color:Colors.grey[300],
                                                                        border: Border.all(color: Colors.white, width: 1),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Colors.black.withOpacity(0.2),
                                                                              blurRadius: 2,
                                                                              offset: const Offset(0, 2),
                                                                              spreadRadius: 2)
                                                                        ],
                                                                        image: DecorationImage(image: NetworkImage(value.imagepath ?? ""), fit: BoxFit.cover),
                                                                        borderRadius: BorderRadius.circular(5)),
                                                                    height: 100,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            girlDetail?.name ?? "Rohini Gupta",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: status ==
                                                        Constants.offlineStatus
                                                    ? Colors.grey
                                                    : status ==
                                                            Constants
                                                                .onlineStatus
                                                        ? Colors.green
                                                        : Colors.black),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                                Text(
                                                  " $status",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Colors.red,
                                                  Colors.pink
                                                ])),
                                        child: Text(
                                          girlDetail?.age ?? "20",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        girlDetail?.tagline ??
                                            "Hello I'm new here.... Call me",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  color: Colors.grey[300],
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            girlDetail?.followers ?? "1530",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Followers",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FollowedOrNotWidget(
                                              isFollowed: isFollowed),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "Follow to get notified when they come online",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  color: Colors.grey[300],
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                ),
                                (interest ?? []).isEmpty
                                    ? const SizedBox.shrink()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "Interests:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
                                            child: Wrap(
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: (interest ?? [])
                                                  .asMap()
                                                  .map(
                                                    (key, value) => MapEntry(
                                                      key,
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration: BoxDecoration(
                                                            color: Constants
                                                                    .darkMode
                                                                ? Colors
                                                                    .blue[900]
                                                                : Colors
                                                                    .blue[100],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                            value.name ??
                                                                "Instagram"),
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
                                            margin: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                          ),
                                        ],
                                      ),
                                (language ?? []).isEmpty
                                    ? const SizedBox.shrink()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "Languages:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 10),
                                            child: Wrap(
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: (language ?? [])
                                                  .asMap()
                                                  .map(
                                                    (key, value) => MapEntry(
                                                      key,
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration: BoxDecoration(
                                                            color: Constants
                                                                    .darkMode
                                                                ? Colors
                                                                    .blue[900]
                                                                : Colors
                                                                    .blue[100],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                            value.name ??
                                                                "English"),
                                                      ),
                                                    ),
                                                  )
                                                  .values
                                                  .toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                  child: Text(
                                    "ID: ${girlDetail?.id ?? "123456"}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
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
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                offset: const Offset(-10, 0),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(2, 5),
                                                  blurRadius: 1,
                                                  color: Colors.black
                                                      .withOpacity(0.2))
                                            ],
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.green)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.message,
                                              color: Colors.green[700],
                                              size: 16,
                                            ),
                                            Text(
                                              " Message",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.green[700],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                            isScrollControlled: false,
                                            isDismissible: false,
                                            barrierColor:
                                                Colors.black.withOpacity(0.3),
                                            elevation: 10,
                                            builder: (_) {
                                              return BottomSheet(
                                                  // constraints: BoxConstraints(
                                                  //     maxHeight:
                                                  //         MediaQuery.of(context)
                                                  //                 .size
                                                  //                 .height *
                                                  //             0.4),
                                                  enableDrag: false,
                                                  onClosing: () {},
                                                  builder: (_) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.3),
                                                                spreadRadius: 5,
                                                                blurRadius: 5,
                                                                offset:
                                                                    const Offset(
                                                                        -5, -2))
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Wrap(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        IconButton(
                                                                          onPressed:
                                                                              Navigator.of(context).pop,
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.cancel,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    child: Text(
                                                                      Constants
                                                                          .pleaseDoNotTrust,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  const Divider(
                                                                    color: Colors
                                                                        .grey,
                                                                    height: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Container(
                                                                        margin: const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10,
                                                                            top:
                                                                                10,
                                                                            bottom:
                                                                                10),
                                                                        padding:
                                                                            const EdgeInsets.all(15),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                50),
                                                                            gradient:
                                                                                LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                              Colors.green[700]!,
                                                                              Colors.green[400]!
                                                                            ])),
                                                                        child:
                                                                            Text(
                                                                          "Audio @ ₹${girlDetail?.audioPrice ?? 0}/min",
                                                                          style: const TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w500),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Container(
                                                                        margin: const EdgeInsets.only(
                                                                            left:
                                                                                0,
                                                                            right:
                                                                                10,
                                                                            top:
                                                                                10,
                                                                            bottom:
                                                                                10),
                                                                        padding:
                                                                            const EdgeInsets.all(15),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                50),
                                                                            gradient:
                                                                                LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                              Colors.green[700]!,
                                                                              Colors.green[400]!
                                                                            ])),
                                                                        child:
                                                                            Text(
                                                                          "Video @ ₹${girlDetail?.videoPrice ?? 0}/min",
                                                                          style: const TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w500),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(15),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(2, 5),
                                                  blurRadius: 1,
                                                  color: Colors.black
                                                      .withOpacity(0.3))
                                            ],
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Colors.green[700]!,
                                                  Colors.green[500]!
                                                ])),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            Text(
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
                              ),
                            ],
                          ),
                        )
                      ],
                    );
        },
      ),
    );
  }
}
