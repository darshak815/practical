import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/logic_model.dart';
import '../utils/app_strings.dart';

class LogicController extends GetxController {
  Strings commonString = Strings();
  TextEditingController controllerTotalDisplay = TextEditingController();
  TextEditingController controllerTotalSelection = TextEditingController();
  TextEditingController controllerMaxAlphabet = TextEditingController();
  TextEditingController controllerMaxNumber = TextEditingController();
  RxList<LogicModel> listModelNumber = <LogicModel>[].obs;
  RxList<LogicModel> listModelAlphabet = <LogicModel>[].obs;
  List<String> listNumber = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];
  List<String> listAlphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"];

  RxString resultUpdate = "".obs;
  RxBool isSuccess = false.obs;
  RxInt selectedCount = 0.obs;
  RxInt alphabets = 0.obs;
  RxInt numbers = 0.obs;

  RxInt numberDisplay = 0.obs;
  RxInt numberTotalSelect = 0.obs;
  RxInt numberMaxAlphabet = 0.obs;
  RxInt numberMaxNumber = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listModelNumber = <LogicModel>[].obs;
    listModelAlphabet = <LogicModel>[].obs;
    controllerTotalDisplay = TextEditingController();
    controllerTotalSelection = TextEditingController();
    controllerMaxAlphabet = TextEditingController();
    controllerMaxNumber = TextEditingController();
    numberDisplay = 0.obs;
    numberTotalSelect = 0.obs;
    numberMaxAlphabet = 0.obs;
    numberMaxNumber = 0.obs;
    selectedCount = 0.obs;
    alphabets = 0.obs;
    numbers = 0.obs;
    isSuccess = false.obs;
    resultUpdate = "".obs;

    for (int i = 0; i < listNumber.length; i++) {
      LogicModel model = LogicModel(title: listNumber[i], isSelected: false.obs);
      listModelNumber.add(model);
    }

    for (int i = 0; i < listAlphabet.length; i++) {
      LogicModel model = LogicModel(title: listAlphabet[i], isSelected: false.obs);
      listModelAlphabet.add(model);
    }
  }

  void checkValidation(String val, {int limit = 11}) {
    if (val.isNotEmpty) {
      int number = int.parse(val);
      resultUpdate.value = "";
      if (number <= limit) {
      } else {
        if (kDebugMode) {
          resultUpdate.value =commonString.error+ commonString.errorOnlySameOrLess;
          isSuccess.value = false;
          print(commonString.errorOnlySameOrLess);
        }
      }
    }
    update();
  }

  void alphabetSelection(bool val, int index, RxList<LogicModel> listSelected, int maxAlphabet,
      {bool isNumber = false}) {
    selectedCount.value = 0;
    alphabets.value = 0;
    numbers.value = 0;
    resultUpdate.value = "";

    for (int i = 0; i < (numberDisplay.value <= 11 ? numberDisplay.value : 0); i++) {
      if (listModelAlphabet[i].isSelected!.value) {
        selectedCount.value = selectedCount.value + 1;
        alphabets.value = alphabets.value + 1;
      }
      if (listModelNumber[i].isSelected!.value) {
        selectedCount.value = selectedCount.value + 1;
        numbers.value = numbers.value + 1;
      }
    }

    print("selectedCount==>${selectedCount.value}");
    print("-----");
    print("maxIndividual==>$maxAlphabet");
    print("==========");
    // print("isNumber==>$isNumber");

    if ((selectedCount.value == numberTotalSelect.value) && !listSelected[index].isSelected!.value) {
      resultUpdate.value =commonString.error+( isNumber
          ? commonString.errorEnterValueNumbers(numberTotalSelect.value)
          : commonString.errorEnterValueAlphabets(numberTotalSelect.value));
      isSuccess.value = false;
    } else if (selectedCount.value <= numberTotalSelect.value) {
      if ((!isNumber ? numberMaxAlphabet.value : numberMaxNumber.value) ==
          (!isNumber ? alphabets.value : numbers.value)) {
        resultUpdate.value = commonString.error+commonString.errorMaxLimit(!isNumber ? numberMaxAlphabet.value : numberMaxNumber.value);
        isSuccess.value = false;
        update();
        return;
      }
      listSelected[index].isSelected!.value = val;

      if (selectedCount.value > 0 && !val) {
        selectedCount.value = selectedCount.value - 1;
        if (isNumber) {
          numbers.value = numbers.value - 1;
        } else {
          alphabets.value = alphabets.value - 1;
        }
      } else if (val && ((isNumber ? numberMaxNumber.value:numberMaxAlphabet.value) <= selectedCount.value)) {
        selectedCount.value = selectedCount.value + 1;
        if (isNumber) {
          numbers.value = numbers.value + 1;
        } else {
          alphabets.value = alphabets.value + 1;
        }
      }
      print("selectedCount=UPDATE=>${selectedCount.value}");
      if (selectedCount.value == numberTotalSelect.value) {
        resultUpdate.value = commonString.success;
        isSuccess.value = true;
      } else {
        isSuccess.value = false;
      }
    } else {
      if (listSelected[index].isSelected!.value) {
        listSelected[index].isSelected!.value = false;
        if (selectedCount.value > 0) {
          selectedCount.value = selectedCount.value - 1;
        }
      } else {
        print("fgfg0f0gf0gf0gf0==ERROR MESSAGE SAVED======");
        isSuccess.value = false;
        resultUpdate.value =
            "${isNumber ? commonString.errorNumbersLimit : commonString.errorAlphabetLimit} $maxAlphabet";
      }
    }

    update();
  }
}
