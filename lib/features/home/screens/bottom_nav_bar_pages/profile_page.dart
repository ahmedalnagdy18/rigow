import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDataCubit, MyDataState>(
      builder: (context, state) {
        if (state is SucsessMyDataState) {
          return Scaffold(
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
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: AppColors.mainRed,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
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
                      Row(children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.tapBorder),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            addBaseUrls(state.myData.profilePicture ?? ''),
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/images/rigow.png");
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.myData.firstName} ${state.myData.lastName}",
                              style: AppTexts.miniRegular,
                            ),
                            Text(
                              "@${state.myData.username}",
                              style: AppTexts.small
                                  .copyWith(color: AppColors.tapBorder),
                            ),
                          ],
                        ),
                      ]),
                      const SizedBox(height: 16),
                      Text(
                          "${state.myData.followersCount} followers | ${state.myData.followingsCount} following")
                    ]),
              ),
            ),
          );
        }
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
              child: Text(
            "Please sigin in first",
            style: AppTexts.medium,
          )),
        );
      },
    );
  }
}
