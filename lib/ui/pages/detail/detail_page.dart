import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';
import 'package:nws_w3_huydq/configs/app_configs.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';
import 'package:nws_w3_huydq/models/movies.dart';
import 'package:nws_w3_huydq/ui/pages/detail/detail_cubit.dart';
import 'package:nws_w3_huydq/ui/pages/detail/widgets/list_actor.dart';
import 'package:nws_w3_huydq/ui/pages/detail/widgets/movies_info.dart';
import 'package:nws_w3_huydq/ui/widgets/bottom_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<DetailCubit>(context).loadInitialData(Movie(id: movie.id));

    return BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: createBottomNavigationBar(),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              state.loadDataStatus == LoadStatus.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Image.network(
                      MovieAPIConfig.imageLink + state.movie.poster,
                      height: 500,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              Positioned(
                  left: 50,
                  top: 50,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppSVGs.icBack))),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  minChildSize: 0.5,
                  maxChildSize: 1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                          width: size.height,
                          height: size.height,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff2b5876), Color(0xff4e4376)],
                              )),
                          child: state.loadDataStatus == LoadStatus.loading
                              ? Container(
                                  padding: const EdgeInsets.only(top: 100),
                                  alignment: Alignment.topCenter,
                                  child: const CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFDDEAFF),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 28,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        state.movie.name,
                                        style: AppTextStyle.whiteS64Bold,
                                      ),
                                    ),
                                    // Text(
                                    //   "The Dark Word",
                                    //   style: AppTextStyle.greyS16Bold,
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    MoviesInfo(
                                      genres: state.movie.genres,
                                      r: '16+',
                                      imdb: state.movie.imdb,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RichText(
                                        // maxLines: state.showMore?10:3,
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: state.showMore
                                            ? state.movie.overview
                                            : state.movie.overview.substring(
                                                0,
                                                int.parse((state.movie.overview
                                                            .length ~/
                                                        10 *
                                                        7)
                                                    .toString())),
                                        style: AppTextStyle.whiteS12,
                                      ),
                                      TextSpan(
                                          text: state.showMore
                                              ? "...Less"
                                              : "...More",
                                          style: AppTextStyle.blueS12,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              BlocProvider.of<DetailCubit>(
                                                      context)
                                                  .showMoreText();
                                            }),
                                    ])),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Expanded(
                                        child: ListActorWidget(
                                            actors: state.actors)),
                                  ]),
                                )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
