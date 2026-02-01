import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductInheritedWidget extends InheritedWidget {
  final Product product;

  const ProductInheritedWidget({
    super.key,
    required this.product,
    required super.child,
  });
  static ProductInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductInheritedWidget>();
  }

  static ProductInheritedWidget of(BuildContext context) {
    final ProductInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No ProductInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ProductInheritedWidget oldWidget) {
    return product != oldWidget.product;
  }
}
