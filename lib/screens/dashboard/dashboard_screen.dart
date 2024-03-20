import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livefriend/bloc/talktime_cubit/talktime_cubit.dart';
import 'package:livefriend/screens/dashboard/girls_widget.dart';
import 'package:livefriend/screens/message/message_screen.dart';
import 'package:livefriend/screens/profile/profile_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int tabIndex = 0;

  @override
  void initState() {
    initViews();
    super.initState();
  }

  void initViews(){
    Future.delayed(Duration.zero,(){
      BlocProvider.of<TalktimeCubit>(context).getUserTalkTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        initialIndex: tabIndex,
        child: Scaffold(
          body: Column(
            children: [
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GirlsDashboardWidget(),
                    MessageScreen(),
                    ProfileWidget(),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey[400],
              )
            ],
          ),
          bottomNavigationBar: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.green,
            indicatorColor: Colors.transparent,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.video_call,
                  size: tabIndex == 0 ? 35 : 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.message,
                  size: tabIndex == 1 ? 35 : 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.person,
                  size: tabIndex == 2 ? 35 : 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
