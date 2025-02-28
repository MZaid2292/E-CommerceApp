import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/screens/homepage/home_page.dart';
import 'package:e_commerce_app/signup/signup_screen.dart';
import 'package:e_commerce_app/styles/login_screen_styles.dart';
import 'package:e_commerce_app/svgImages/svg_images.dart';
import 'package:e_commerce_app/widgets/my_button_widget.dart';
import 'package:e_commerce_app/widgets/my_textfromfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // ✅ Fixed: Made `context` a required parameter
  Widget buildTopPart({required BuildContext context}) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 150,
        ),
        Column(
          children: [
            MyTextFromField(
              hintText: "E-Mail",
              obscureText: false,
            ),
            MyTextFromField(
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyButtonWidget(
                  text: "Sign in",
                  color: AppColors.baseBlackColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: HomePage(),
                    );
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MyButtonWidget(
                  text: "Sign up",
                  color: AppColors.baseDarkPinkColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: SignupScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Forgot password",
          style: LoginScreenStyles.forgotPasswordStyles,
        ),
        SizedBox(height: 60),
      ],
    );
  }

  // ✅ Fixed: Made `context` a required parameter
  Widget buildBottomPart({required BuildContext context}) {
    return Column(
      children: [
        Text(
          "Or Sign in with social",
          style: LoginScreenStyles.signinSocialStyles,
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: AppColors.baseGrey40Color,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  SvgImages.facebook,
                  color: AppColors.baseBlackColor,
                  width: 45,
                ),
              ),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: AppColors.baseGrey40Color,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  SvgImages.google,
                  color: AppColors.baseBlackColor,
                  width: 45,
                ),
              ),
              MaterialButton(
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: AppColors.baseGrey40Color,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  SvgImages.x,
                  color: AppColors.baseBlackColor,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: MyButtonWidget(
            text: "Sign up",
            color: AppColors.baseBlackColor,
            onPress: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SignupScreen(),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.baseDarkPinkColor,
                AppColors.baseBlackColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "E-Commerce App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopPart(context: context), // ✅ Fixed: Passing required context
                  SizedBox(height: 30),
                  buildBottomPart(context: context), // ✅ Fixed: Passing required context
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
