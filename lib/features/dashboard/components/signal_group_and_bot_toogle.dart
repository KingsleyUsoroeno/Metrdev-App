import 'package:flutter/material.dart';
import 'package:metrdev_app/features/dashboard/components/bot_item.dart';
import 'package:metrdev_app/features/dashboard/data/model/bots.dart';

enum _ToggleType { signalGroup, bots }

class SignalGroupAndBotToggle extends StatefulWidget {
  const SignalGroupAndBotToggle({super.key});

  @override
  State<SignalGroupAndBotToggle> createState() => _SignalGroupAndBotToggleState();
}

class _SignalGroupAndBotToggleState extends State<SignalGroupAndBotToggle> {
  var _toggleType = _ToggleType.signalGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ItemContainer(
              isSignalGroup: true,
              text: "Signal Groups",
              isCurrentlySelected: _toggleType == _ToggleType.signalGroup,
              onTap: () => {
                setState(() {
                  _toggleType = _ToggleType.signalGroup;
                }),
              },
            ),
            const SizedBox(width: 20),
            _ItemContainer(
              isSignalGroup: false,
              text: "Bots",
              isCurrentlySelected: _toggleType == _ToggleType.bots,
              onTap: () => {
                setState(() {
                  _toggleType = _ToggleType.bots;
                }),
              },
            ),
          ],
        ),
        if (_toggleType == _ToggleType.signalGroup)
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text("Nothing here", style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white
            ),),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [...List.generate(bots.length, (index) => BotItem(bot: bots[index]))],
            ),
          )
      ],
    );
  }
}

class _ItemContainer extends StatelessWidget {
  final bool isSignalGroup;
  final String text;
  final VoidCallback? onTap;
  final bool isCurrentlySelected;

  const _ItemContainer({
    Key? key,
    required this.isSignalGroup,
    required this.text,
    this.onTap,
    required this.isCurrentlySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: isSignalGroup ? 150 : 110,
        height: 42,
        decoration: isCurrentlySelected
            ? BoxDecoration(color: const Color(0xFF213345), borderRadius: BorderRadius.circular(20))
            : null,
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
