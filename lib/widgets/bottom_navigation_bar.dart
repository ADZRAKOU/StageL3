import 'package:flutter/material.dart';
import 'package:masante228/screens/provider/page_provider.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/path_utils.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /* print(context.watch<PageProvider>().page); */
    return Container(
      height: 70,
      width: double.infinity,
      color: kWhiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...bottonNavigationBarData.map((e) => GestureDetector(
                onTap: () {
                  context
                      .read<PageProvider>()
                      .setPageInArborescence(pageToSet: e["page"]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      width: 30,
                      decoration: BoxDecoration(
                          color: e["page"] == context.watch<PageProvider>().page
                              ? kPrimaryColor
                              : null,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          kImagePath(imageName: e["icon"]),
                          height: 30,
                          color: e["page"] == context.watch<PageProvider>().page
                              ? kPrimaryColor
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
