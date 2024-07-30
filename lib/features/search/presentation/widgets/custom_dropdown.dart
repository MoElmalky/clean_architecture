import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_articles_bloc.dart';
import '../bloc/search_articles_event.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  const CustomDropdown({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SearchArticlesBloc>();
    String selectedCategory = bloc.params['category'];
    return DropdownButton<String>(
        value: selectedCategory,
        items: items
            .map((value) => DropdownMenuItem<String>(
                value: value,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(value),
                    const Divider()
                  ],
                )))
            .toList(),
        onChanged: (value) {
          bloc.add(ChangeCategory(value!));
          bloc.add(const GetSearchedArticles());
        });
  }
}
