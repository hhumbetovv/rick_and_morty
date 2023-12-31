import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/text_styles.dart';
import 'app_inkwell.dart';

class NameSearch extends StatefulWidget {
  const NameSearch({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  final void Function(String) onSearch;

  @override
  State<NameSearch> createState() => _NameSearchState();
}

class _NameSearchState extends State<NameSearch> {
  late final TextEditingController _controller;
  late final FocusNode _node;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _node = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _node,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  label: Text(l10n.searchByName),
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            AppInkWell(
              onTap: () {
                _node.unfocus();
                widget.onSearch(_controller.text);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.search,
                  style: TextStyles.labelStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
