import 'dart:math';

import 'package:flutter/material.dart';

class Seekbardata {
  final Duration postion;
  final Duration duration;

  Seekbardata(this.postion, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onchanged;

  final ValueChanged<Duration>? onchnagedend;
  const SeekBar(
      {super.key,
      required this.duration,
      required this.position,
      this.onchanged,
      this.onchnagedend});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragvalue;
  String _formationDuration(Duration duration) {
    // ignore: unnecessary_null_comparison
    if (duration == null) {
      return '--:--';
    } else {
      String minute = duration.inMinutes.toString().padLeft(2);

      String second = duration.inSeconds.remainder(60).toString().padLeft(2);
      return '$minute:$second';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formationDuration(widget.position)),
        Expanded(
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(
                    disabledThumbRadius: 4, enabledThumbRadius: 4),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                activeTickMarkColor: Colors.white,
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.white,
                overlayColor: Colors.white,
              ),
              child: Slider(
                min: 0.0,
                max: widget.duration.inMilliseconds.toDouble(),
                value: min(
                    _dragvalue ?? widget.position.inMilliseconds.toDouble(),
                    widget.duration.inMilliseconds.toDouble()),
                onChanged: (value) {
                  setState(() {
                    _dragvalue = value;
                  });
                  if (widget.onchanged != null) {
                    widget.onchanged!(Duration(milliseconds: value.round()));
                  }
                },
                onChangeEnd: (value) {
                  if (widget.onchnagedend != null) {
                    widget.onchnagedend!(Duration(milliseconds: value.round()));
                  }
                  _dragvalue = null;
                },
              )),
        ),
        Text(_formationDuration(widget.duration))
      ],
    );
  }
}
