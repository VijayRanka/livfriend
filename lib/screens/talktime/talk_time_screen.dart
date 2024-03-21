import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livefriend/bloc/talktime_cubit/talktime_cubit.dart';
import 'package:livefriend/bloc/talktime_list_cubit/talktime_list_cubit.dart';
import 'package:livefriend/common/constants.dart';
import 'package:livefriend/common/preference_utils.dart';
import 'package:livefriend/model/talktime_list_model.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/talk_time_total_text.dart';
import 'package:livefriend/screens/talktime/price_widget.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class TalktimeScreen extends StatefulWidget {
  const TalktimeScreen({Key? key}) : super(key: key);

  @override
  State<TalktimeScreen> createState() => _TalktimeScreenState();
}

class _TalktimeScreenState extends State<TalktimeScreen> {
  TalktimeDetails? selectedTalkTime;

  String environment = "PRODUCTION", appId = "", merchantId = "M22K5630WRRXG";

  // merchantId="M22K5630WRRXG"; PGTESTPAYUAT
  bool enableLogging = true;
  String checkSum = "";

  // String saltKey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";

  String saltKey = "10e836fd-4176-4fbc-a381-fc2ab74c0002";
  String saltIndex = "1";

  String callbackUrl =
      "https://webhook.site/bf0504bb-581b-40f2-a7f0-e1032bb065f8";
  String body = "";
  Object? result;
  String apiEndPoint = "/pg/v1/pay";

  @override
  void initState() {
    phonepeInit();
    initViews();
    super.initState();
  }

  void phonepeInit() {
    // PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging).then((value){
    //   result="phone pe initialized $value";
    // });
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
                print("result - $result");
              })
            })
        .catchError((error) {
      handleError(error);
      // handle the error
      return <dynamic>{};
    });
  }

  void handleError(error) {
    result = {"error": error};
  }

  getCheckSum({String userId = "-"}) {
    final Map<String, dynamic> requestData = {
      "merchantId": merchantId,
      "merchantTransactionId":
          "Trans${Random().nextInt(99999)}--$userId--${selectedTalkTime?.id ?? 0}--${selectedTalkTime?.given ?? 0}",
      "merchantUserId": "MUID${Random().nextInt(99)}",
      "amount": 100,
      "mobileNumber": PreferenceUtils.getString(Constants.userMobile,
              defValue: "9999999999") ??
          "9999999999",
      "callbackUrl": callbackUrl,
      "paymentInstrument": {"type": "PAY_PAGE"}
    };
    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checkSum =
        "${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey))}###$saltIndex";
    return base64Body;
  }

  void startPGTransaction(String user_id) async {
    var getCheck = getCheckSum(userId: user_id);
    PhonePePaymentSdk.startTransaction(
            getCheck, callbackUrl, checkSum, "com.phonepe.simulator")
        .then((response) => {
              setState(() {
                if (response != null) {
                  String status = response['status'].toString();
                  String error = response['error'].toString();
                  if (status == 'SUCCESS') {
                    BlocProvider.of<TalktimeCubit>(context).getUserTalkTime();
                  } else {
                    // "Flow Completed - Status: $status and Error: $error";
                    print("error: $error");
                    Fluttertoast.showToast(msg: "Recharge Failed");
                  }
                } else {
                  // "Flow Incomplete";
                }
              })
            })
        .catchError((error) {
      // handleError(error)
      return <dynamic>{};
    });
  }

  void initViews() {
    Future.delayed(Duration.zero, () {
      BlocProvider.of<TalktimeListCubit>(context).getTalkTimeList();
    });
  }

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
                  const TotalTalkTime(),
                  TalktimeList(
                    onTap: (TalktimeDetails value) {
                      setState(() {
                        selectedTalkTime = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Constants.darkMode ? Colors.black : Colors.white,
                boxShadow: [
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
                  onTap: () {
                    String user_id = PreferenceUtils.getString(Constants.userID,
                            defValue: "-") ??
                        "-";
                    if (user_id == "-") {
                      Fluttertoast.showToast(msg: "No User found");
                    } else {
                      startPGTransaction(user_id);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.3))
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: selectedTalkTime != null
                                ? [Colors.green[300]!, Colors.green[500]!]
                                : [Colors.grey[500]!, Colors.grey[700]!])),
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
        children: const [
          Text(
            "Talktime",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 17),
          ),
          SizedBox(
            height: 5,
          ),
          TalkTimeTotalText(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class TalktimeList extends StatefulWidget {
  final Function(TalktimeDetails talktime)? onTap;

  const TalktimeList({this.onTap, Key? key}) : super(key: key);

  @override
  State<TalktimeList> createState() => _TalktimeListState();
}

class _TalktimeListState extends State<TalktimeList> {
  int selectedPrice = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Add Talktime",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        BlocBuilder<TalktimeListCubit, TalktimeListState>(
          builder: (context, state) {
            List<TalktimeDetails>? talktimeList = const [];
            if (state is TalktimeListLoaded) {
              talktimeList = state.talktimeList;
            }
            return state is TalktimeListLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (talktimeList != null && talktimeList.isNotEmpty)
                    ? GridView.count(
                        padding: const EdgeInsets.all(0),
                        childAspectRatio: 0.75,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        children: List.generate((talktimeList.length), (index) {
                          return PriceItem(
                              mainIndex: index,
                              talktime: talktimeList![index],
                              onTap: () {
                                setState(() {
                                  selectedPrice = talktimeList![index].amount!;
                                });
                                if (widget.onTap != null) {
                                  widget.onTap!(talktimeList![index]);
                                }
                              },
                              selectedPrice: selectedPrice);
                        }))
                    : const Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(child: Text("No Talktime Found")),
                      );
          },
        )
      ],
    );
  }
}
