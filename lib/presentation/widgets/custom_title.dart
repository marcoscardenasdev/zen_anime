import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback? onPressed;
  const CustomTitle({super.key, this.title, this.subTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null) Text(title!),
        const Spacer(),
        if (subTitle != null)
          TextButton(onPressed: onPressed, child: Text(subTitle!)),
      ],
    );
  }
}
