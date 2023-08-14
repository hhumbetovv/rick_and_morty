import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: isLoading ? 40 : null,
        child: isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[50],
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                ),
                child: const Text(
                  "loadMore",
                  style: TextStyles.loadMoreStyle,
                ).tr(),
              ),
      ),
    );
  }
}
