import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:shopping/modules/screens/search_screen/bloc/keyword_bloc.dart';

class ProductQueryScreen extends StatelessWidget {
  final List<Queue>? query;
  final bool showSearchBar;
  final Function() onPop;
  const ProductQueryScreen({
    super.key,
    this.query,
    required this.showSearchBar,
    required this.onPop,
  });

  @override
  Widget build(BuildContext context) {
    final repository = KeywordsRepository(
      api: KeywordsApi(),
      cache: KeywordsCache(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KeywordBloc(repository),
        )
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: const Placeholder(),
      ),
    );
  }
}
