import 'package:eng_app_v2/models/popular_model.dart';
import 'package:eng_app_v2/pages/setupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  List<PopularDietsModel> popularDiets = PopularDietsModel.getPopularDiets();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        Center(
          child: GestureDetector(
              onTap: () {

                Navigator.pushNamed(context, "/sell");

              },
              child: Icon(Icons.add, size: 70, color: Colors.grey)),
        ),
        const SizedBox(height: 15),
        _section("Recent Orders"),
        const SizedBox(height: 15),
        _section("Recently Sold"),
        const SizedBox(height: 15),
        _section("Past Orders"),
      ],
    );
  }

  Column _section(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      ListView.separated(
        itemCount: popularDiets.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
                color: popularDiets[index].boxIsSelected
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popularDiets[index].boxIsSelected
                    ? [
                        BoxShadow(
                            color: const Color(0xff1D1617).withOpacity(0.07),
                            offset: const Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0)
                      ]
                    : []),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  popularDiets[index].iconPath,
                  width: 65,
                  height: 65,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularDiets[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    Text(
                      '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                      style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.radio_button_checked),
                )
              ],
            ),
          );
        },
      )
    ]);
  }
}
