import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/custom_widgets/main_appbar.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/add_onther_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/added_body_item.dart';
import 'package:rigow/injection_container.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(
        countriesUsecase: sl(),
        statesUsecase: sl(),
        cityUsecase: sl(),
      ),
      child: const _DepartmentPage(),
    );
  }
}

class _DepartmentPage extends StatefulWidget {
  const _DepartmentPage();

  @override
  State<_DepartmentPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_DepartmentPage> {
  final PagingController<int, CountriesModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  CountriesModel? selectedCountry;
  String? _addDepartmentName;

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
            title: "Department",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select your Faculty department',
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
                      firstPageProgressIndicatorBuilder: (context) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      },
                      noItemsFoundIndicatorBuilder: (context) {
                        return _addDepartmentName == null
                            ? AddOntherSectionWidget(
                                getTextEntyered: (text) {
                                  _addDepartmentName = text;
                                  Navigator.pop(context);
                                  showToastMessage(
                                      message: "Added successfully");
                                  setState(() {});
                                },
                                title: 'Add Department',
                                initialText: _addDepartmentName,
                              )
                            : AddedBodyItem(
                                editOnTap: () {
                                  AddToButtomSheetWidget.show(context,
                                      getTextEntyered: (text) {
                                    _addDepartmentName = text;
                                    Navigator.pop(context);
                                    showToastMessage(
                                        message: "Added successfully");
                                    setState(() {});
                                  },
                                      initialText: _addDepartmentName,
                                      isEdit: true);
                                },
                                deleteOnTap: () {
                                  setState(() {
                                    _addDepartmentName = null;
                                  });
                                },
                                title: _addDepartmentName ?? "Any",
                              );
                      },
                      itemBuilder: (context, country, index) {
                        final isLastIndex = index ==
                            (_pagingController.itemList?.length ?? 0) - 1;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: country,
                              groupValue: (_addDepartmentName == null)
                                  ? selectedCountry
                                  : null,
                              onChanged: (country) {
                                setState(() {
                                  selectedCountry = country;
                                });
                              },
                              title: country.name,
                            ),
                            Divider(color: AppColors.lightGrey),
                            if (isLastIndex) ...[
                              _addDepartmentName == null
                                  ? AddOntherSectionWidget(
                                      getTextEntyered: (text) {
                                        _addDepartmentName = text;
                                        Navigator.pop(context);
                                        showToastMessage(
                                            message: "Added successfully");
                                        setState(() {});
                                      },
                                      title: 'Add Department',
                                      initialText: _addDepartmentName,
                                    )
                                  : AddedBodyItem(
                                      editOnTap: () {
                                        AddToButtomSheetWidget.show(context,
                                            getTextEntyered: (text) {
                                          _addDepartmentName = text;
                                          Navigator.pop(context);
                                          showToastMessage(
                                              message: "Added successfully");
                                          setState(() {});
                                        },
                                            initialText: _addDepartmentName,
                                            isEdit: true);
                                      },
                                      deleteOnTap: () {
                                        setState(() {
                                          _addDepartmentName = null;
                                        });
                                      },
                                      title: _addDepartmentName ?? "Any",
                                    ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ColoredButtonWidget(
                    text: 'Next',
                    onPressed: () {
                      if (_addDepartmentName != null) {
                        Navigator.pop(context, _addDepartmentName);
                      } else {
                        Navigator.pop(context, selectedCountry);
                      }
                    },
                    grideantColors: AppColors.mainRed,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ));
    });
  }
}