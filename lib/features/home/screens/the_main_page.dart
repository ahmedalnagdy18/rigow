import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';
import 'package:rigow/features/home/screens/bottom_nav_bar_pages/offers_page.dart';
import 'package:rigow/features/my_profile/presentation/screens/profile_page.dart';
import 'package:rigow/features/home/screens/bottom_nav_bar_pages/reels_page.dart';
import 'package:rigow/features/home/screens/bottom_nav_bar_pages/rooms_page.dart';
import 'package:rigow/features/home/screens/timeline_page.dart';
import 'package:rigow/features/home/widgets/bottom_navigation_bar.dart';

class TheMainHomePage extends StatefulWidget {
  const TheMainHomePage({super.key});

  @override
  State<TheMainHomePage> createState() => _TheMainHomePageState();
}

class _TheMainHomePageState extends State<TheMainHomePage> {
  List name = [];
  int selectedindex = 2;
  @override
  void initState() {
    name.addAll([
      const ProfilePage(),
      const RoomsPage(),
      const TimelinePage(),
      const ReelsPage(),
      const OffersPage(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDataCubit, MyDataState>(
      builder: (context, state) {
        return Scaffold(
          body: name.elementAt(selectedindex),
          bottomNavigationBar: Stack(
            alignment: Alignment.topCenter,
            children: [
              Theme(
                // to remove color of layout  # this comment by me #
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBarWidget(
                  userImage: state is SucsessMyDataState
                      ? addBaseUrls(state.myData.profilePicture ?? '')
                      : "https://i.pinimg.com/control/564x/d9/7b/bb/d97bbb08017ac2309307f0822e63d082.jpg",
                  currentIndex: selectedindex,
                  onTap: _onItemTapped,
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.mainRed,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
