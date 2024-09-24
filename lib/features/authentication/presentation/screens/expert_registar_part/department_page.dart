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
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/department_input.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/departments_cubit/department_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/departments_cubit/department_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/add_onther_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/added_body_item.dart';
import 'package:rigow/injection_container.dart';
import 'package:rigow/l10n/app_localizations.dart';

class DepartmentPage extends StatelessWidget {
  final void Function(DepartmentModel? selectedDepartment) onSelectedDepartment;
  final DepartmentModel? initialSelected;
  final int facultyId;

  const DepartmentPage({
    super.key,
    required this.onSelectedDepartment,
    this.initialSelected,
    required this.facultyId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentCubit(
        departmentUsecase: sl(),
      ),
      child: _DepartmentPage(
        onSelectedDepartment: onSelectedDepartment,
        initialSelected: initialSelected,
        facultyId: facultyId,
      ),
    );
  }
}

class _DepartmentPage extends StatefulWidget {
  final void Function(DepartmentModel? selectedDepartment) onSelectedDepartment;
  final DepartmentModel? initialSelected;
  final int facultyId;

  const _DepartmentPage({
    required this.onSelectedDepartment,
    required this.initialSelected,
    required this.facultyId,
  });

  @override
  State<_DepartmentPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_DepartmentPage> {
  final PagingController<int, DepartmentModel> _pagingController =
      PagingController(firstPageKey: 1);
  static const _pageSize = 20;
  final searchController = TextEditingController();
  DepartmentModel? selectedDepartment;
  String? _addDepartmentName;

  @override
  void initState() {
    super.initState();
    if (widget.initialSelected != null) {
      selectedDepartment = widget.initialSelected!;
      if (selectedDepartment?.id == null) {
        _addDepartmentName = selectedDepartment?.name;
      }
    }
    _pagingController.addPageRequestListener((pageKey) {
      _fetchDepartments(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
    });
  }

  Future<void> _fetchDepartments(int pageKey) async {
    try {
      final cubit = context.read<DepartmentCubit>();

      final data = await cubit.departmentUsecase.call(DepartmentInput(
        page: pageKey,
        limit: _pageSize,
        searchKey: searchController.text,
        facultyId: widget.facultyId,
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

  Widget _buildDepartmentSection(BuildContext context) {
    return _addDepartmentName == null
        ? AddOntherSectionWidget(
            bottomSheetHintText: AppLocalizations.of(context)!.addDepartment,
            getTextEntyered: (text) {
              _addDepartmentName = text;
              selectedDepartment = DepartmentModel(
                id: null,
                name: _addDepartmentName ?? '',
              );
              Navigator.pop(context);
              showToastMessage(
                  message: AppLocalizations.of(context)!.addedSuccessfully);
              setState(() {});
            },
            title: AppLocalizations.of(context)!.addDepartment,
            initialText: _addDepartmentName,
          )
        : AddedBodyItem(
            editOnTap: () {
              AddToButtomSheetWidget.show(context,
                  bottomSheetHintText: AppLocalizations.of(context)!
                      .addDepartment, getTextEntyered: (text) {
                _addDepartmentName = text;
                selectedDepartment = DepartmentModel(
                  id: null,
                  name: _addDepartmentName ?? '',
                );
                Navigator.pop(context);
                showToastMessage(
                  message: AppLocalizations.of(context)!.addedSuccessfully,
                );
                setState(() {});
              }, initialText: _addDepartmentName, isEdit: true);
            },
            deleteOnTap: () {
              setState(() {
                _addDepartmentName = null;
                selectedDepartment = null;
              });
            },
            title: _addDepartmentName ?? "Any",
          );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepartmentCubit, DepartmentState>(
        listener: (context, state) {
      if (state is ErrorDepartmentState) {
        _pagingController.error = state.message;
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: MainAppbarWidget(
            backText: AppLocalizations.of(context)!.back,
            title: AppLocalizations.of(context)!.department,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourFacultyDepartment,
                  style: AppTexts.title,
                ),
                const SizedBox(height: 16),
                TextFieldWidget(
                  mycontroller: searchController,
                  prefixIcon: const Icon(Icons.search, size: 20),
                  hintText: AppLocalizations.of(context)!.searchDepartment,
                  obscureText: false,
                  raduisSize: 8,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: PagedListView<int, DepartmentModel>(
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
                                  _buildDepartmentSection(context),
                                ],
                              )
                            : Column(
                                children: [
                                  Center(
                                      child: _buildDepartmentSection(context)),
                                ],
                              );
                      },
                      itemBuilder: (context, department, index) {
                        final isLastIndex = index ==
                            (_pagingController.itemList?.length ?? 0) - 1;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: department,
                              groupValue: (_addDepartmentName == null)
                                  ? selectedDepartment
                                  : null,
                              onChanged: (country) {
                                setState(() {
                                  selectedDepartment = country;
                                });
                              },
                              title: department.name,
                            ),
                            Divider(color: AppColors.lightGrey),
                            if (isLastIndex) ...[
                              _buildDepartmentSection(context),
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
                      if (selectedDepartment != null) {
                        widget.onSelectedDepartment(selectedDepartment);
                      } else {
                        showErrorToastMessage(
                            message: "Please add department to proceed.");
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
