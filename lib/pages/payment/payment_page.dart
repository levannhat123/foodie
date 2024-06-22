import 'package:flutter/material.dart';
import '../../components/app_bar/foodie_app_bar.dart';
import '../../components/app_box_shadow.dart';
import 'address_page.dart';
import 'payment_method_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => Navigator.of(context).pop(),
        title: 'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0)
            .copyWith(top: 40.0, bottom: 20.0),
        child: Column(
          children: [
            _paymentItem(
              'Choose Address',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const AddressPage()),
                ),
              ),
            ),
            const SizedBox(height: 22.0),
            _paymentItem(
              'Payment Method',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PaymentMethodPage()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentItem(String text, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0)
            .copyWith(left: 20.0, right: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: const TextStyle(fontSize: 16.0)),
            const Icon(Icons.navigate_next, size: 26.0),
          ],
        ),
      ),
    );
  }
}
