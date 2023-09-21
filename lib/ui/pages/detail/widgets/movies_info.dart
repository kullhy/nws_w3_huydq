import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';

class MoviesInfo extends StatelessWidget {
  const MoviesInfo({
    super.key,
    required this.genres,
    required this.r,
    required this.imdb,
  });
  final String genres;
  final String r;
  final String imdb;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                infoItem(genres),
                const SizedBox(
                  width: 5,
                ),
                infoItem(r),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 70,
                  height: 23,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color(0xfff5c518)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AppSVGs.icImdb,
                          height: 23,
                          width: 25,
                        ),
                        Text(
                          imdb,
                          style: AppTextStyle.blackS12Bold,
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(
          AppSVGs.isShare,
          width: 24,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          AppSVGs.icFavorite,
          width: 24,
        )
      ],
    );
  }
}

Container infoItem(String content) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0x40a6a0df), Color(0x40a0f2fd)],
        )),
    child: Center(
      child: Text(
        content,
        style: AppTextStyle.whiteS12Bold,
      ),
    ),
  );
}
