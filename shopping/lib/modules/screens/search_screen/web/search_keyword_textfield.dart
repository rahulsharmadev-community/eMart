// ignore_for_file: no_wildcard_variable_uses

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ico/ico.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/repositories.dart';
import 'package:shared/models.dart' show Keyword;
import 'package:shopping/core/repository.dart';
import 'package:shopping/modules/screens/search_screen/bloc/keyword_bloc.dart';
import 'package:shopping/utility/routes/routes_initialise.dart';

class SearchKeywordTextField extends StatefulWidget {
  final String? hintText;
  const SearchKeywordTextField({
    super.key,
    this.hintText,
  });

  @override
  State<SearchKeywordTextField> createState() => _SearchKeywordTextFieldState();
}

class _SearchKeywordTextFieldState extends State<SearchKeywordTextField> {
  late TextEditingController controller;
  late ValueNotifier<List<DropdownMenuEntry<Keyword>>> options;

  late KeywordBloc bloc;

  @override
  void initState() {
    options = ValueNotifier([]);
    bloc = KeywordBloc(repository.keywords);
    controller = TextEditingController()..addListener(() => bloc.add(SearchTextChanged(controller.text)));
    super.initState();
  }

  @override
  void dispose() {
    options.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const menuStyle = MenuStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ))),
    );

    const inputDecorationTheme = InputDecorationTheme(
        border: InputBorder.none,
        activeIndicatorBorder: BorderSide.none,
        outlineBorder: BorderSide.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none);

    return BlocProvider.value(
        value: bloc,
        child: BlocListener<KeywordBloc, SearchState>(
          listener: updateValue,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ValueListenableBuilder(
                valueListenable: options,
                builder: (context, value, child) {
                  return DropdownMenu<Keyword>(
                    width: constraints.maxWidth,
                    hintText: 'Search Product',
                    controller: controller,
                    dropdownMenuEntries: value,
                    leadingIcon: const Icon(Ico.search_outline),
                    trailingIcon: const Icon(Icons.mic),
                    menuStyle: menuStyle,
                    inputDecorationTheme: inputDecorationTheme,
                    onSelected: onSelected,
                    selectedTrailingIcon: IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: controller.clear,
                    ),
                  );
                },
              );
            },
          ),
        ));
  }

  void onSelected(Keyword? value) {
    value.ifNotNull(
        def: null,
        callback: (_) {
          return context.pushNamed(AppRoutes.ProductQueryRoute.name, extra: KeywordQuery([_.label]));
        });
  }

  void updateValue(BuildContext context, SearchState state) {
    options.value = state.on(
        onInitial: [],
        onSuccess: (state) => state.data
            .map((e) => DropdownMenuEntry(
                value: e,
                label: e.label,
                leadingIcon: e.image.ifNotNull(
                        def: null,
                        callback: (img) {
                          return CachedNetworkImage(
                            imageUrl: img,
                            fit: BoxFit.cover,
                            width: kToolbarHeight,
                            height: kToolbarHeight,
                          );
                        }) ??
                    const Icon(Ico.search_outline)))
            .toList());
  }
}
