// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/responsive_widget.dart';
import '../../search/view/mobile/search_mobile_view.dart';
import 'mobile/product_search_mobile_view.dart';

class ProductSearchPage extends StatelessWidget {
  ProductSearchPage({Key? key}) : super(key: key);
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
          smallScreen: ProductSearchMobileView(),
        ),
      ),
    );
  }
}


