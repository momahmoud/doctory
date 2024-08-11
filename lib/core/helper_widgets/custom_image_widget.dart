import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';

class CustomPngImageWidget extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  const CustomPngImageWidget(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pngs/$imageName.png',
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}

class CustomGifImageWidget extends StatelessWidget {
  final String? imageName;
  final double? height;

  const CustomGifImageWidget({super.key, this.imageName, this.height});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.gif',
      height: height ?? 30.h,
    );
  }
}

class CustomSvgImage extends StatelessWidget {
  final String? imageName;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomSvgImage(
      {super.key,
      this.imageName,
      this.color,
      this.height,
      this.width,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svgs/$imageName.svg',
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: fit ?? BoxFit.contain,
    );
  }
}

class CustomSvgImageNetwork extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgImageNetwork(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageName!,
      color: color,
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.contain,

      // placeholderBuilder: (context) => const LoadingWidget(),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const CustomCachedNetworkImage(
      {super.key,
      this.imageName,
      this.height,
      this.width,
      this.color,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: imageName!,
      shimmerBackColor: ColorsManger.greyColor100,
      shimmerBaseColor: ColorsManger.greyColor100,
      shimmerHighlightColor: ColorsManger.greyColor50,
      height: height ?? 30.h,
      width: width ?? 30.w,
      boxFit: fit ?? BoxFit.contain,
      errorWidget: const Icon(Icons.error),
      color: color,
    );
  }
}
