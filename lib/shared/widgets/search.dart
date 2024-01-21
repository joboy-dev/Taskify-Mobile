import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:taskify/shared/utils/animations.dart';
import 'package:taskify/shared/widgets/textfield.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(
          hintText: 'Search', 
          onChanged: (value) {
            setState(() {
              searchTerm = value!;
            });
          },
        ),

        
      ],
    ).animate(effects: MyEffects.fadeSlide());
  }
}