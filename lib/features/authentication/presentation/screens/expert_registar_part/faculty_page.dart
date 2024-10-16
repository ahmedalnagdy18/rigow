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
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/faculty_input.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/faculty_cubit/faculty_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/faculty_cubit/faculty_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/add_onther_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/added_body_item.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class FacultyPage extends StatelessWidget {
  final void Function(FacultyModel?) onSelectedFaculty;
  final int selectedSpecialtyId;
  final FacultyModel? initialSelected;
  const FacultyPage({
    super.key,
    required this.selectedSpecialtyId,
    this.initialSelected,
    required this.onSelectedFaculty,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FacultyCubit(
        facultyUsecase: sl(),
      ),
      child: _FacultyPage(
        selectedSpecialtyId: selectedSpecialtyId,
        initialSelected: initialSelected,
        onSelectedFaculty: onSelectedFaculty,
      ),
    );
  }
}

class _FacultyPage extends StatefulWidget {
  final void Function(FacultyModel?) onSelectedFaculty;
  final int selectedSpecialtyId;
  final FacultyModel? initialSelected;
  const _FacultyPage({
    required this.selectedSpecialtyId,
    this.initialSelected,
    required this.onSelectedFaculty,
  });

  @override
  State<_FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<_FacultyPage> {
  final PagingController<int, FacultyModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  FacultyModel? selectedFaculty;
  String? _addFacultyName;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelected != null) {
      selectedFaculty = widget.initialSelected!;
      if (selectedFaculty?.id == null) {
        _addFacultyName = selectedFaculty?.name;
      }
      //_addFacultyName = selectedFaculty?.name;
    } else if (widget.initialSelected != null) {
      selectedFaculty = null;
      _addFacultyName = null;
    }

    _pagingController.addPageRequestListener((pageKey) {
      context.read<FacultyCubit>().getFaculties(FacultyInput(
            specialtyId: widget.selectedSpecialtyId,
            page: pageKey,
            limit: 15,
            searchKey: searchController.text,
          ));
      _fetchfaculties(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
    });
  }

  Future<void> _fetchfaculties(int pageKey) async {
    try {
      final cubit = context.read<FacultyCubit>();

      final data = await cubit.facultyUsecase.call(FacultyInput(
          page: pageKey,
          limit: _pageSize,
          searchKey: searchController.text,
          specialtyId: widget.selectedSpecialtyId));

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

  Widget _buildFacultySection(BuildContext context) {
    return _addFacultyName == null
        ? AddOntherSectionWidget(
            bottomSheetHintText:
                AppLocalizations.of(context)!.addFacultyNameHere,
            getTextEntyered: (text) {
              _addFacultyName = text;
              selectedFaculty = FacultyModel(
                id: null,
                name: _addFacultyName ?? "",
              );
              Navigator.pop(context);
              showToastMessage(
                  message: AppLocalizations.of(context)!.addedSuccessfully);
              setState(() {});
            },
            title: AppLocalizations.of(context)!.addFaculty,
            initialText: _addFacultyName,
          )
        : AddedBodyItem(
            editOnTap: () {
              AddToButtomSheetWidget.show(context,
                  bottomSheetHintText: AppLocalizations.of(context)!
                      .addFacultyNameHere, getTextEntyered: (text) {
                _addFacultyName = text;
                selectedFaculty =
                    FacultyModel(id: null, name: _addFacultyName ?? "");
                Navigator.pop(context);
                showToastMessage(
                    message: AppLocalizations.of(context)!.addedSuccessfully);
                setState(() {});
              }, initialText: _addFacultyName, isEdit: true);
            },
            deleteOnTap: () {
              setState(() {
                _addFacultyName = null;
                selectedFaculty = null;
              });
            },
            title: _addFacultyName ?? "Any",
          );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacultyCubit, FacultyState>(listener: (context, state) {
      if (state is ErrorFacultyState) {
        _pagingController.error = state.message;
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: MainAppbarWidget(
            backText: AppLocalizations.of(context)!.back,
            title: AppLocalizations.of(context)!.faculty,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourFaculty,
                  style: AppTexts.title,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  mycontroller: searchController,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  hintText: AppLocalizations.of(context)!.searchFaculty,
                  obscureText: false,
                  raduisSize: 8,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: PagedListView<int, FacultyModel>(
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
                        return _addFacultyName == null
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 16,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30,
                                        horizontal: 53,
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .noDepartmentsFound,
                                        textAlign: TextAlign.center,
                                        style: AppTexts.regular.copyWith(
                                          color: AppColors.hintText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  _buildFacultySection(context),
                                ],
                              )
                            : Column(
                                children: [
                                  Center(child: _buildFacultySection(context)),
                                ],
                              );
                      },
                      itemBuilder: (context, FacultyModel item, index) {
                        final isLastIndex = index ==
                            (_pagingController.itemList?.length ?? 0) - 1;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: item,
                              groupValue: (_addFacultyName == null)
                                  ? selectedFaculty
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  selectedFaculty = value;

                                  _addFacultyName = null;
                                });
                              },
                              title: item.name,
                            ),
                            Divider(color: AppColors.lightGrey),
                            if (isLastIndex) ...[
                              _buildFacultySection(context),
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
                    text: AppLocalizations.of(context)!.next,
                    onPressed: () {
                      if (selectedFaculty != null) {
                        widget.onSelectedFaculty(selectedFaculty);
                        Navigator.pop(context);
                      } else {
                        showErrorToastMessage(
                            message: "Please add faculty to proceed.");
                      }
                    },
                    grideantColors: selectedFaculty != null
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
