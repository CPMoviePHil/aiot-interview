import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/product_info.dart';
import '../repository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  ProductsCubit({
    required ProductsRepository repository
  }) : _repository = repository, super(const ProductsInitialState());

  final ProductsRepository _repository;

  Future<void> load({String? keyword}) async {
    emit(const ProductsLoadingState());
    await Future.delayed(Duration(seconds: 1));
    final List<ProductInfo> result = await _repository.getProducts(keyword: keyword);
    if (result.isEmpty) {
      emit(const ProductEmptyState());
    } else {
      emit(ProductsDataState(result));
    }
  }
}
