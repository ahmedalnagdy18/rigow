import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';
import 'package:rigow/features/home/screens/tapbar_pages/following_page.dart';
import 'package:rigow/features/home/screens/tapbar_pages/foryou_page.dart';
import 'package:rigow/features/home/screens/tapbar_pages/my_posts_page.dart';
import 'package:rigow/features/home/screens/tapbar_pages/recent_page.dart';
import 'package:rigow/features/home/widgets/logout_alert_dailog.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    context.read<MyDataCubit>().getUserDataInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDataCubit, MyDataState>(builder: (context, state) {
      if (state is LoadingMyDataState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      // else if (state is ErrorMyDataState) {
      //   const Center(child: Text('Error loading data'));
      // }
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 26,
                          width: 86,
                          child: Image.asset(
                            'assets/images/rigow.png',
                          )),
                      const Spacer(),
                      const Icon(Icons.search),
                      const SizedBox(width: 16),
                      const Icon(Icons.notifications_none_outlined),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          if (state is SucsessMyDataState) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return const LogoutAlertDailog();
                              },
                            );
                          }
                        },
                        child: const Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.red,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.tapBorder),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/images/rigow.png");
                            },
                            state is SucsessMyDataState
                                ? addBaseUrls(state.myData.profilePicture ?? '')
                                : "https://i.pinimg.com/control/564x/d9/7b/bb/d97bbb08017ac2309307f0822e63d082.jpg",
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(width: 8),
                      Text(
                        state is SucsessMyDataState
                            ? "Welcome, ${state.myData.firstName}"
                            : "Welcome to rigow \n as guest",
                        style: AppTexts.miniRegular,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: AppColors.mainRed,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                state is SucsessMyDataState
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 84,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  );
                                },
                                physics: const BouncingScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 12),
                                itemCount: 10,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TabBar(
                                indicatorPadding:
                                    const EdgeInsets.only(bottom: 4),
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 1,
                                dividerHeight: 1,
                                controller: tabController,
                                overlayColor:
                                    WidgetStateProperty.all(Colors.white),
                                unselectedLabelColor: Colors.grey,
                                labelColor: Colors.black,
                                indicatorColor: Colors.black,
                                tabs: const [
                                  Tab(text: 'For you'),
                                  Tab(text: 'Following'),
                                  Tab(text: 'Recent'),
                                  Tab(text: 'My Posts'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: const [
                                  ForyouPage(),
                                  FollowingPage(),
                                  RecentPage(),
                                  MyPostsPage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ));
    });
  }
}
