import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/custom_widgets/main_appbar.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_state.dart';
import 'package:rigow/injection_container.dart';

class SpecialtyPage extends StatelessWidget {
  const SpecialtyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialtyCubit(specialtyUsecase: sl()),
      child: const _SpecialtyPage(),
    );
  }
}

class _SpecialtyPage extends StatefulWidget {
  const _SpecialtyPage();

  @override
  State<_SpecialtyPage> createState() => _SpecialtyPageState();
}

class _SpecialtyPageState extends State<_SpecialtyPage> {
  final PagingController<int, SpecialtyModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  SpecialtyModel? selectedSpecialty;

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchCountries(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
      context.read<SpecialtyCubit>().specialties(SpecialtyEntity(
          page: 1, limit: _pageSize, searchKey: searchController.text));
    });

    _fetchCountries(1);
  }

  Future<void> _fetchCountries(int pageKey) async {
    try {
      final cubit = context.read<SpecialtyCubit>();

      final data = await cubit.specialtyUsecase.call(SpecialtyEntity(
          page: pageKey, limit: _pageSize, searchKey: searchController.text));

      final isLastPage = data.data.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(data.data);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(data.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpecialtyCubit, SpecialtyState>(
        listener: (context, state) {
      if (state is ErrorSpecialtyState) {
        _pagingController.error = state.message;
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: const MainAppbarWidget(
            backText: 'Back',
            title: "Specialty",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select your specialty',
                  style: AppTexts.title,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  mycontroller: searchController,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  hintText: 'Search specialty',
                  obscureText: false,
                  raduisSize: 8,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: PagedListView<int, SpecialtyModel>(
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate(
                      newPageProgressIndicatorBuilder: (context) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      },
                      noMoreItemsIndicatorBuilder: (context) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('No more countries!'),
                        ));
                      },
                      firstPageProgressIndicatorBuilder: (context) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      },
                      itemBuilder: (context, country, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: country,
                              groupValue: selectedSpecialty,
                              onChanged: (country) {
                                setState(() {
                                  selectedSpecialty = country;
                                });
                                Navigator.pop(context, selectedSpecialty);
                              },
                              title: country.name,
                            ),
                            Divider(color: AppColors.lightGrey),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
