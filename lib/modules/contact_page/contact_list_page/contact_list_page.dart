import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_auto/Utils/assets_path.dart';
import 'package:whatsapp_auto/Utils/navigation_utils/navigation.dart';
import 'package:whatsapp_auto/Utils/size_utils.dart';
import 'package:whatsapp_auto/modules/contact_page/contact_list_page/contact_list_controller.dart';
import 'package:whatsapp_auto/modules/homepage/homePageCantroller.dart';
import 'package:whatsapp_auto/theme/app_color.dart';
import 'package:whatsapp_auto/theme/app_string.dart';
import 'package:whatsapp_auto/widgets/app_text.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final HomePageController homePageController = Get.find();

  final ContactListController contactListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homePageController.isSwitched.value
            ? AppColor.darkThem
            : AppColor.lightThem,
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: homePageController.isSwitched.value
              ? AppColor.whiteColor
              : AppColor.whiteColor,
          leadingWidth: SizeUtils.fSize_40(),
          leading: GestureDetector(
            onTap: () {
              Navigation.pop();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Image.asset(
                AppIcons.backIcon,
                color: homePageController.isSwitched.value
                    ? AppColor.backIconColor
                    : AppColor.backIconColor,
              ),
            ),
          ),
          title: AppText(
            AppString.contacts,
            fontSize: SizeUtils.fSize_18(),
            fontWeight: FontWeight.w600,
            color: homePageController.isSwitched.value
                ? AppColor.textColor
                : AppColor.textColor,
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 4),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppIcons.search,
                      width: SizeUtils.fSize_24(),
                      color: homePageController.isSwitched.value
                          ? AppColor.textColor
                          : AppColor.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 4),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppIcons.more,
                      width: SizeUtils.fSize_24(),
                      color: homePageController.isSwitched.value
                          ? AppColor.textColor
                          : AppColor.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: SizeUtils.horizontalBlockSize * 4.5,
            right: SizeUtils.horizontalBlockSize * 4.5,
            top: SizeUtils.horizontalBlockSize * 5.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppString.availableContactsList,
                fontSize: SizeUtils.fSize_16(),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: SizeUtils.verticalBlockSize * 2,
              ),
              Obx(
                () => contactListController.isLoader.value
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorCollection.greenColor,
                          ),
                        ),
                      )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: contactListController.contacts.length,
                        itemBuilder: (context, index) {
                          print(
                              '======${contactListController.contacts.length}');
                          return Padding(
                            padding: EdgeInsets.only(
                              top: SizeUtils.verticalBlockSize * 1,
                              bottom: SizeUtils.verticalBlockSize * 1,
                              right: SizeUtils.horizontalBlockSize * 1,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red
                                  ),
                                  child: Image.asset(
                                    AssetsPath.profile,
                                    width: SizeUtils.horizontalBlockSize * 7.6,
                                    height: SizeUtils.verticalBlockSize * 4.5,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeUtils.horizontalBlockSize * 5,
                                ),
                                AppText(
                                  contactListController
                                      .contacts[index].displayName
                                      .toString(),
                                  fontWeight: FontWeight.w400,
                                  color: homePageController.isSwitched.value
                                      ? AppColor.whiteColor
                                      : AppColor.textColor,
                                  fontSize: SizeUtils.fSize_14(),
                                ),
                                const Spacer(),
                                Obx(
                                  () => SizedBox(
                                    width:
                                        SizeUtils.horizontalBlockSize * 4.8,
                                    height: SizeUtils.verticalBlockSize * 2.8,
                                    child: Checkbox(
                                      value: contactListController
                                              .contacts[index].isselected ??
                                          false,
                                      activeColor: ColorCollection.greenColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          if ((contactListController
                                              .contacts[index]
                                              .isselected ??
                                              false) ==
                                              false) {
                                            contactListController
                                                .contacts[index]
                                                .isselected = true;
                                          } else {
                                            contactListController
                                                .contacts[index]
                                                .isselected = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
