import 'package:bloc/bloc.dart';

import '../../sevices/firebase/fire_base_fire_store.dart';
import '../../sevices/model/product.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FireBaseFireStore _fireBaseFireStore = FireBaseFireStore();

  ProductBloc() : super(InitialProductState()) {
    // Search
    on<GetProductEvent>((event, emit) => mapGetProductEventToState(event, emit));
  }

  Future<void> mapGetProductEventToState(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());

    List<Product> listDisPlay = await _fireBaseFireStore.getAllData();

    // await Future.delayed(const Duration(seconds: 5));

    emit(SuccessLoadProductState(products: listDisPlay));
  }
}
