import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:opay_flutter/data/user_details.dart';
import 'package:opay_flutter/widget/advert_container.dart';
import 'package:opay_flutter/widget/app_bar.dart';
import 'package:opay_flutter/widget/home_details/home_card.dart';
import 'package:opay_flutter/widget/home_details/home_transactions_card.dart';
import 'package:opay_flutter/widget/transfer/transfer_history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              HomeCard(),
              AdvertWidget(),
              OtherTransaction(),
              AdvertWidget(),
              TransferHistoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
