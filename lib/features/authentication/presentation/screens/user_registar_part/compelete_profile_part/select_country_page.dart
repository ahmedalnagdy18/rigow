import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/buttons.dart';
import 'package:rigow/core/common/cliked_textfield_widget.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/entities/city_entity.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_user_entity.dart';
import 'package:rigow/features/authentication/domain/entities/countries_entity.dart';
import 'package:rigow/features/authentication/domain/entities/states_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/model/states_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/countries/countries_state.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/main_user_complete_profile/main_complete_profile_state.dart';
import 'package:rigow/features/authentication/presentation/screens/welcome_to_rigow_page.dart';
import 'package:rigow/features/authentication/presentation/widgets/city_sheet.dart';
import 'package:rigow/features/authentication/presentation/widgets/country_sheet.dart';
import 'package:rigow/features/authentication/presentation/widgets/states_sheet.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage(
      {super.key,
      required this.username,
      required this.gender,
      required this.birthdate,
      required this.firstName,
      required this.role,
      required this.controller});
  final String username;
  final String gender;
  final DateTime birthdate;
  final String firstName;
  final String role;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(
          countriesUsecase: sl(), statesUsecase: sl(), cityUsecase: sl()),
      child: _SelectCountryPage(
        role: role,
        birthdate: birthdate,
        gender: gender,
        username: username,
        firstName: firstName,
        controller: controller,
      ),
    );
  }
}

class _SelectCountryPage extends StatefulWidget {
  final String role;
  final String firstName;
  final String username;
  final String gender;
  final DateTime birthdate;
  final PageController controller;
  const _SelectCountryPage(
      {required this.username,
      required this.gender,
      required this.birthdate,
      required this.firstName,
      required this.role,
      required this.controller});

