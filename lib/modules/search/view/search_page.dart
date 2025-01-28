// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/responsive_widget.dart';
import 'mobile/search_mobile_view.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: _size.height,
        child: ResponsiveWidget(
          smallScreen: SearchMobileView(),
        ),
      ),
    );
  }
}
