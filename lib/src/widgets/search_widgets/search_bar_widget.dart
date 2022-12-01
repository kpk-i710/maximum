import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/speech_controller.dart';
import '../../widgets/app_icon.dart';
import '../../styles.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged? onClickFilter;
  final Function(String value)? onSubmitted;

  final speechController = Get.put(SpeechController());
  final textController = TextEditingController();

  SearchBarWidget({Key? key, this.onClickFilter, this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    speechController.setListeners(onResult: (text) {
      textController.text = text;
    });
    return InkWell(
      onTap: () {
        // navigator.push(SearchModal());
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: context.theme.primary,
            border: Border.all(
              color: context.theme.primary.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Container(
          color: context.theme.background,
          child: Row(
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.only(right: 12, left: 0),
                child: Icon(Icons.search, color: Get.theme.primaryColor),
              ),*/
              Expanded(
                child: Container(
                  child: Obx(() => TextField(
                    maxLines: 1,
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      hintText: speechController.listening.value
                          ? 'speak'.tr.toUpperCase()
                          : 'products_search'.tr.toUpperCase(),
                      hintStyle: AppTextStyles.roboto(
                          color: context.theme.mainTextColor.withOpacity(0.6),
                          fontSize: 18),
                      labelStyle: AppTextStyles.roboto(fontSize: 18),
                      prefixIcon: AppIcon(AppIcons.search,
                              color: context.theme.greyMedium),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.accent.withOpacity(0.0),
                          ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.accent.withOpacity(0.0),
                          ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.accent.withOpacity(0.0),
                          ),
                      ),
                    ),
                    style: AppTextStyles.roboto(fontSize: 18),
                    onSubmitted: onSubmitted ?? (value) {
                      if (value.trim().isNotEmpty)
                        Get.toNamed('/search', arguments: value);
                    },
                  )),
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  if (!speechController.isListening())
                    speechController.startListening();
                  else speechController.stopListening();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, top: 3, bottom: 3),
                  child: Obx(() {
                    if (speechController.listening.value)
                      return Icon(
                        Icons.fiber_manual_record,
                        size: 34,
                        color: context.theme.greyStrong,
                      );

                    return const AppIcon(
                      AppIcons.mic,
                      size: 34,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
