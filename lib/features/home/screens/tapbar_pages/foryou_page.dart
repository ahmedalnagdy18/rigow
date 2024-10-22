import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/my_data/my_data_state.dart';
import 'dart:math' as math;

class ForyouPage extends StatefulWidget {
  const ForyouPage({super.key});

  @override
  State<ForyouPage> createState() => _ForyouPageState();
}

class _ForyouPageState extends State<ForyouPage> {
  @override
  void initState() {
    context.read<MyDataCubit>().getUserDataInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDataCubit, MyDataState>(
      builder: (context, state) {
        if (state is SucsessMyDataState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    // main post color
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(children: [
                            Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.tapBorder),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        "assets/images/rigow.png");
                                  },
                                  addBaseUrls(
                                      state.myData.profilePicture ?? ''),
                                  fit: BoxFit.contain,
                                )),
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
                            const Spacer(),
                            const Icon(Icons.more_vert)
                          ]),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "biooo test test\ntest ttttttttttttttttt",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 211,
                          width: double.infinity,
                          child: Image.network(
                            "https://i.pinimg.com/enabled_lo/564x/f4/de/78/f4de78da7a0b980ea00b3b349395a062.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.star_border_outlined),
                                  SizedBox(width: 8),
                                  Text('255k')
                                ],
                              ),
                              const Text("Comments"),
                              Row(
                                children: [
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: const Icon(Icons.reply),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('255k')
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
