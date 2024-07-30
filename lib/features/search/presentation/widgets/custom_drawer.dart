import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_articles_bloc.dart';
import '../bloc/search_articles_event.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> countries = const {
      'USA': 'us',
      'Egypt': 'eg',
      'UAE': 'ae',
      'Australia': 'au',
      'Canada': 'ca',
      'Germany': 'de',
      'Spain': 'es',
      'France': 'fr',
      'Morocco': 'ma',
      'Mexico': 'mx',
      'Russia': 'ru',
      'Saudi Arabia': 'sa',
    };
    return Drawer(
      child: ListView(
        children: [
          ...countries.entries.map((entry) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(entry.key),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Checkbox(
                          value: context
                                  .read<SearchArticlesBloc>()
                                  .params['country'] ==
                              entry.value,
                          onChanged: (value) {
                            context.read<SearchArticlesBloc>().add(ChangeCountry(entry.value));
                            context.read<SearchArticlesBloc>().add(const GetSearchedArticles());
                          }),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
