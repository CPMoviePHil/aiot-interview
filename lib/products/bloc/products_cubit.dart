import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/product_info.dart';
import '../repository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  ProductsCubit({
    required ProductsRepository repository
  }) : _repository = repository, super(const ProductsLoadingState());

  final ProductsRepository _repository;

  Future<void> getData() async {
    final List<ProductInfo> result = await _repository.getProducts();
    if (result.isEmpty) {
      emit(const ProductEmptyState());
    } else {
      emit(ProductsDataState(result));
    }
  }
}
