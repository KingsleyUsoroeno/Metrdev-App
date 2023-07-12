import 'dart:ui';

import 'package:metrdev_app/util/app_colors.dart';

class Coin {
  final String iconName;
  final String name;
  final double percent;
  final Color iconBackgroundColor;

  Coin({
    required this.iconName,
    required this.name,
    required this.percent,
    required this.iconBackgroundColor,
  });
}

final availableCoins = <Coin>[
  Coin(
    iconName: "assets/images/svg/bitcoin_outline.svg",
    name: "BTCUSDT",
    percent: 36.75,
    iconBackgroundColor: AppColors.backgroundColor,
  ),
  Coin(
    iconName: "assets/images/svg/etherum_outline.svg",
    name: "ETHUSDT",
    percent: 23.45,
    iconBackgroundColor: AppColors.backgroundColor,
  ),
  Coin(
    iconName: "assets/images/svg/bnb_usdt_outline.svg",
    name: "BNBUSDT",
    percent: 34.56,
    iconBackgroundColor: const Color(0xFFF3BA2F).withOpacity(0.2),
  ),
  Coin(
    iconName: "assets/images/svg/etherum_outline.svg",
    name: "ETHUSDT",
    percent: 50.66,
    iconBackgroundColor: AppColors.backgroundColor,
  ),
  Coin(
    iconName: "assets/images/svg/bitcoin_outline.svg",
    name: "BTCUSDT",
    percent: 44.11,
    iconBackgroundColor: AppColors.backgroundColor,
  ),
];
