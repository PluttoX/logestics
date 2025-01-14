
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    this.showPaymentMethod,
  });

  final bool? showPaymentMethod;

  @override
  Widget build(BuildContext context) {
    late ColorNotifier notifier;

    List description = [
      "Grand Total",
      "Discount",
      "Tax",
      "Subtotal",
      "Shipping Charge",
      "Coupon Charge",
      "Total",
    ];

    List price = [
      "1,105.00",
      "105.00",
      "75.00",
      "1,000.00",
      "80.00",
      "20.00",
      "900.00",
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Container(
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Order Summary",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: notifier.text,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            decoration: BoxDecoration(color: notifier.tablehader),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
                Text(
                  "Price",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            itemCount: description.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${description[index]} :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: "Outfit",
                      fontSize: 14,
                      color: index == 3 || index == 6
                          ? notifier.text
                          : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "\$${price[index]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: "Outfit",
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: StyledDivider(
                  color: notifier.getfillborder,
                  lineStyle: DividerLineStyle.dashed,
                ),
              );
            },
          ),
          showPaymentMethod == null ? Container() : SizedBox(height: 20),
          showPaymentMethod == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    showPaymentMethod == true ? "Payment Method" : "Add A Note",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: notifier.text,
                    ),
                  ),
                ),
          showPaymentMethod == true || showPaymentMethod == null
              ? Container()
              : SizedBox(height: 15),
          showPaymentMethod == null
              ? Container()
              : showPaymentMethod == true
                  ? ListTile(
                      leading: Image.asset("assets/images/master-card.png"),
                      title: Text(
                        "Payment",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: notifier.text,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "Via MasterCard",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Text(
                        "\$900.00",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: notifier.getfillborder,
                        ),
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: notifier.text
                        ),
                        cursorColor: Color(0xFF0f79f3),
                        maxLines: 5,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "E.g.it markes me feel...",
                          hintStyle: TextStyle(
                            fontFamily: "Outfit",
                            color: notifier.text,
                          ),
                          labelText: "Write here...",
                          labelStyle: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff0165FC),
                            fontFamily: "Outfit",
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF0f79f3),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
          showPaymentMethod == true || showPaymentMethod == null
              ? Container()
              : SizedBox(height: 15),
          showPaymentMethod == true || showPaymentMethod == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    text: "Proceed To Checkout",
                    onPressed: () {},
                    bgcolor: Color(0xFF0f79f3),
                  ),
                ),
        ],
      ),
    );
  }
}
