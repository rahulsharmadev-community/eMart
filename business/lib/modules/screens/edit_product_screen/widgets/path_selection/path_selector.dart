// ignore_for_file: unused_import

import 'package:business/modules/screens/edit_product_screen/widgets/path_selection/cubits/content_cubit/content_cubit.dart';
import 'package:business/modules/screens/edit_product_screen/widgets/path_selection/cubits/path_cubit/path_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jars/jars.dart';
import 'package:shared_repositories/b.repositories.dart';

import '../../models/product_categories.dart';
import 'package:flutter/material.dart';
import 'package:jars/jars_core.dart';
import 'package:jars/logger.dart';

class CategoryDialog extends StatelessWidget {
  const CategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PathCubit()),
        BlocProvider(
          create: (context) => ContentCubit(
            context.read<PathCubit>(),
            CategoriesRepository().getByPath,
          ),
        ),
      ],
      child: _FormBuilder(),
    );
  }
}

class _FormBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: SizedBox(
          width: 500,
          height: 600,
          child: Column(
            children: [
              PathWidget(),
              Expanded(child: ContentWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentCubit, ContentState>(
      builder: (context, state) {
        switch (state) {
          case ContentLoading _:
            return const CircularProgressIndicator();
          case ContentLoaded _:
            var list = buildTile(state.expendable, state.selectable);
            return ListView.builder(itemCount: list.length, itemBuilder: (ctx, i) => list[i]);
          default:
            return Text((state as ContentError).exception.toString());
        }
      },
    );
  }

  List<Widget> buildTile(List<String> expendable, List<String> selectable) {
    return [
      ...expendable.map((e) {
        return ListTile(
          title: Text(e),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => context.read<PathCubit>().addPath(e),
        );
      }),
      ...selectable.map((e) {
        return RadioListTile(
          title: Text(e),
          value: e,
          groupValue: groupValue,
          onChanged: (value) => setState(() => groupValue = value),
        );
      })
    ];
  }
}

class PathWidget extends StatelessWidget {
  const PathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: BlocBuilder<PathCubit, PathState>(
        builder: (context, path) {
          return ListView.separated(
            itemCount: path.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, i) => const Icon(Icons.keyboard_arrow_right),
            itemBuilder: (context, i) {
              var value = path[i];
              return TextButton(
                child: Text(value),
                onPressed: () => context.read<PathCubit>().removePath(value),
              );
            },
          );
        },
      ),
    );
  }
}
