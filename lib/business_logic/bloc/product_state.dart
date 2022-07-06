part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {}

class ProductSuccess extends ProductState {
  final ProductResponse productResponse;
   ProductSuccess(this.productResponse);
}
