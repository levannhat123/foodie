import 'package:flutter/material.dart';

import 'package:foodie_flutter/components/app_box_shadow.dart';
import 'package:foodie_flutter/components/button/app_elevated_button.dart';
import 'package:foodie_flutter/pages/payment/payment_page.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key, this.minute, required this.totalPrice});

  final int? minute;
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: AppBoxShadow.boxShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Text(
                'Delivery Time',
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              const Spacer(),
              Image.asset(
                'assets/img/clock.jpg',
                width: 26.0,
              ),
              Text(' ${minute ?? '-:-'} mins',
                  style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text('Total Price',
              style: TextStyle(color: Colors.brown, fontSize: 20.0)
              // textAlign: TextAlign.left,
              ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const Text(
                '\$ ',
                style: TextStyle(color: Colors.orange, fontSize: 24.0),
              ),
              Text(
                totalPrice.toStringAsFixed(1),
                style: const TextStyle(fontSize: 26.0),
              ),
              const Spacer(),
              AppElevatedButton.small(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    )),
                text: 'Place Order',
              )
            ],
          )
        ],
      ),
    );
  }
}
