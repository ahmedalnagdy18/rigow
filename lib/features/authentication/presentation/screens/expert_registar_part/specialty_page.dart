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
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/specialty_input.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_state.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class SpecialtyPage extends StatelessWidget {
  final void Function(SpecialtyModel?) onSelectedSpecialty;
  final SpecialtyModel? initialSelected;

  const SpecialtyPage({
    super.key,
    required this.onSelectedSpecialty,
    this.initialSelected,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialtyCubit(specialtyUsecase: sl()),
      child: _SpecialtyPage(
        onSelectedSpecialty: onSelectedSpecialty,
        initialSelected: initialSelected,
      ),
    );
  }
}

class _SpecialtyPage extends StatefulWidget {
  final void Function(SpecialtyModel?) onSelectedSpecialty;
  final SpecialtyModel? initialSelected;
  const _SpecialtyPage({
    required this.onSelectedSpecialty,
    this.initialSelected,
  });

  @override
  State<_SpecialtyPage> createState() => _SpecialtyPageState();
}

class _SpecialtyPageState extends State<_SpecialtyPage> {
  final PagingController<int, SpecialtyModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  late SpecialtyModel selectedSpecialty;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelected != null) {
      selectedSpecialty = widget.initialSelected!;
    }

    _pagingController.addPageRequestListener((pageKey) {
      _fetchCountries(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
    });
  }

  Future<void> _fetchCountries(int pageKey) async {
    try {
      final cubit = context.read<SpecialtyCubit>();

      final data = await cubit.specialtyUsecase.call(SpecialtyInput(
        page: pageKey,
        limit: _pageSize,
        searchKey: searchController.text,
      ));

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
          appBar: MainAppbarWidget(
            backText: AppLocalizations.of(context)!.back,
            title: AppLocalizations.of(context)!.specialty,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourSpecialty,
                  style: AppTexts.title,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  mycontroller: searchController,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  hintText: AppLocalizations.of(context)!.searchSpecialty,
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
                        return const SizedBox();
                      },
                      firstPageProgressIndicatorBuilder: (context) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      },
                      itemBuilder: (context, SpecialtyModel item, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: item,
                              groupValue: selectedSpecialty,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedSpecialty = value;
                                  });
                                }
                              },
                              title: item.name,
                            ),
                            Divider(color: AppColors.lightGrey),
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
                    text: AppLocalizations.of(context)!.next,
                    onPressed: () {
                      if (selectedSpecialty.name.isNotEmpty) {
                        widget.onSelectedSpecialty(selectedSpecialty);
                        Navigator.pop(context);
                      } else {
                        showErrorToastMessage(
                            message: "Please add Specialty to proceed.");
                      }
                    },
                    grideantColors: selectedSpecialty.name.isNotEmpty
                        ? AppColors.mainRed
                        : [AppColors.darkGrey, AppColors.darkGrey],
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
