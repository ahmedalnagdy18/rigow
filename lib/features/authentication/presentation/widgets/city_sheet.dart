import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rigow/core/colors/app_colors.dart';
import 'package:rigow/core/common/check_box_widget.dart';
import 'package:rigow/core/common/textfield.dart';
import 'package:rigow/core/extentions/app_extentions.dart';
import 'package:rigow/core/fonts/app_text.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/l10n/app_localizations.dart';

class CitySheet extends StatelessWidget {
  final Function(CityModel) onSelect;
  final CityModel? selectedValue;
  final PagingController<int, CityModel> pagingController;
  final Function(String) cityOnChanged;
  final TextEditingController cityController;

  const CitySheet({
    super.key,
    required this.onSelect,
    this.selectedValue,
    required this.pagingController,
    required this.cityOnChanged,
    required this.cityController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      height: appHight(context, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.selectYourCountry,
                  style: AppTexts.regularSimiBold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFieldWidget(
              mycontroller: cityController,
              onChanged: cityOnChanged,
              prefixIcon: const Icon(Icons.search, size: 20),
              hintText: AppLocalizations.of(context)!.searchCountry,
              obscureText: false,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PagedListView<int, CityModel>(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  newPageProgressIndicatorBuilder: (context) {
                    return const Center(child: CupertinoActivityIndicator());
                  },
                  noMoreItemsIndicatorBuilder: (context) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('No more area !'),
                    ));
                  },
                  firstPageProgressIndicatorBuilder: (context) {
                    return const Center(child: CupertinoActivityIndicator());
                  },
                  itemBuilder: (context, cities, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckBoxWidget(
                          value: cities,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            onSelect(cities);
                            Navigator.pop(context);
                          },
                          title: cities.name,
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
      ),
    );
  }
}
