import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/talktime_list_cubit/talktime_list_cubit.dart';
import 'package:livefriend/model/talktime_list_model.dart';
import 'package:livefriend/screens/common_widgets/common_app_bar.dart';
import 'package:livefriend/screens/common_widgets/talk_time_total_text.dart';
import 'package:livefriend/screens/talktime/price_widget.dart';

class TalktimeScreen extends StatefulWidget {
  const TalktimeScreen({Key? key}) : super(key: key);

  @override
  State<TalktimeScreen> createState() => _TalktimeScreenState();
}

class _TalktimeScreenState extends State<TalktimeScreen> {
  TalktimeDetails? selectedTalkTime;

  @override
  void initState() {
    initViews();
    super.initState();
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
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
