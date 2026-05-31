import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class LinearLoadingWidget extends StatelessWidget {
  const LinearLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: .only(bottom: 80.0),
        child: Align(
          alignment: .bottomCenter,
          child: SizedBox(
            width: 120.0,
            child: LinearProgressIndicator(
              borderRadius: .all(.circular(32.0)),
              color: Color(0xFF023c86),
            ),
          ),
        ),
      ),
    );
  }
}

@Preview(name: "Linear Loading Widget Preview")
Widget linearLoadingWidgetPreview() => Container(
  width: 100,
  height: 100,
  color: Colors.white,
  child: const Center(child: LinearLoadingWidget()),
);
