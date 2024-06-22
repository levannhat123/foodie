import 'package:flutter/material.dart';
import 'package:foodie_flutter/components/app_box_shadow.dart';
import 'package:foodie_flutter/components/appbar/appbar_foodie.dart';
import 'package:foodie_flutter/components/button/app_btn.dart';
import 'package:foodie_flutter/gen/assets.gen.dart';
import 'package:foodie_flutter/models/payment_method_model.dart';
import 'package:foodie_flutter/pages/cart/home_fooder.dart';

class PaymetMethod extends StatefulWidget {
  const PaymetMethod({super.key});

  @override
  State<PaymetMethod> createState() => _PaymetMethodState();
}

class _PaymetMethodState extends State<PaymetMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FoodieAppBar(title: 'Payment Mehthod'),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 130.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(bottom: 20.0, top: 30.0),
                itemBuilder: (context, index) {
                  final paymentMethod = paymentMethods[index];
                  return _paymentMethod(
                    paymentMethod,
                    ontap: () {
                      for (var element in paymentMethods) {
                        element.isSelected = false;
                        paymentMethod.isSelected = true;
                        setState(() {});
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: paymentMethods.length,
              ),
            ),
            Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 60.0,
              child: AppElevatedButton(
                text: 'Next',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeFood(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
            )
          ],
        ));
  }

  Widget _paymentMethod(PaymentMethodModel paymentMethod, {Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0)
            .copyWith(left: 20.0, right: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: AppBoxShadow.boxShadow),
        child: Row(
          children: [
            Expanded(
              child: Text(paymentMethod.name ?? '-:-'),
            ),
            Image.asset(
              paymentMethod.isSelected == true
                  ? Assets.images.radioButtonOn.path
                  : Assets.images.radioButtonOff.path,
              width: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
