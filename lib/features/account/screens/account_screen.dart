import 'package:amazon_clone/constrains/global_variables.dart';
import 'package:amazon_clone/features/account/widgets/0rders.dart';
import 'package:amazon_clone/features/account/widgets/below_app_bar.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';

import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage(
                        'assets/images/amazon_in.png',
                      ),
                      width: 160,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.notifications_outlined),
                        Icon(
                          Icons.search,
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: Column(children: const [
        BelowAppBar(),
        SizedBox(
          height: 10.0,
        ),
        TopButtons(),
        SizedBox(
          height: 15,
        ),
        Orders(),
      ]),
    );
  }
}
