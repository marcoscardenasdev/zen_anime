import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const CustomTitle({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null) Text(title!),
        const Spacer(),
        if (subTitle != null)
          TextButton.icon(
            onPressed: null,
            label: Text(subTitle!),
            icon: Icon(Icons.arrow_right_outlined),
          ),
      ],
    );
  }
}
