import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSubmitted;
  const SearchBar({super.key, required this.onSubmitted});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
        rtl: true,
        color: Theme.of(context).primaryColor,
        width: 400,
        textController: TextEditingController(),
        onSuffixTap: () => null,
        onSubmitted: widget.onSubmitted);
  }
}
