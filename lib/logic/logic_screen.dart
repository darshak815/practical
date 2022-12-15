import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/app_strings.dart';
import '../utils/custom_widget.dart';
import 'logic_controller.dart';

class LogicScreen extends GetView<LogicController> {
  const LogicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogicController>(
      builder: (context) => Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 30.sp),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            controller.commonString.totalBoxDisplay,
                            styleText: const CustomTestStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: TextField(
                              controller: controller.controllerTotalDisplay,
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.numberDisplay.value = int.parse(val);
                                } else {
                                  controller.numberDisplay.value = 0;
                                }
                                controller.checkValidation(val);
                              },
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.grey.withOpacity(0.5), hintText: '', counterText: ""
                                  // contentPadding: const EdgeInsets.only(left: 0.0, bottom: 8.0, top: 8.0),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 2.sp,
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      color: Colors.green,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            controller.commonString.maxSelectionBothSide,
                            styleText: const CustomTestStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: TextField(
                              controller: controller.controllerTotalSelection,
                              maxLength: 2,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.numberTotalSelect.value = int.parse(val);

                                  if (controller.numberTotalSelect.value > (controller.numberDisplay.value * 2)) {
                                    controller.resultUpdate.value = controller.commonString.error +
                                        controller.commonString
                                            .errorEnterValueSelection(controller.numberDisplay.value * 2);
                                    controller.update();
                                    return;
                                  }
                                } else {
                                  controller.numberTotalSelect.value = 0;
                                }
                                controller.checkValidation(val, limit: 22);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.grey.withOpacity(0.5), hintText: '', counterText: ""
                                  // contentPadding: const EdgeInsets.only(left: 0.0, bottom: 8.0, top: 8.0),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            controller.commonString.maxAlphabets,
                            styleText: const CustomTestStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: TextField(
                              controller: controller.controllerMaxAlphabet,
                              maxLength: 2,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.numberMaxAlphabet.value = int.parse(val);
                                } else {
                                  controller.numberMaxAlphabet.value = 0;
                                }
                                controller.checkValidation(val);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.grey.withOpacity(0.5), hintText: '', counterText: ""
                                  // contentPadding: const EdgeInsets.only(left: 0.0, bottom: 8.0, top: 8.0),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            controller.commonString.maxNumbers,
                            styleText: const CustomTestStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: TextField(
                              controller: controller.controllerMaxNumber,
                              maxLength: 2,
                              onChanged: (val) {
                                if (val.isNotEmpty) {
                                  controller.numberMaxNumber.value = int.parse(val);
                                } else {
                                  controller.numberMaxNumber.value = 0;
                                }
                                controller.checkValidation(val);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true, fillColor: Colors.grey.withOpacity(0.5), hintText: '', counterText: ""
                                  // contentPadding: const EdgeInsets.only(left: 0.0, bottom: 8.0, top: 8.0),
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 2.sp,
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      color: Colors.green,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: controller.listModelAlphabet[index].isSelected!.value,
                                      onChanged: (val) {
                                        controller.alphabetSelection(
                                          val!,
                                          index,
                                          controller.listModelAlphabet,
                                          controller.numberMaxAlphabet.value,
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        controller.listModelAlphabet[index].title!,
                                        styleText: CustomTestStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              itemCount: controller.numberDisplay.value <= 11 ? controller.numberDisplay.value : 0),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: controller.listModelNumber[index].isSelected!.value,
                                      onChanged: (val) {
                                        // controller.listModelNumber[index].isSelected!.value = val!;
                                        controller.alphabetSelection(
                                          val!,
                                          index,
                                          controller.listModelNumber,
                                          controller.numberMaxNumber.value,
                                          isNumber: true,
                                        );
                                        controller.update();
                                      },
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        controller.listModelNumber[index].title!,
                                        styleText: CustomTestStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              itemCount: controller.numberDisplay.value <= 11 ? controller.numberDisplay.value : 0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.px, horizontal: 5.px),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onInit();
                        controller.update();
                      },
                      child: Container(
                        width: 40.sp,
                        height: 35.sp,
                        color: Colors.yellow,
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0.px,
                        ),
                        child: CustomText(
                          controller.commonString.resetAll,
                          styleText: const CustomTestStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0.px),
                        height: 35.sp,
                        color: controller.isSuccess.value ? Colors.green : Colors.red,
                        child: CustomText(
                          controller.resultUpdate.value,
                          styleText: const CustomTestStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
