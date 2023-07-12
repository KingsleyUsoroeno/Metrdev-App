import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrdev_app/features/dashboard/data/model/coin.dart';
import 'package:metrdev_app/util/app_colors.dart';

class CoinItem extends StatelessWidget {
  final Coin coin;

  const CoinItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, top: 10),
      width: 116,
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.blueAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: coin.iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(child: SvgPicture.asset(coin.iconName)),
          ),
          const SizedBox(height: 12),
          Text(
            coin.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14.0),
          ),
          Text(
            coin.percent.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
