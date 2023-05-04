import '../../sevices/model/product.dart';

class ProductState {
  ProductState init() {
    return ProductState();
  }

  ProductState clone() {
    return ProductState();
  }
}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class SuccessLoadProductState extends ProductState {
  final List<Product> products;

  SuccessLoadProductState({required this.products});
}
