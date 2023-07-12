import 'package:flutter/material.dart';
import 'package:metrdev_app/features/dashboard/data/model/bots.dart';
import 'package:metrdev_app/util/app_colors.dart';

class BotItem extends StatelessWidget {
  final Bots bot;

  const BotItem({Key? key, required this.bot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 75,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bot.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,
                  fontFamily: 'roboto'),
                ),
                const SizedBox(height: 5),
                Text(bot.distributionChannel,
                    style:
                        Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.appGrey)),
              ],
            ),
            Container(
              width: 70,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(bot.isActive ? 0xFF94FFCD : 0xFF8B8B8B).withOpacity(0.1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bot.isActive ? AppColors.activeGreen : AppColors.appGrey),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    bot.isActive ? "Active" : "Inactive",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: bot.isActive ? AppColors.activeGreen : AppColors.appGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
