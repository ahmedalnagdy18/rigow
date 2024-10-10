import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';
import 'package:rigow/features/timeline/widgets/bottom_navigation_bar.dart';
import 'package:rigow/injection_container.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyDataCubit(myDataUsecase: sl())..getUserDataInfo(),
      child: const _TimelinePage(),
    );
  }
}

class _TimelinePage extends StatefulWidget {
  const _TimelinePage();

  @override
  State<_TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<_TimelinePage> {
  int selectedindex = 0;
  UserDataEntity? entity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDataCubit, MyDataState>(
      builder: (context, state) {
        if (state is LoadingMyDataState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorMyDataState) {
          const Center(child: Text('erorrrrrrrr'));
        } else if (state is SucsessMyDataState) {
          entity = state.myData;
          return Scaffold(
              bottomNavigationBar: Stack(
                alignment: Alignment.topCenter,
                children: [
                  BottomNavigationBarWidget(
                    userImage: addBaseUrls(entity?.profilePicture ?? ''),
                    currentIndex: selectedindex,
                    onTap: (value) {
                      selectedindex = value;
                      setState(() {});
                    },
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppColors.mainRed),
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                          const Icon(Icons.filter_list),
                        ],
                      ),
                      const Divider(
                        color: Colors.red,
                        thickness: 2,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                addBaseUrls(entity?.profilePicture ?? ''),
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(width: 8),
                          Text(
                            "Welcome, ${entity?.firstName}",
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
                      )
                    ],
                  ),
                ),
              )
              //  Center(
              //   child: SizedBox(
              //     width: 111,
              //     height: 33,
              //     child: Image.asset(
              //       'assets/images/rigow.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              );
        }
        return const SizedBox();
      },
    );
  }
}

String addBaseUrls(String url) {
  return "https://beta-api.rigow.com/$url";
}
