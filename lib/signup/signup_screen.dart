import 'package:e_commerce_app/svgImages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import necessary files
import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/widgets/my_button_widget.dart';
import 'package:e_commerce_app/widgets/my_textfromfield_widget.dart';
import '../styles/signup_screen_styles.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        elevation: 4, // Add a subtle shadow
        backgroundColor: Colors.white, // Set a solid background color
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [AppColors.baseDarkPinkColor,
        AppColors.baseBlackColor], // Gradient colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
    ),
    ),
    ),
        ),


      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context); // Navigates back to LoginScreen
      //     },
      //   ),
      // ),
      
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            buildTopPart(),
            buildBottomPart(),
          ],
        ),
      ),
    );
  }

  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 150,
        ),
        MyTextFromField(hintText: "Full Name", obscureText: false),
        MyTextFromField(hintText: "Email", obscureText: false),
        MyTextFromField(hintText: "Password", obscureText: true),
        MyTextFromField(hintText: "Confirm Password", obscureText: true),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: MyButtonWidget(
            onPress: () {},
            color: AppColors.baseBlackColor,
            text: "Create an account",
          ),
        ),
        SizedBox(height: 20),
        RichText(
          text: TextSpan(
            text: "By signing up you agree to our\n",
            style: SignupScreenStyles.signInAgressStyle,
            children: <TextSpan>[
              TextSpan(text: "Terms ", style: SignupScreenStyles.termsTextStyle),
              TextSpan(text: "and ", style: SignupScreenStyles.andTextStyle),
              TextSpan(text: "Conditions of use", style: SignupScreenStyles.conditionTextStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign in with social",
            style: SignupScreenStyles.signInSocialTextStyle,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                socialButton(SvgPicture.asset(SvgImages.facebook)),
                socialButton(SvgPicture.asset(SvgImages.google)),
                socialButton(SvgPicture.asset(SvgImages.x)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialButton(Widget child) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.baseGrey40Color),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () {},
      child: child,
    );
  }
}
