import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/controllers/authcontrollers.dart';
import 'package:sooooperbusiness/views/components/custombutton.dart';
import 'package:sooooperbusiness/views/components/my_text_field.dart';

class SendPasswordOtpScreen extends StatelessWidget {
  AuthControllers authControllers = Get.put(AuthControllers());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: authControllers.formKeySendPassword,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 30, 0),
                child: Image.asset(
                  'assets/images/logo_long.png',
                  height: 70,
                  width: 300,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Forgot you password?",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Constant.black,
                      fontFamily: 'Poppins_Bold'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "Enter your Email",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Constant.black,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: MyTextField(
                    controller: authControllers.sendPasswordOtpEmail,
                    borderRadius: 30,
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onChanged: (value) {},
                    labelText: 'Email',
                    borderColor: Constant.borderColor,
                    focusedBorderColor: Constant.black,
                    borderWidth: 2,
                    keyboardType: TextInputType.emailAddress,
                    showTrailingWidget: true,
                    // prefixWidget: Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //   child: Text("+91"),
                    // ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email ';
                      }
                      return null;
                    },
                    trailing: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      child: CircleAvatar(
                        backgroundColor: Constant.secondaryColor,
                        radius: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/arrow_bold.png'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                title: "Submit",
                onTap: () {
                  if (authControllers.formKeySendPassword.currentState!.validate()) {
                    authControllers.formKeySendPassword.currentState!.save();
                    authControllers.sendForgetPasswordEmail();
                  }
                },
                borderRadius: 25,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                height: 65,
                textColor: Constant.white,
                backgroundColor: Constant.black,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 10.0),
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: InkWell(
              //       onTap: () {
              //         // Get.offAllNamed('/homeroot');
              //       },
              //       child: Text(
              //         "Forgot Password ?",
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.normal,
              //             color: Constant.black,
              //             fontFamily: 'Poppins'),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(35, 0, 35, 50),
              //   child: Text(
              //     "By Continuing agreed to use Wedun Terms of use & Privacy Policy",
              //     style: TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.normal,
              //         color: Constant.black,
              //         fontFamily: 'Poppins'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(35, 25, 35, 0),
              //   child: PinCodeTextField(
              //     length: 6,
              //     obscureText: false,
              //     animationType: AnimationType.fade,
              //     pinTheme: PinTheme(
              //         shape: PinCodeFieldShape.box,
              //         borderRadius: BorderRadius.circular(10),
              //         fieldHeight: 50,
              //         fieldWidth: 50,
              //         activeFillColor: Colors.white,
              //         inactiveColor: Constant.borderColor,
              //         activeColor: Constant.black,
              //         disabledColor: Constant.borderColor,
              //         selectedColor: Constant.secondaryColor),
              //     animationDuration: Duration(milliseconds: 300),
              //     backgroundColor: Colors.white,
              //     keyboardType: TextInputType.number,
              //     enableActiveFill: false,
              //     cursorColor: Constant.secondaryColor,
              //     errorAnimationController: authControllers.errorController,
              //     controller: authControllers.textEditingController,
              //     onCompleted: (v) {
              //       print("Completed");
              //     },
              //     onChanged: (value) {
              //       print(value);
              //       authControllers.currentText.value = value;
              //     },
              //     beforeTextPaste: (text) {
              //       print("Allowing to paste $text");
              //       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //       //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //       return true;
              //     },
              //     appContext: context,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
