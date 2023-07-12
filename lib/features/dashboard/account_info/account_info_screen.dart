import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrdev_app/features/dashboard/components/coin_item.dart';
import 'package:metrdev_app/features/dashboard/components/signal_group_and_bot_toogle.dart';
import 'package:metrdev_app/features/dashboard/data/model/coin.dart';
import 'package:metrdev_app/util/app_colors.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  Coin initialSelectedValue = availableCoins.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/smiley_face.jpeg"), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Jacobs",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Welcome back",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.appGrey),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/svg/ic_notification.svg"),
                iconSize: 28,
                color: Colors.white,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 26),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: RadialGradient(
                  tileMode: TileMode.repeated,
                  radius: 1.45,
                  center: Alignment.bottomCenter,
                  colors: [
                    AppColors.appYellow,
                    AppColors.backgroundColor.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wallet",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppColors.appGrey, fontWeight: FontWeight.w400),
                      ),
                      Container(
                        width: 140,
                        height: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: DropdownButton<Coin>(
                          underline: const SizedBox.shrink(),
                          value: initialSelectedValue,
                          isExpanded: true,
                          dropdownColor: AppColors.backgroundColor,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                          ),
                          items: availableCoins.map((Coin coin) {
                            return DropdownMenuItem(
                              value: coin,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: SvgPicture.asset(coin.iconName),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(coin.name.toLowerCase(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (Coin? newValue) {
                            setState(() {
                              initialSelectedValue = newValue!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Account Balance",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.appGrey, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$ 12 480.00",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Roboto',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 125,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: availableCoins.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CoinItem(coin: availableCoins[index]);
              },
            ),
          ),
          const SizedBox(height: 30),
          const SignalGroupAndBotToggle(),
        ],
      ),
    );
  }
}
