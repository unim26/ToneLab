import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MyCicularSlider extends StatefulWidget {
  const MyCicularSlider({
    super.key,
    required this.notation,
    required this.title,
    required this.fontsize,
    required this.minvalue,
    required this.maxvalue,
    required this.initialValue,
    required this.onChange,
  });

  final String title;
  final String notation;
  final double fontsize;
  final double minvalue;
  final double maxvalue;
  final double initialValue;
  final void Function(double) onChange;

  @override
  State<MyCicularSlider> createState() => _MyCicularSliderState();
}

class _MyCicularSliderState extends State<MyCicularSlider> {
  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: widget.minvalue,
      max: widget.maxvalue,
      appearance: CircularSliderAppearance(
        customColors: CustomSliderColors(
          trackColor: Colors.yellow.shade700,
          progressBarColor: Colors.brown,
          hideShadow: true,
        ),
        infoProperties: InfoProperties(
          bottomLabelText: "Volume",
        ),
      ),
      innerWidget: (percentage) {
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: widget.fontsize * .06,
              ),
              Text(
                percentage >= 10000
                    ? "${percentage.toStringAsFixed(0)} ${widget.notation}"
                    : "${percentage.toStringAsFixed(2)} ${widget.notation}",
                style: TextStyle(
                  fontSize: widget.fontsize * .03,
                  color: Colors.yellow.shade700,
                ),
              ),

              //title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: widget.fontsize * .03,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        );
      },
      initialValue: widget.initialValue,
      onChange: widget.onChange,
    );
  }
}
