// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:bloc/bloc.dart';
import 'package:shared/models.dart';
import 'package:jars/jars.dart';

class ProductsCubit extends Cubit<BlocState<List<Product>>> {
  ProductsCubit() : super(const BlocStateLoading());
}
