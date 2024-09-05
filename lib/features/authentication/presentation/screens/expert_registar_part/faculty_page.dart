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
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/presentation/cubits/faculty_cubit/faculty_cubit.dart';
import 'package:rigow/features/authentication/presentation/cubits/faculty_cubit/faculty_state.dart';
import 'package:rigow/features/authentication/presentation/widgets/addto_buttom_sheet_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/add_onther_widget.dart';
import 'package:rigow/features/authentication/presentation/widgets/expert_part/added_body_item.dart';
import 'package:rigow/injection_container.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FacultyCubit(
        facultyUsecase: sl(),
      ),
      child: const _FacultyPage(),
    );
  }
}

class _FacultyPage extends StatefulWidget {
  const _FacultyPage();

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

    _pagingController.addPageRequestListener((pageKey) {
      _fetchfaculties(pageKey);
    });

    searchController.addListener(() {
      _pagingController.refresh();
      context.read<FacultyCubit>().getFaculties(FacultyEntity(
          page: 1, limit: _pageSize, searchKey: searchController.text));
    });

    _fetchfaculties(1);
  }

  Future<void> _fetchfaculties(int pageKey) async {
    try {
      final cubit = context.read<FacultyCubit>();

      final data = await cubit.facultyUsecase.call(FacultyEntity(
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
    return BlocConsumer<FacultyCubit, FacultyState>(listener: (context, state) {
      if (state is ErrorFacultyState) {
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
                      itemBuilder: (context, country, index) {
                        final isLastIndex = index ==
                            (_pagingController.itemList?.length ?? 0) - 1;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckBoxWidget(
                              value: country,
                              groupValue: (_addFacultyName == null)
                                  ? selectedFaculty
                                  : null,
                              onChanged: (country) {
                                setState(() {
                                  selectedFaculty = country;
                                });
                              },
                              title: country.name,
                            ),
                            Divider(color: AppColors.lightGrey),
                            if (isLastIndex) ...[
                              _addFacultyName == null
                                  ? AddOntherSectionWidget(
                                      getTextEntyered: (text) {
                                        _addFacultyName = text;
                                        Navigator.pop(context);
                                        showToastMessage(
                                            message: "Added successfully");
                                        setState(() {});
                                      },
                                      title: 'Add Faculty',
                                      initialText: _addFacultyName,
                                    )
                                  : AddedBodyItem(
                                      editOnTap: () {
                                        AddToButtomSheetWidget.show(context,
                                            getTextEntyered: (text) {
                                          _addFacultyName = text;
                                          Navigator.pop(context);
                                          showToastMessage(
                                              message: "Added successfully");
                                          setState(() {});
                                        },
                                            initialText: _addFacultyName,
                                            isEdit: true);
                                      },
                                      deleteOnTap: () {
                                        setState(() {
                                          _addFacultyName = null;
                                        });
                                      },
                                      title: _addFacultyName ?? "Any",
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
                      if (_addFacultyName != null) {
                        Navigator.pop(context, _addFacultyName);
                      } else {
                        Navigator.pop(context, selectedFaculty);
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
