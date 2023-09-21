import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 66,
        right: 66,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Hello, ', style: AppTextStyle.whiteS18),
                TextSpan(text: 'Kullhi', style: AppTextStyle.whiteS18Bold),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppSVGs.icNoti,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}
