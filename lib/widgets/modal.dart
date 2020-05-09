import 'package:flutter/material.dart';
import '../model/modaldata.dart';
import 'package:provider/provider.dart';

class ModalAreaController extends StatelessWidget {
  const ModalAreaController({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ModalData>(context);
    return Column(
      children: <Widget>[
        Text('offAxisFraction'),
        Slider(
          value: data.offAxisFraction,
          onChanged: data.changeOffAxis,
          min: -2,
          max: 2,
        ),
        Text('diameterRatio'),
        Slider(
          value: data.diameterRatio,
          onChanged: data.changeDiameter,
          min: 0.1,
          max: 10,
        ),
        Text('magnification'),
        Slider(
          value: data.magnification,
          onChanged: data.changeMagnification,
          min: 1,
          max: 3,
        ),
      ],
    );
  }
}
