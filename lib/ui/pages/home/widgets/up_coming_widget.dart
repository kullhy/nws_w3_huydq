import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';
import 'package:nws_w3_huydq/ui/pages/detail/detail_page.dart';
import 'package:nws_w3_huydq/ui/pages/home/home_cubit.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/scroll_circle.dart';

class UpComingWidget extends StatefulWidget {
  const UpComingWidget({super.key});

  @override
  State<UpComingWidget> createState() => _UpComingWidgetState();
}

// List<Movie> movies = [
//   Movie(name: "FreeDom", images: AppImages.freedomImage, imdb: "8.45"),
//   Movie(
//       name: "Project Power", images: AppImages.projectPowerImage, imdb: "8.45"),
//   Movie(name: "Merrick", images: AppImages.merrickImage, imdb: "8.45"),
// ];

class _UpComingWidgetState extends State<UpComingWidget> {
  int curr = 1;
  PageController controller =
      PageController(viewportFraction: 0.4, initialPage: 1);

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        curr = controller.page?.round() ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.loadDataStatus == LoadStatus.success) {
        final movies = state.upComingMovies;
        return Column(
          children: [
            SizedBox(
              height: 215,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            movie: movies[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${movies[index].poster}"),
                                fit: BoxFit.cover,
                              ),
                              gradient: AppColors.mostPopular,
                            ),
                          ),
                          index != curr
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(top: 0, bottom: 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xff64ABDB)
                                              .withOpacity(0.5),
                                          const Color(0xff826EC8).withOpacity(0.1)
                                        ],
                                        begin: index < curr
                                            ? Alignment.bottomLeft
                                            : Alignment.bottomRight,
                                        end: index < curr
                                            ? Alignment.topRight
                                            : Alignment.topLeft,
                                      )))
                              : Container()
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ScrollCircle(
              currentPage: curr,
              length: state.upComingMovies.length,
            ),
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
