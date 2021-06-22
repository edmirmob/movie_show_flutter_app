import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SearchField extends StatefulWidget {
  final String initialValue;
  final String hint;
  final void Function(String value) onChanged;
  final TextEditingController controller;

  SearchField({
    @required this.initialValue,
    @required this.hint,
    @required this.onChanged,
    this.controller,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _searchController = BehaviorSubject<String>();
  StreamSubscription _searchSubscription;
  FocusNode focusSearch = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchSubscription = _searchController
        .distinct()
        .debounceTime(
          Duration(milliseconds: 1000),
        )
        .listen(
          (value) => widget.onChanged(value),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.close();
    _searchSubscription.cancel();
  }

  clearTextInput() {
    widget.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        initialValue: widget.initialValue,
        autofocus: true,
        onChanged: (String value) {
          _searchController.add(value);
        },
        controller: widget.controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide.none,
          ),
          errorBorder: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 26,
            color: Color(0xff20365D),
          ),
          filled: true,
          fillColor: Color.fromRGBO(228, 228, 229, 1),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: Color(0xff20365D),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
    );
  }
}
