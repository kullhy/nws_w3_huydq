import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nws_w3_huydq/common/app_text_styles.dart';
import 'package:nws_w3_huydq/configs/app_configs.dart';
import 'package:nws_w3_huydq/models/actor.dart';

class ListActorWidget extends StatefulWidget {
  const ListActorWidget({super.key, required this.actors});

  final List<Actor> actors;

  @override
  State<ListActorWidget> createState() => _ListActorWidgetState();
}

class _ListActorWidgetState extends State<ListActorWidget> {
  bool isShowAll = false;
  List<Actor> actorsShow = [];
  List<Actor> takeFirstN<Actor>(List<Actor> list, int n) {
    if (n >= list.length) {
      return List<Actor>.from(
          list); // Trả về toàn bộ danh sách nếu n lớn hơn hoặc bằng chiều dài của danh sách.
    } else {
      return list.sublist(
          0, n); // Trả về danh sách con chứa n phần tử đầu tiên.
    }
  }

  @override
  void initState() {
    setState(() {
      actorsShow = takeFirstN(widget.actors, 4);
      log(actorsShow[0].fullName);
    });
    super.initState();
  }

  void showAll() {
    setState(() {
      isShowAll = !isShowAll;
      if (isShowAll) {
        actorsShow = widget.actors;
      } else {
        actorsShow = takeFirstN(widget.actors, 4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cast",
              style: AppTextStyle.whiteS18Bold,
            ),
            InkWell(
              onTap: () {
                showAll();
              },
              child: Text(
                isShowAll ? "See Less" : "See All",
                style: AppTextStyle.whiteS12Bold,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: actorsShow.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 0.7),
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    // margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(MovieAPIConfig.imageLink +
                                actorsShow[index].image),
                            fit: BoxFit.cover)),
                  ),
                  FittedBox(
                    child: Text(
                      actorsShow[index].firstName,
                      style: AppTextStyle.whiteS8Bold,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      actorsShow[index].lastName,
                      style: AppTextStyle.whiteS8Bold,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      actorsShow[index].role,
                      style: AppTextStyle.whiteS8,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
