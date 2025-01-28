import 'package:get/get.dart';

import '../../../global-models/drop-down-model/drop_down_model.dart';

class AddAccountController extends GetxController {
  final dropdownText = "Select Bank".obs;
  final isSelectedIndex = (-2).obs;
  List<DropdownModel> vehiclesList = [
    DropdownModel(id: 0, name: "GTBank", stringId: "000"),
    DropdownModel(
        id: 1, name: "Access Bank", stringId: "001"),
  ];
}
