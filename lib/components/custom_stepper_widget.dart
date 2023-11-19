import 'package:bashakam_barawzanko/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final void Function()? onDecrease;
  final void Function()? onIncrease;
  final void Function()? onReset;

  const CustomStepper({
    Key? key,
    required this.onDecrease,
    required this.onIncrease,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconSize =
        Constants.getDeviceType() == Constants.tabletSize ? 26 : 20;
    return Container(
      height: Constants.getDeviceType() == Constants.tabletSize ? 45 : 36,
      width: Constants.getDeviceType() == Constants.tabletSize ? 120 : 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onIncrease,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.add,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            width: 1.5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              // color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onReset,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.arrow_clockwise,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(
            width: 1.5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              // color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: onDecrease,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.minus,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
