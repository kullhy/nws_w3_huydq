import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_w3_huydq/blocs/bottom_navigator/bottom_bar_cubit.dart';
import 'package:nws_w3_huydq/common/app_colors.dart';
import 'package:nws_w3_huydq/common/app_svgs.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';

Widget createBottomNavigationBar() {
  return Container(
    decoration: const BoxDecoration(gradient: AppColors.backgroundGadient),
    child: Container(
      // height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            const Color(0xff6B66A6).withOpacity(0.3),
            const Color(0xff75D1DD).withOpacity(0.3)
          ],
        ),
      ),
      child: BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, state) {
        if (state.loadDataStatus == LoadStatus.success) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            currentIndex: state.curIndex,
            onTap: (index) {
              BlocProvider.of<BottomBarCubit>(context).changeIndex(index);
            },
            showUnselectedLabels: false,
            backgroundColor:
                const Color.fromARGB(0, 255, 255, 255).withOpacity(0.1),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Colors.white,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            items: [
              BottomNavigationBarItem(
                activeIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSVGs.icHome,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(top: 4, left: 3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                icon: SvgPicture.asset(
                  AppSVGs.icHome,
                  // height: 50,
                  // width: 50,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                activeIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSVGs.icFavorite,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(top: 4, left: 3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                icon: SvgPicture.asset(AppSVGs.icFavorite),
                label: 'home',
              ),
              BottomNavigationBarItem(
                activeIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSVGs.icTicket,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(top: 4, left: 3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                icon: SvgPicture.asset(AppSVGs.icTicket),
                label: 'home',
              ),
              BottomNavigationBarItem(
                activeIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSVGs.icAccount,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(top: 4, left: 3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                icon: SvgPicture.asset(AppSVGs.icAccount),
                label: 'home',
              ),
              BottomNavigationBarItem(
                activeIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSVGs.icShuffle,
                    ),
                    Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(top: 4, left: 3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                icon: SvgPicture.asset(AppSVGs.icShuffle),
                label: 'home',
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    ),
  );
}
