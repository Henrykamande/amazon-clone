import 'package:amazon_clone/features/account/widgets/accounts_buttons.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
              text: "Your Orders",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onTap: () {},
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () {},
            ),
            AccountButton(
              text: "Your Wish List",
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}
