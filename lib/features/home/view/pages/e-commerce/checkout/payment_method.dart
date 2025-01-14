
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/my_dropdown_field.dart';
import '../../../../widget/my_text_field.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  
  
  @override
  Widget build(BuildContext context) {
  late ColorNotifier notifier;
  
  notifier = Provider.of(context,listen: true);
    
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          MyDropdownFormField(
            titletext: "Payment Card",
            hinttext: "Your card",
            items: const [
              "PayPal",
              "Stax",
              "Helcim",
              "Square",
              "Stripe",
            ],
            onChanged: (value) {},
          ),
          SizedBox(height: 15),
          MyTextFormField(
            titleText: "Card Number",
            labelText: "Your card number",
            hintText: "E.g. 3588XXXXXXXXX",
          ),
          SizedBox(height: 15),
          MyTextFormField(
            titleText: "Expiration Date",
            labelText: "Expiration date",
            hintText: "E.g. MM/YY",
          ),
          SizedBox(height: 15),
          MyTextFormField(
            titleText: "Security Code",
            labelText: "Security Code",
            hintText: "E.g. CVV",
          ),
        ],
      ),
    );
  }
}