  @override
  State<_SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<_SelectCountryPage> {
  static const _pageSize = 20;
  final PagingController<int, CountriesModel> _pagingController =
      PagingController(firstPageKey: 1);

  final PagingController<int, StatesModel> _pagingController2 =
      PagingController(firstPageKey: 1);
  final PagingController<int, CityModel> _pagingController3 =
      PagingController(firstPageKey: 1);
  CountriesModel? selectedCountry;
  StatesModel? selectedCity;
  CityModel? selectedArea;
  final searchController = TextEditingController();
  final citySearchController = TextEditingController();
  final stateSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener((pageKey) {
      _fetchCountries(pageKey);
    });

    _pagingController2.addPageRequestListener((pageKey) {
      if (selectedCountry != null) {
        _fetchStates(pageKey);
      }
    });

    _pagingController3.addPageRequestListener((pageKey) {
      if (selectedCity != null) {
        _fetchCities(pageKey);
      }
    });

    context.read<CountriesCubit>().countries(CountriesEntity(
        page: 1, limit: _pageSize, searchKey: searchController.text));

    if (selectedCountry != null) {
      context.read<CountriesCubit>().states(StatesEntity(
          searchKey: stateSearchController.text,
          countryId: selectedCountry!.id));
    }

    if (selectedCity != null) {
      context.read<CountriesCubit>().cities(CityEntity(
          searchKey: citySearchController.text, stateId: selectedCity!.id));
    }
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

  Future<void> _fetchStates(int pageKey) async {
    try {
      final cubit = context.read<CountriesCubit>();
      final data = await cubit.statesUsecase.call(StatesEntity(
          countryId: selectedCountry!.id,
          searchKey: stateSearchController.text));
      final isLastPage = data.length < _pageSize;
      if (isLastPage) {
        _pagingController2.appendLastPage(data);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController2.appendPage(data, nextPageKey);
      }
    } catch (error) {
      _pagingController2.error = error;
    }
  }

  Future<void> _fetchCities(int pageKey) async {
    try {
      final cubit = context.read<CountriesCubit>();
      final cityData = await cubit.cityUsecase.call(CityEntity(
          stateId: selectedCity!.id, searchKey: citySearchController.text));
      final isLastPage = cityData.length < _pageSize;
      if (isLastPage) {
        _pagingController3.appendLastPage(cityData);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController3.appendPage(cityData, nextPageKey);
      }
    } catch (error) {
      _pagingController3.error = error;
    }
  }

  @override
  void dispose() {
    stateSearchController.dispose();
    citySearchController.dispose();
    searchController.dispose();
    _pagingController.dispose();
    _pagingController2.dispose();
    _pagingController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountriesCubit, CountriesState>(
      listener: (context, state) {
        if (state is ErrorCountriesState) {
          _pagingController.error = state.message;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.completeYourProfile,
                  style: AppTexts.title,
                ),
                Text(
                  AppLocalizations.of(context)!.region,
                  style: AppTexts.miniRegular,
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return CountrySheet(
                          mycontroller: searchController,
                          onChanged: (value) {
                            _pagingController.refresh();
                          },
                          pagingController: _pagingController,
                          selectedValue: selectedCountry,
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                              selectedCity = null;
                              selectedArea = null;
                              _pagingController2.refresh();
                            });
                          },
                        );
                      },
                    );
                  },
                  child: ClikedTextFieldWidget(
                    color: selectedCountry == null ? null : AppColors.lightGrey,
                    hintText: AppLocalizations.of(context)!.country,
                    suffixText: selectedCountry?.name ??
                        AppLocalizations.of(context)!.tapToSet,
                    borderColor: selectedCountry == null
                        ? AppColors.tapBorder
                        : AppColors.lightGrey,
                  ),
                ),
                const SizedBox(height: 16),
                if (selectedCountry != null)
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return StatesSheet(
                            stateController: stateSearchController,
                            stateOnChanged: (value) {
                              _pagingController2.refresh();
                            },
                            pagingController: _pagingController2,
                            selectedValue: selectedCity,
                            onSelect: (value) {
                              setState(() {
                                selectedCity = value;
                                selectedArea = null;
                                _pagingController3.refresh();
                              });
                            },
                          );
                        },
                      );
                    },
                    child: ClikedTextFieldWidget(
                      color: selectedCity == null ? null : AppColors.lightGrey,
                      hintText: AppLocalizations.of(context)!.city,
                      suffixText: selectedCity?.name ??
                          AppLocalizations.of(context)!.tapToSet,
                      borderColor: selectedCity == null
                          ? AppColors.tapBorder
                          : AppColors.lightGrey,
                    ),
                  ),
                const SizedBox(height: 16),
                if (selectedCity != null)
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return CitySheet(
                            cityController: citySearchController,
                            cityOnChanged: (value) {
                              _pagingController3.refresh();
                            },
                            pagingController: _pagingController3,
                            selectedValue: selectedArea,
                            onSelect: (value) {
                              setState(() {
                                selectedArea = value;
                              });
                            },
                          );
                        },
                      );
                    },
                    child: ClikedTextFieldWidget(
                      hintText: "Area",
                      color: selectedArea?.name == null
                          ? null
                          : AppColors.lightGrey,
                      suffixText: selectedArea?.name ??
                          AppLocalizations.of(context)!.tapToSet,
                      borderColor: selectedArea == null
                          ? AppColors.tapBorder
                          : AppColors.lightGrey,
                    ),
                  ),
                if (selectedCity != null) const SizedBox(height: 24),
                BlocConsumer<MainCompleteProfileCubit,
                    MainCompleteProfileState>(
                  listener: (context, state) {
                    if (state is SucsessCompleteProfileUserState) {
                      widget.role == 'Expert'
                          ? (widget.controller).animateToPage(
                              2,
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease,
                            )
                          : Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => WelcomeToRigowPage(
                                    firstName: widget.firstName),
                              ),
                            );
                    }
                  },
                  builder: (context, state) {
                    return ColoredButtonWidget(
                      text: AppLocalizations.of(context)!.next,
                      onPressed: selectedArea == null
                          ? null
                          : () {
                              final input = CompleteProfileUserInput(
                                countryId: selectedCountry!.id,
                                stateId: selectedCity!.id,
                                cityId: selectedArea!.id,
                                gender: widget.gender,
                                birthDate:
                                    widget.birthdate.millisecondsSinceEpoch,
                                username: widget.username,
                              );
                              BlocProvider.of<MainCompleteProfileCubit>(context)
                                  .getAllUserData(input);
                            },
                      grideantColors: selectedArea == null
                          ? AppColors.greyLoader
                          : AppColors.mainRed,
                      textColor: Colors.white,
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
