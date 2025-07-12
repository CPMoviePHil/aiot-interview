part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
}

final class ProductsLoadingState extends ProductsState {
  const ProductsLoadingState();
  @override
  List<Object> get props => [];
}

final class ProductEmptyState extends ProductsState {
  const ProductEmptyState();
  @override
  List<Object> get props => [];
}

final class ProductsDataState extends ProductsState {

  final List<ProductInfo> values;
  const ProductsDataState(this.values);

  @override
  List<Object?> get props => [values];
}

