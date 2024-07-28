import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/debouncer.dart';
import '../bloc/search_articles_bloc.dart';
import '../bloc/search_articles_event.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const CustomSearchBar({super.key, required this.searchController});
  

  @override
  Widget build(BuildContext context) {
    Debouncer debouncer = Debouncer(duration: const Duration(milliseconds: 500));
    return TextFormField(
      onChanged: (value) {
        debouncer.run(() {
          context
              .read<SearchArticlesBloc>()
              .add(ChangeKeyWord(searchController.text.trim()));
          context.read<SearchArticlesBloc>().add(const GetSearchedArticles());
        });
      },
      onEditingComplete: () {
        if (searchController.text.trim().isNotEmpty) {
          context
              .read<SearchArticlesBloc>()
              .add(ChangeKeyWord(searchController.text.trim()));
          context.read<SearchArticlesBloc>().add(const GetSearchedArticles());
        } else {
          context.read<SearchArticlesBloc>().add(const ChangeKeyWord(''));
          context.read<SearchArticlesBloc>().add(const GetSearchedArticles());
        }
      },
      controller: searchController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: InkWell(
              onTap: () {
                if (searchController.text.trim().isNotEmpty) {
                  context
                      .read<SearchArticlesBloc>()
                      .add(ChangeKeyWord(searchController.text.trim()));
                  context
                      .read<SearchArticlesBloc>()
                      .add(const GetSearchedArticles());
                } else {
                  context
                      .read<SearchArticlesBloc>()
                      .add(const ChangeKeyWord(''));
                  context
                      .read<SearchArticlesBloc>()
                      .add(const GetSearchedArticles());
                }
              },
              child: const Icon(
                Icons.search_sharp,
                color: Colors.white,
              )),
          focusColor: Colors.grey.shade900,
          fillColor: Colors.grey.shade800,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: Colors.white24),
          )),
    );
  }
}
