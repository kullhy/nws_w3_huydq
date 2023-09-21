import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/film_category_widget.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/header_widget.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/most_popular_widget.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/search_bar_widget.dart';
import 'package:nws_w3_huydq/ui/pages/home/widgets/up_coming_widget.dart';
import 'package:nws_w3_huydq/ui/widgets/bottom_bar.dart';

import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).loadInitialData();
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: createBottomNavigationBar(),
      body: Container(
          padding: const EdgeInsets.only(top: 80),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGadient,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeaderWidget(),
                const SizedBox(
                  height: 20,
                ),
                const SearchBarWidget(),
                const SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text("Most Popular", style: AppTextStyle.whiteS18Bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const MostPopularWidget(),
                const SizedBox(
                  height: 20,
                ),
                const CategoryWidget(),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text("Upcoming releases",
                      style: AppTextStyle.whiteS18Bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const UpComingWidget(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )),
    );
  }
}
