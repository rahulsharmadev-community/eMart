import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:repositories/repositories.dart';
import 'package:shared/models.dart';
import 'package:shopping/core/blocs/primary_user_bloc/primary_user_bloc.dart';
import 'package:shopping/modules/screens/search_screen/bloc/keyword_bloc.dart';
import 'package:ico/ico.dart';
import 'package:shopping/utility/routes/app_routes.dart';

class SearchKeywordScreen extends StatelessWidget {
  final String? initalText;
  final String? hintText;
  final Widget? whenEmpty;
  final Widget? whenNotFound;
  const SearchKeywordScreen({
    super.key,
    this.initalText,
    this.hintText,
    required this.whenEmpty,
    required this.whenNotFound,
  });

  onDone(String keyword, BuildContext context) {
    var keywords = [keyword];
    context.read<PrimaryUserBloc>().add(AddSuggestionKeywordsEvent(keywords));
    AppRoutes.ProductQueryScreen.goNamed(extra: KeywordQuery(keywords));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KeywordBloc(context.read<KeywordsRepository>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: JTextField(
                inital: initalText,
                hintText: hintText,
                prefixIcon: const Icon(Ico.search_outline),
                onSubmitted: (_) => {},
                onChange: (text) {
                  context.read<KeywordBloc>().add(SearchTextChanged(text));
                }),
          ),
          body: BlocBuilder<KeywordBloc, SearchState>(
            builder: (context, state) {
              switch (state) {
                case SearchStateEmpty _:
                  return whenEmpty ?? textWidget('i am waiting');
                case SearchStateLoading _:
                  return loadingWidget();
                case SearchStateSuccess _:
                  return state.keywords.isEmpty
                      ? whenEmpty ?? textWidget('Not Found!')
                      : displaySearchResults(state.keywords);
                default:
                  return const Placeholder();
              }
            },
          ),
        );
      }),
    );
  }

  Widget loadingWidget() {
    return const CircularProgressIndicator().align.center();
  }

  Center textWidget(String text) => Center(
        child: Text(text),
      );

  displaySearchResults(Keywords keywords) {
    return ListView.builder(
      itemCount: keywords.length,
      itemBuilder: (context, i) {
        var keyword = keywords[i];
        var leading = keyword.image != null ? Image.network(keyword.image!) : const Icon(Ico.search_outline);
        return ListTile(
          onTap: () => onDone(keyword.codeWord, context),
          leading: leading.squareBox(32),
          title: Text(keyword.label),
        );
      },
    );
  }
}
