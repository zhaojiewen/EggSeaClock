import 'package:analog_clock/analog_clock.dart';
import 'package:analog_clock/clock_plate.dart';
import 'package:analog_clock/water_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';

import 'drawn_hand.dart';

class EggSeaClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    var radius = MediaQuery.of(context).size.width / 9;
    var width = 2 * radius + 1;
    return Stack(
      children: <Widget>[
        Center(
          child: SizedBox.expand(
            child: WaterSurface(color),
          ),
        ),
        Center(
          child: SizedBox.fromSize(
            size: Size(width, width),
            child: ClockPlate(radius, 1, color),
          ),
        ),
        Center(
          child: SizedBox.fromSize(
              size: Size(width / 2, width / 2), child: AnalogClock()),
        )
      ],
    );
  }
}
