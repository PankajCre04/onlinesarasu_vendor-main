import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/single_choice_chip.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/inventory/addonController.dart';
import 'package:sooooperbusiness/controllers/inventory/inventoryController.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/addoncategorydata.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/labeledcheckbox.dart';
import 'package:sooooperbusiness/views/components/my_cached_network_image.dart';
import 'package:sooooperbusiness/views/components/my_list_tile.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class AddProduct extends StatelessWidget {
  final status;
  final id;
  final index;

  AddProduct(this.status, this.id, this.index);

  InventoryController controller = Get.put(InventoryController());
  OfferController offerController = Get.put(OfferController());
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Constant.black,
          ),
        ),
        title: Text(
          "$status Product",
          style: TextStyle(
            fontSize: 16.0,
            color: Constant.black,
            fontFamily: 'Poppins_Bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        // child: (Controller.isLoading!.value == true)
        //     ? Align(
        //         alignment: Alignment.center,
        //         child: CircularProgressIndicator())
        //     :
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
              child: Text(
                'Enter Details',
                style: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.black, fontFamily: 'Poppins_Bold'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
                child: Obx(() {
                  return Form(
                    key: controller.additemformkey,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productNameController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Name',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productDescriptionController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Description',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Description';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productPriceController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Item Price',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Item Price';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productSalePriceController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Item Sale Price (Optional)',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Item Sale Price';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: MyTextField(
                          controller: controller.productQuantityController,
                          borderRadius: 10,
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          onChanged: (value) {},
                          labelText: 'Quantity',
                          borderColor: Constant.borderColor,
                          focusedBorderColor: Constant.black,
                          keyboardType: TextInputType.number,
                          borderWidth: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Quantity';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  controller.selectedOpenTimeController.text = await controller.selectTime(context);
                                },
                                child: MyTextField(
                                  controller: controller.selectedOpenTimeController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  isEnabled: false,
                                  labelText: 'Start Time',
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  keyboardType: TextInputType.number,
                                  showTrailingWidget: true,
                                  overrideHintText: true,
                                  hintText: "Start",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Start Time';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  controller.selectedCloseTimeController.text = await controller.selectTime(context);
                                },
                                child: MyTextField(
                                  controller: controller.selectedCloseTimeController,
                                  borderRadius: 10,
                                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  onChanged: (value) {},
                                  labelText: 'End Time',
                                  isEnabled: false,
                                  borderColor: Constant.borderColor,
                                  focusedBorderColor: Constant.black,
                                  borderWidth: 2,
                                  overrideHintText: true,
                                  hintText: "End Time",
                                  keyboardType: TextInputType.number,
                                  showTrailingWidget: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter End Date';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Obx(
                      //       () => MyListTile(
                      //     //margin: EdgeInsets.all(20),
                      //     title: "Product Image",
                      //     trailingIconData:
                      //     (Controller.ImageSelected.value &&
                      //         Controller.ImageSelected != null)
                      //         ? Icons.check_circle
                      //         : Icons.cloud_upload,
                      //     trailingColor:
                      //     (Controller.ImageSelected.value &&
                      //         Controller.ImageSelected != null)
                      //         ? Colors.green[700]
                      //         : Colors.red,
                      //     onPressed: () async {
                      //       Controller.idType.value = "Image";
                      //       await Controller.pickImage();
                      //     },
                      //     leadingImageName: null,
                      //     subtitle: null,
                      //   ),
                      // ),
                      // (Controller.ImageSelected.value &&
                      //     Controller.ImageSelected != null)?GetBuilder<InventoryController>(
                      //   builder: (addCat) => addCat.ImageSelected.value &&
                      //       addCat.Image != null
                      //       ? Padding(
                      //     padding: const EdgeInsets.fromLTRB(
                      //         20, 0, 20, 0),
                      //     child: Image.file(addCat.Image as File),
                      //   )
                      //       : Container(),
                      // ):Container(),
                      // SizedBox(
                      //   height: 10,
                      // ),

                      // (status == "Add")
                      //     ? Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      //           child: Text(
                      //             "Select Gallery Images*",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: "Poppins_Bold"),
                      //           ),
                      //         ),
                      //       )
                      //     : Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      //           child: Text(
                      //             "Select Gallery Images*",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: "Poppins_Bold"),
                      //           ),
                      //         ),
                      //       ),
                      // (status == "Add")
                      //     ? Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      //           child: Obx(
                      //             () => Text(
                      //               "${controller.selectedGalleryImage!.length} Image Selected",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   color: Constant.greyDark,
                      //                   fontFamily: "Poppins"),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Padding(
                      //           padding:
                      //               const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      //           child: Obx(
                      //             () => Text(
                      //               "${controller.selectedGalleryImage!.length} Image Selected",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   color: Constant.greyDark,
                      //                   fontFamily: "Poppins"),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      // (status == "Add")
                      //     ? Padding(
                      //         padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      //         child: GetBuilder<InventoryController>(
                      //           builder: (ownerControllers) => GridView.builder(
                      //             itemBuilder: (context, index) {
                      //               if (ownerControllers
                      //                       .selectedGalleryImage!.length ==
                      //                   index) {
                      //                 return InkWell(
                      //                   onTap: () {
                      //                     ownerControllers.pickGalleryImages();
                      //                   },
                      //                   child: Container(
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                             color: Constant.borderColor,
                      //                             width: 1.8),
                      //                         borderRadius: BorderRadius.all(
                      //                             Radius.circular(10))),
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.fromLTRB(
                      //                           15, 0, 15, 0),
                      //                       child: Icon(Icons.add_circle),
                      //                     ),
                      //                   ),
                      //                 );
                      //               } else {
                      //                 return Container(
                      //                   decoration: BoxDecoration(
                      //                       border: Border.all(
                      //                           color: Constant.borderColor,
                      //                           width: 1.8),
                      //                       borderRadius: BorderRadius.all(
                      //                           Radius.circular(10))),
                      //                   child: Stack(
                      //                     children: [
                      //                       Padding(
                      //                         padding:
                      //                             const EdgeInsets.fromLTRB(
                      //                                 5, 10, 5, 10),
                      //                         child: Center(
                      //                           child: Image.file(
                      //                               ownerControllers
                      //                                   .selectedGalleryImage!
                      //                                   .elementAt(
                      //                                       index) as File),
                      //                         ),
                      //                       ),
                      //                       Align(
                      //                         child: InkWell(
                      //                             child: Padding(
                      //                               padding: const EdgeInsets
                      //                                   .fromLTRB(5, 5, 5, 0),
                      //                               child: Icon(
                      //                                 Icons.remove_circle,
                      //                                 color: Colors.red,
                      //                               ),
                      //                             ),
                      //                             onTap: () {
                      //                               ownerControllers
                      //                                   .selectedGalleryImage!
                      //                                   .removeAt(index);
                      //                               ownerControllers.update();
                      //                             }),
                      //                         alignment: Alignment.topRight,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 );
                      //               }
                      //             },
                      //             itemCount: ownerControllers
                      //                     .selectedGalleryImage!.length +
                      //                 1,
                      //             gridDelegate:
                      //                 SliverGridDelegateWithFixedCrossAxisCount(
                      //                     crossAxisCount: ownerControllers
                      //                                 .selectedGalleryImage!
                      //                                 .length >
                      //                             0
                      //                         ? 2
                      //                         : 1,
                      //                     crossAxisSpacing: 10,
                      //                     mainAxisSpacing: 10),
                      //             shrinkWrap: true,
                      //             reverse: true,
                      //             physics: NeverScrollableScrollPhysics(),
                      //           ),
                      //         ),
                      //       )
                      //     : Padding(
                      //         padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      //         child: GetBuilder<InventoryController>(
                      //           builder: (ownerControllers) => GridView.builder(
                      //             itemBuilder: (context, index) {
                      //               if (ownerControllers
                      //                       .selectedGalleryImage!.length ==
                      //                   index) {
                      //                 return InkWell(
                      //                   onTap: () {
                      //                     ownerControllers
                      //                         .pickGalleryImagesEdit();
                      //                   },
                      //                   child: Container(
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                             color: Constant.borderColor,
                      //                             width: 1.8),
                      //                         borderRadius: BorderRadius.all(
                      //                             Radius.circular(10))),
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.fromLTRB(
                      //                           15, 0, 15, 0),
                      //                       child: Icon(Icons.add_circle),
                      //                     ),
                      //                   ),
                      //                 );
                      //               } else {
                      //                 return Container(
                      //                   decoration: BoxDecoration(
                      //                       border: Border.all(
                      //                           color: Constant.borderColor,
                      //                           width: 1.8),
                      //                       borderRadius: BorderRadius.all(
                      //                           Radius.circular(10))),
                      //                   child: Stack(
                      //                     children: [
                      //                       Padding(
                      //                           padding:
                      //                               const EdgeInsets.fromLTRB(
                      //                                   5, 10, 5, 10),
                      //                           child: Center(
                      //                             child: (ownerControllers
                      //                                         .selectedGalleryImage![
                      //                                             index]
                      //                                         .toString()[0] !=
                      //                                     "/")
                      //                                 ? MyCachedNetworkImage(
                      //                                     url: Constant
                      //                                             .imageUrl +
                      //                                         "/" +
                      //                                         ownerControllers
                      //                                             .selectedGalleryImage![
                      //                                                 index]
                      //                                             .toString(),
                      //                                   )
                      //                                 : MyCachedNetworkImage(
                      //                                     url: Constant
                      //                                             .imageUrl +
                      //                                         "" +
                      //                                         ownerControllers
                      //                                             .selectedGalleryImage![
                      //                                                 index]
                      //                                             .toString(),
                      //                                   ),
                      //                           )),
                      //                       Align(
                      //                         child: InkWell(
                      //                             child: Padding(
                      //                               padding: const EdgeInsets
                      //                                   .fromLTRB(5, 5, 5, 0),
                      //                               child: Icon(
                      //                                 Icons.remove_circle,
                      //                                 color: Colors.red,
                      //                               ),
                      //                             ),
                      //                             onTap: () {
                      //                               ownerControllers.DeleteImage(
                      //                                   ownerControllers
                      //                                           .selectedGalleryImage![
                      //                                       index]);
                      //                               ownerControllers
                      //                                   .selectedGalleryImage!
                      //                                   .removeAt(index);
                      //                               ownerControllers.update();
                      //                             }),
                      //                         alignment: Alignment.topRight,
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 );
                      //               }
                      //             },
                      //             itemCount: ownerControllers
                      //                     .selectedGalleryImage!.length +
                      //                 1,
                      //             gridDelegate:
                      //                 SliverGridDelegateWithFixedCrossAxisCount(
                      //                     crossAxisCount: ownerControllers
                      //                                 .selectedGalleryImage!
                      //                                 .length >
                      //                             0
                      //                         ? 2
                      //                         : 1,
                      //                     crossAxisSpacing: 10,
                      //                     mainAxisSpacing: 10),
                      //             shrinkWrap: true,
                      //             reverse: true,
                      //             physics: NeverScrollableScrollPhysics(),
                      //           ),
                      //         ),
                      //       ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Category",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.allProductCategory.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              print("clicked");
                                              controller.selectedProductCategory.value = controller.allProductCategory[i].id.toString();
                                              controller.GetProductSubCategory(controller.allProductCategory[i].id.toString());
                                            },
                                            child: controller.allProductCategory[i].name == null
                                                ? Container()
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        color: (controller.selectedProductCategory.value == controller.allProductCategory[i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                        border: Border.all(
                                                          color: Constant.secondaryColor.withOpacity(1),
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        controller.allProductCategory[i].name!,
                                                        style: TextStyle(
                                                          color: (controller.selectedProductCategory.value == controller.allProductCategory[i].id.toString()) ? Constant.white : Constant.black,
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      (controller.productSubCategoryData.value.data == null)
                          ? Container()
                          : (controller.productSubCategoryData.value.data!.length == 0)
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product Sub Category",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Wrap(
                                            children: [
                                              for (int i = 0; i < controller.productSubCategoryData.value.data!.length; i++)
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                                  child: Obx(
                                                    () => InkWell(
                                                      onTap: () {
                                                        controller.selectedProductCategory.value = controller.productSubCategoryData.value.data![i].id.toString();
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              color: (controller.selectedProductCategory.value == controller.productSubCategoryData.value.data![i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                              border: Border.all(
                                                                color: Constant.secondaryColor.withOpacity(1),
                                                              ),
                                                              borderRadius: BorderRadius.all(Radius.circular(20))),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              controller.productSubCategoryData.value.data![i].name!,
                                                              style: TextStyle(
                                                                color: (controller.selectedProductCategory.value == controller.productSubCategoryData.value.data![i].id.toString()) ? Constant.white : Constant.black,
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Type",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productType.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductType.value = controller.productType[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductType.value == controller.productType[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productType[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductType.value == controller.productType[i].toString()) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Tag",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productTags.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductTag.value = controller.productTags[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductTag.value == controller.productTags[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productTags[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductTag.value == controller.productTags[i].toString()) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Unit",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < controller.productUnits.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.selectedProductUnit.value = controller.productUnits[i].toString();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (controller.selectedProductUnit.value == controller.productUnits[i].toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent,
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.productUnits[i],
                                                    style: TextStyle(
                                                      color: (controller.selectedProductUnit.value == controller.productUnits[i].toString()) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(border: Border.all(color: Constant.borderColor, width: 1.8), borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Coupons",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  children: [
                                    for (int i = 0; i < offerController.promoDataList.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                        child: Obx(
                                          () => InkWell(
                                            onTap: () {
                                              if (offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString())) {
                                                offerController.selectedCoupons!.remove(offerController.promoDataList[i].id.toString());
                                              } else {
                                                offerController.selectedCoupons!.add(offerController.promoDataList[i].id.toString());
                                              }
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: (offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString()) ? Constant.secondaryColor.withOpacity(1) : Colors.transparent),
                                                    border: Border.all(
                                                      color: Constant.secondaryColor.withOpacity(1),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    offerController.promoDataList[i].code.toString(),
                                                    style: TextStyle(
                                                      color: offerController.selectedCoupons!.contains(offerController.promoDataList[i].id.toString()) ? Constant.white : Constant.black,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //
                      //         Text(
                      //           "Select Store Category",
                      //           style: TextStyle(
                      //               color: Constant.black, fontSize: 16),
                      //         ),
                      //         SingleSelectionChip(
                      //           controller.allProductCategory,
                      //           controller.selectedParentSubcategory,
                      //           onSelectionChanged: (selectedList) {
                      //             print(selectedList);
                      //             // controller.selectedParentSubcategory.value =
                      //             //     selectedList;
                      //             // controller.getSubCategoryBYCategory(controller
                      //             //     .selectedParentSubcategory.value);
                      //           },
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         // Obx(
                      //         //   () => controller
                      //         //               .selectedParentSubcategory.value !=
                      //         //           ""
                      //         //       ? Text(
                      //         //           "Select SubCategory",
                      //         //           style: TextStyle(
                      //         //               color: Constant.black,
                      //         //               fontSize: 16),
                      //         //         )
                      //         //       : Container(),
                      //         // ),
                      //         // Obx(
                      //         //   () => controller
                      //         //               .selectedParentSubcategory.value !=
                      //         //           ""
                      //         //       ? controller.isLoadingSubCategory.isFalse
                      //         //           ? controller.selectedParentSubcategory
                      //         //                       .value !=
                      //         //                   ""
                      //         //               ? controller.subCategoryData[controller
                      //         //                               .selectedParentSubcategory
                      //         //                               .value] !=
                      //         //                           null &&
                      //         //                       controller
                      //         //                               .subCategoryData[
                      //         //                                   controller
                      //         //                                       .selectedParentSubcategory
                      //         //                                       .value]
                      //         //                               .length >
                      //         //                           0
                      //         //                   ? SingleSelectionChip(
                      //         //                       controller.subCategoryData[
                      //         //                           controller
                      //         //                               .selectedParentSubcategory
                      //         //                               .value],
                      //         //                       controller
                      //         //                           .selectedSubCategory,
                      //         //                       onSelectionChanged:
                      //         //                           (selectedList) {
                      //         //                         print(selectedList);
                      //         //                         controller
                      //         //                             .selectedSubCategory
                      //         //                             .value = selectedList;
                      //         //                       },
                      //         //                     )
                      //         //                   : Center(
                      //         //                       child: Padding(
                      //         //                       padding: const EdgeInsets
                      //         //                               .fromLTRB(
                      //         //                           8.0, 20, 8.0, 5),
                      //         //                       child: Text(
                      //         //                           "No Subcategory Found"),
                      //         //                     ))
                      //         //               : Container()
                      //         //           : Utility.myDialog()
                      //         //       : Container(),
                      //         // ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 2,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                      //   child: GetBuilder<AddonController>(
                      //     builder: (addonControllers) => MultiSelectChipField(
                      //       items:
                      //           addonControllers.addOnCategoryMultiSelectItem,
                      //       title: Text(
                      //         "Add on Category",
                      //         style: TextStyle(color: Constant.black),
                      //       ),
                      //       initialValue: controller.selectedAddon!.value,
                      //       searchable: true,
                      //       showHeader: true,
                      //       searchTextStyle: TextStyle(fontSize: 12),
                      //       headerColor: Constant.greyBack,
                      //       decoration: BoxDecoration(
                      //           border: Border.all(
                      //               color: Constant.borderColor, width: 1.8),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10))),
                      //       selectedChipColor:
                      //           Constant.secondaryColor.withOpacity(1),
                      //       selectedTextStyle: TextStyle(color: Constant.white),
                      //       scroll: false,
                      //       scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                      //       onTap: (values) {
                      //         controller.selectedAddon!.value =
                      //             values as List<String>;
                      //         print(values);
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                      //   child: GetBuilder<InventoryController>(
                      //     builder: (InventoryController) =>
                      //         MultiSelectChipField(
                      //       items: InventoryController.categoryselectionlist,
                      //       title: Text(
                      //         "Category",
                      //         style: TextStyle(color: Constant.black),
                      //       ),
                      //       searchable: true,
                      //       showHeader: true,
                      //       searchTextStyle: TextStyle(fontSize: 12),
                      //       headerColor: Constant.greyBack,
                      //       decoration: BoxDecoration(
                      //           border: Border.all(
                      //               color: Constant.borderColor, width: 1.8),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10))),
                      //       selectedChipColor:
                      //           Constant.secondaryColor.withOpacity(1),
                      //       selectedTextStyle: TextStyle(color: Constant.white),
                      //       scroll: false,
                      //       scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                      //       onTap: (values) {
                      //         //InventoryController.selectedCategory!.clear();
                      //         //_selectedAnimals4 = values;
                      //         InventoryController.selectedCategory!.value =
                      //             values;
                      //         InventoryController.parentId!.value =
                      //             InventoryController.selectedCategory![0].id;
                      //
                      //         // for(var i=0;i<InventoryController.selectedCategory!.length;i++){
                      //         //   //InventoryController.parentList.value =
                      //         //   print(InventoryController.selectedCategory![i].id);
                      //         // }
                      //
                      //         print(InventoryController.selectedCategory!);
                      //         print(values);
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //   child: GetBuilder<InventoryController>(
                      //     builder: (InventoryController) =>
                      //         MultiSelectChipField(
                      //       items: InventoryController.allcategoryselectionlist,
                      //       title: Text(
                      //         "Sub Category",
                      //         style: TextStyle(color: Constant.black),
                      //       ),
                      //       searchable: true,
                      //       showHeader: true,
                      //       searchTextStyle: TextStyle(fontSize: 12),
                      //       headerColor: Constant.greyBack,
                      //       decoration: BoxDecoration(
                      //           border: Border.all(
                      //               color: Constant.borderColor, width: 1.8),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(10))),
                      //       selectedChipColor:
                      //           Constant.secondaryColor.withOpacity(1),
                      //       selectedTextStyle: TextStyle(color: Constant.white),
                      //       scroll: false,
                      //       scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                      //       onTap: (values) {
                      //         //InventoryController.selectedCategory!.clear();
                      //         //_selectedAnimals4 = values;
                      //         InventoryController.selectedCategory2!.value =
                      //             values;
                      //         InventoryController.parentId2!.value =
                      //             InventoryController.selectedCategory2![0].id;
                      //
                      //         // for(var i=0;i<InventoryController.selectedCategory!.length;i++){
                      //         //   //InventoryController.parentList.value =
                      //         //   print(InventoryController.selectedCategory![i].id);
                      //         // }
                      //
                      //         print(InventoryController.selectedCategory!);
                      //         print(values);
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 10),

                      // (Controller.showDrop.value == true)
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 6.0, right: 6),
                      //         child: Container(
                      //           padding: EdgeInsets.only(
                      //               left: 20, right: 10),
                      //           decoration: BoxDecoration(
                      //               borderRadius:
                      //                   BorderRadius.circular(10),
                      //               color: Constant.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.shade300,
                      //                   width: 2)
                      //               // boxShadow: [BoxShadow(
                      //               //   color: Colors.grey,
                      //               //   blurRadius: 5.0,
                      //               // ),]
                      //               ),
                      //           child: Obx(() {
                      //             return DropdownButton<String>(
                      //               focusColor: Colors.white,
                      //               underline: SizedBox(),
                      //               value: Controller.item![0],
                      //               // value: Controller.parent!.value,
                      //               //addCatController.parentt.toString(),
                      //               //elevation: 5,
                      //               isExpanded: true,
                      //               style:
                      //                   TextStyle(color: Colors.white),
                      //               iconEnabledColor: Colors.black,
                      //               items:
                      //                   Controller.item!.map((value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Text(
                      //                     value,
                      //                     style: TextStyle(
                      //                       color: Constant.greyDark,
                      //                       fontSize: 18,
                      //                     ),
                      //                   ),
                      //                 );
                      //               }).toList(),
                      //               hint: Text(
                      //                 "Parent",
                      //                 style: TextStyle(
                      //                   color: Constant.greyDark,
                      //                   fontSize: 18,
                      //                 ),
                      //               ),
                      //               icon: Icon(
                      //                 Icons
                      //                     .arrow_drop_down_circle_rounded,
                      //                 color: Constant.secondaryColor,
                      //               ),
                      //               iconSize: 20,
                      //               onChanged: (String? value) {
                      //                 print(value);
                      //                 for (var i = 0;
                      //                     i < Controller.item!.length;
                      //                     i++) {
                      //                   if (value ==
                      //                       Controller.item![i]) {
                      //                     print(Controller.item![i]);
                      //                     Controller.parentId!.value =
                      //                         Controller.parentList![i]
                      //                             .toString();
                      //                     // setState(() {
                      //                     //   parentId = Controller.parent!.value[i].toString();
                      //                     // });
                      //                   }
                      //                 }
                      //                 //Controller.parent.value = value;
                      //                 // setState(() {
                      //                 //   parent = value;
                      //                 // });
                      //               },
                      //             );
                      //           }),
                      //         ),
                      //       )
                      //     : Container(),
                      // (Controller.showDrop.value == true)
                      //     ? SizedBox(
                      //         height: 10,
                      //       )
                      //     : Container(),
                      // (Controller.showDrop.value == true)
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 6.0, right: 6),
                      //         child: Container(
                      //           padding: EdgeInsets.only(
                      //               left: 20, right: 10),
                      //           decoration: BoxDecoration(
                      //               borderRadius:
                      //                   BorderRadius.circular(10),
                      //               color: Constant.white,
                      //               border: Border.all(
                      //                   color: Colors.grey.shade300,
                      //                   width: 2)
                      //               // boxShadow: [BoxShadow(
                      //               //   color: Colors.grey,
                      //               //   blurRadius: 5.0,
                      //               // ),]
                      //               ),
                      //           child: Obx(() {
                      //             return DropdownButton<String>(
                      //               focusColor: Colors.white,
                      //               underline: SizedBox(),
                      //               value: Controller.item![0],
                      //               // value: Controller.parent2!.value,
                      //               //addCatController.parentt.toString(),
                      //               //elevation: 5,
                      //               isExpanded: true,
                      //               style:
                      //                   TextStyle(color: Colors.white),
                      //               iconEnabledColor: Colors.black,
                      //               items:
                      //                   Controller.item!.map((value) {
                      //                 return DropdownMenuItem<String>(
                      //                   value: value,
                      //                   child: Text(
                      //                     value,
                      //                     style: TextStyle(
                      //                       color: Constant.greyDark,
                      //                       fontSize: 18,
                      //                     ),
                      //                   ),
                      //                 );
                      //               }).toList(),
                      //               hint: Text(
                      //                 "Parent",
                      //                 style: TextStyle(
                      //                   color: Constant.greyDark,
                      //                   fontSize: 18,
                      //                 ),
                      //               ),
                      //               icon: Icon(
                      //                 Icons
                      //                     .arrow_drop_down_circle_rounded,
                      //                 color: Constant.secondaryColor,
                      //               ),
                      //               iconSize: 20,
                      //               onChanged: (String? value) {
                      //                 print(value);
                      //                 for (var i = 0;
                      //                     i < Controller.item!.length;
                      //                     i++) {
                      //                   if (value ==
                      //                       Controller.item![i]) {
                      //                     print(Controller.item![i]);
                      //                     Controller.parentId2!.value =
                      //                         Controller.parentList![i]
                      //                             .toString();
                      //                     // setState(() {
                      //                     //   parentId = Controller.parent!.value[i].toString();
                      //                     // });
                      //                   }
                      //                 }
                      //                 Controller.parent2!.value =
                      //                     value.toString();
                      //                 // setState(() {
                      //                 //   parent = value;
                      //                 // });
                      //               },
                      //             );
                      //           }),
                      //         ),
                      //       )
                      //     : Container(),
                      // (Controller.showDrop.value == true)
                      //     ? SizedBox(
                      //         height: 10,
                      //       )
                      //     : Container(),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 6),
                        child: LabelCheckBox(
                            borderColor: Constant.borderColor,
                            borderRadius: 10,
                            borderWidth: 2,
                            labelText: "Is Active?",
                            onChanged: (value) {
                              controller.isActive.value = value!;
                            },
                            defaultValue: controller.isActive.value),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is Popular?",
                      //       onChanged: (value) {
                      //         controller.isPopular.value = value!;
                      //       },
                      //       defaultValue: controller.isPopular.value),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is New?",
                      //       onChanged: (value) {
                      //         controller.isNew.value = value!;
                      //       },
                      //       defaultValue: controller.isNew.value),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 6.0, right: 6),
                      //   child: LabelCheckBox(
                      //       borderColor: Constant.borderColor,
                      //       borderRadius: 10,
                      //       borderWidth: 2,
                      //       labelText: "Is Non-Veg?",
                      //       onChanged: (value) {
                      //         controller.isNonveg.value = value!;
                      //       },
                      //       defaultValue: controller.isNonveg.value),
                      // ),

                      GetBuilder<InventoryController>(
                          builder: (controller) => Obx(
                                () => controller.isProductImageSelected.value && controller.selectedProductImage.value != null
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Image.file(controller.selectedProductImage.value),
                                      )
                                    : Container(),
                              )),

                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: MyListTile(
                            margin: EdgeInsets.all(20),
                            title: "Product Image",
                            trailingIconData: (controller.isProductImageSelected.value && controller.selectedProductImage.value != null) ? Icons.check_circle : Icons.cloud_upload,
                            trailingColor: (controller.isProductImageSelected.value && controller.selectedProductImage != null) ? Colors.green[700] : Colors.red,
                            onPressed: () async {
                              controller.idType.value = "Image";
                              await controller.pickImage();
                            },
                            leadingImageName: null,
                            subtitle: null,
                          ),
                        ),
                      ),
                    ]),
                  );
                })),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomButton(
                      title: "Save",
                      //0 title: "$status",
                      textColor: Constant.white,
                      textStyle: TextStyle(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold, color: Constant.white, fontFamily: 'Poppins'),
                      borderRadius: 25,
                      customPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      backgroundColor: Constant.secondaryColor,
                      onTap: () {
                        print("click");
                        if (controller.additemformkey.currentState!.validate()) {
                          controller.additemformkey.currentState!.save();
                          if (
                              // controller.isProductImageSelected.value &&
                              controller.selectedProductCategory.value != "" &&
                                  controller.selectedProductType.value != "" &&
                                  controller.selectedProductTag.value != "" &&
                                  controller.selectedProductUnit.value != "" &&
                                  controller.selectedOpenTimeController.text != "" &&
                                  controller.selectedCloseTimeController.text != "") {
                            if (status == "Add") {
                              if (controller.isProductImageSelected.value) {
                                controller.AddProduct();
                              } else {
                                controller.AddProductWithoutImage();
                              }
                            } else {
                              if (controller.isProductImageSelected.value) {
                                print("emdit");
                                print(id);
                                controller.EditProduct(id, index);
                              } else {
                                controller.EditProductWithoutImage(id, index);
                              }
                            }
                            print("success");
                            //Controller.AddCategory();
                          } else {
                            print("error");
                            Utility.showToastError("error", "Select All Fields");
                            return;
                          }
                        } else {
                          Utility.showToastError("error", "Select All Fields");
                        }
                        // if((getStartedController.aadharCardSelected.value &&
                        //     getStartedController.aadharCardImage != null)||
                        //     (getStartedController.panCardSelected.value &&
                        //         getStartedController.panCardImage != null)
                        // ) {
                        //   if (getStartedController.currentPosition.value < 4) {
                        //     result = authControllers.signupOwner();
                        //     if(result == true){
                        //       getStartedController.changeSteps(
                        //           getStartedController.currentPosition.value + 1);
                        //     }else{
                        //       print("error");
                        //       Utility.showToastSuccess("error","Registration failed");
                        //     }
                        //
                        //   }
                        // }else{
                        //   print("error");
                        //   Utility.showToastSuccess("error","error");
                        // }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
