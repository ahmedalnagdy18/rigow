import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/custom_widgets/main_appbar.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/countries_entity.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_state.dart';
import 'package:rigow/injection_container.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(
          countriesUsecase: sl(), statesUsecase: sl(), cityUsecase: sl()),
      child: const _FacultyPage(),
    );
  }
}

class _FacultyPage extends StatefulWidget {
  const _FacultyPage();

  @override
  State<_FacultyPage> createState() => _SpecialtyPageState();
}

class _SpecialtyPageState extends State<_FacultyPage> {
  final PagingController<int, CountriesModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  CountriesModel? selectedCountry;

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchCountries(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
      context.read<CountriesCubit>().countries(CountriesEntity(
          page: 1, limit: _pageSize, searchKey: searchController.text));
    });

    _fetchCountries(1);
  }

  Future<void> _fetchCountries(int pageKey) async {
    try {
      final cubit = context.read<CountriesCubit>();

      final data = await cubit.countriesUsecase.call(CountriesEntity(
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
    return BlocConsumer<CountriesCubit, CountriesState>(
        listener: (context, state) {
      if (state is ErrorCountriesState) {
        _pagingController.error = state.message;
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: const MainAppbarWidget(
            backText: 'Back',
            title: "Faculty",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select your faculty',
                  style: AppTexts.title,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  mycontroller: searchController,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  hintText: 'Search Faculty',
                  obscureText: false,
                  raduisSize: 8,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: PagedListView<int, CountriesModel>(
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
                              groupValue: selectedCountry,
                              onChanged: (country) {
                                setState(() {
                                  selectedCountry = country;
                                });
                                Navigator.pop(context, selectedCountry);
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
