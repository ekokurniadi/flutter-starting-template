import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instapos/core/constant/assets_constant.dart';
import 'package:instapos/core/styles/color_name_style.dart';
import 'package:instapos/core/styles/text_name_style.dart';

class LoginPageTablet extends StatefulWidget {
  const LoginPageTablet({super.key});

  @override
  State<LoginPageTablet> createState() => _LoginPageTabletState();
}

class _LoginPageTabletState extends State<LoginPageTablet> {
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstaColors.bg200,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsConstant.assetsLoginBgImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            32.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  AssetsConstant.assetsLoginImage,
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 32.w),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsConstant.svgAssetsLogoApp,
                      width: 176.w,
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: InstaColors.bg100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InstaTexts.getStyle(
                            text: 'Masuk',
                            typeName: TextTypeName.display2,
                            styleName: TextStyleName.bold,
                            color: InstaColors.text500,
                          ),
                          SizedBox(height: 16.h),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Username/Email/Nomor Hp',
                            ),
                          ),
                          SizedBox(height: 24.h),
                          ValueListenableBuilder<bool>(
                              valueListenable: _obscureText,
                              builder: (context, val, _) {
                                return TextFormField(
                                  obscureText: _obscureText.value,
                                  decoration: InputDecoration(
                                    hintText: 'Kata Sandi',
                                    suffixIcon: TextButton(
                                      onPressed: () {
                                        _obscureText.value =
                                            !_obscureText.value;
                                      },
                                      child: _obscureText.value
                                          ? Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: InstaColors.text500,
                                              size: 21.w,
                                            )
                                          : SvgPicture.asset(
                                              AssetsConstant.svgAssetsIconEye,
                                            ),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(height: 8.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Lupa Password ?'),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: InstaTexts.getStyle(
                                text: 'Masuk',
                                typeName: TextTypeName.buttonLarge,
                                styleName: TextStyleName.semiBold,
                                color: InstaColors.neutral50,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InstaTexts.getStyle(
                                  text: 'Belum punya akun ? ',
                                  typeName: TextTypeName.buttonMedium,
                                  styleName: TextStyleName.regular,
                                  color: InstaColors.text500,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {},
                                  child: const Text('Daftar Disini'),
                                ),
                              ],
                            ),
                          ),
                        ],
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
