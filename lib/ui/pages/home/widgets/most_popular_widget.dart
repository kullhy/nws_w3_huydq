import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';
import 'package:nws_w3_huydq/ui/pages/detail/detail_page.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/scroll_circle.dart';

import '../home_cubit.dart';

class MostPopularWidget extends StatefulWidget {
  const MostPopularWidget({super.key});

  @override
  State<MostPopularWidget> createState() => _MostPopularWidgetState();
}

// List<Movie> movies = [
//   Movie(name: "Deadpool 1", images: AppImages.deadpoolImage, imdb: "8.45"),
//   Movie(name: "Deadpool 2", images: AppImages.deadpoolImage, imdb: "7.68"),
//   Movie(name: "Deadpool 3", images: AppImages.deadpoolImage, imdb: "8.96"),
// ];
List<EdgeInsets> pageMargins = [
  const EdgeInsets.only(top: 10), // Page 0
  const EdgeInsets.only(top: 0), // Page 1
  const EdgeInsets.only(top: 10), // Page 2
];

void setSize() {}

class _MostPopularWidgetState extends State<MostPopularWidget> {
  int curr = 1;
  PageController controller =
      PageController(viewportFraction: 0.8, initialPage: 1);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        curr = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.loadDataStatus == LoadStatus.success) {
        final movies = state.popularMovies;
        return Column(
          children: [
            SizedBox(
              height: 145,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: state.popularMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final double marginValue =
                      (index - curr).abs() == 1 ? 10.0 : 0.0;
                  // final bool isCurrentPage = index == curr;
                  return InkWell(
                    onTap: () {
                      log(index.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  movie: movies[index],
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: marginValue, bottom: marginValue),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${movies[index].images}"),
                                fit: BoxFit.cover,
                              ),
                              gradient: AppColors.mostPopular,
                            ),
                            child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: AppColors.mostPopular,
                                ),
                              ),
                              Positioned(
                                left: 26,
                                right: 26,
                                bottom: 15,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        movies[index].name,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.whiteS18Bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 45,
                                      height: 14,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xfff5c518)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SvgPicture.asset(
                                              AppSVGs.icImdb,
                                              height: 14,
                                              width: 18,
                                            ),
                                            Text(
                                              movies[index].imdb,
                                              style: AppTextStyle.blackS6Bold,
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              curr != index
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          top: 0, bottom: 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: const Color.fromARGB(
                                            45, 255, 255, 255),
                                      ))
                                  : Container(),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ScrollCircle(
              currentPage: curr,
              length: state.popularMovies.length,
            )
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
