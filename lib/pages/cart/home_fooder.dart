import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:foodie_flutter/components/app_dialog.dart';
import 'package:foodie_flutter/components/appbar/appbar_foodie.dart';
import 'package:foodie_flutter/models/food_model.dart';
import 'package:foodie_flutter/pages/cart/widget/delivery_time.dart';
import 'package:foodie_flutter/pages/cart/widget/food_item.dart';

class HomeFood extends StatefulWidget {
  const HomeFood({
    super.key,
  });

  @override
  State<HomeFood> createState() => _HomeFoodState();
}

class _HomeFoodState extends State<HomeFood> {
  // @override
  // void initState() {
  //   super.initState();
  //   // đổi màu
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //     ),
  //   );
  // }

  double sum = 0.0;
  double SumTotal() {
    sum = 0.0;
    for (FoodModel food in foods) {
      sum += food.total;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        // leftPressed: () =>
        //     SystemChannels.platform.invokeMethod("SystemNavigator.top"),
        leftPressed: () => AppDialog.dialog(
          context,
          title: '😍',
          content: 'Do you want to exit app?',
          action: () =>
              SystemChannels.platform.invokeMethod("SystemNavigator.top"),
        ),
        title: 'Card',
        // color: Colors.yellow,
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 12.0, bottom: 20.0),
          child: Column(
            children: [
              // làm text thay đổi màu
              // Shimmer.fromColors(
              //   baseColor: Colors.red,
              //   highlightColor: Colors.yellow,
              //   child: const Center(
              //     child: Text(
              //       'Foodies',
              //       style: TextStyle(
              //         color: Colors.red,
              //         fontSize: 28.0,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),

              // ...List.generate(foods.length, (index) {
              //   final food = foods[index];
              //   return Padding(
              //     padding: const EdgeInsets.only(
              //       bottom: 20.0,
              //     ),
              //     child: FoodItem(
              //       food,
              //       onAdd: () => setState(
              //           () => food.quantity = (food.quantity ?? 0) + 1),
              //       onRemove: () => setState(
              //           () => food.quantity = (food.quantity ?? 0) - 1),
              //       onDelete: () => setState(
              //           () => foods.removeWhere((e) => e.id == food.id)),
              //     ),
              //   );
              // }),
              ListView.separated(
                //khóa cuộn
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                // padding: const EdgeInsets.symmetric(horizontal: 20.0)
                //     .copyWith(top: 12.0),
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return FoodItem(
                    food,
                    onAdd: () {
                      setState(() {
                        if (food.quantity == null) {
                          food.quantity = 1;
                        } else if ((food.quantity ?? 0) < 10) {
                          food.quantity = (food.quantity ?? 0) + 1;
                        } else {
                          AppDialog.dialog(context,
                              title: '😨',
                              content:
                                  'Bạn đã tăng số lượng món quá quy định!!!');
                        }
                      });
                    },
                    onRemove: () => setState(() {
                      if (food.quantity == null || (food.quantity ?? 0) <= 1) {
                        AppDialog.dialog(context,
                            title: '😨',
                            content:
                                'Bạn có muốn xóa món ${food.name} này ko!!',
                            action: () => setState(() =>
                                foods.removeWhere((e) => e.id == food.id)));
                        // foods.removeWhere((e) => e.id == food.id);
                      } else {
                        food.quantity = (food.quantity ?? 0) - 1;
                      }
                    }),
                    onDelete: () => AppDialog.dialog(context,
                        title: '😨',
                        content: 'Bạn có muốn xóa món ${food.name} này ko!!',
                        action: () => setState(
                            () => foods.removeWhere((e) => e.id == food.id))),
                  );
                },
                // ngăn cách giữa các item
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20.0,
                ),
                // đếm các item
                itemCount: foods.length,
              ),
              const SizedBox(
                height: 20.0,
              ),
              DeliveryTime(
                totalPrice: SumTotal(),
                minute: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
