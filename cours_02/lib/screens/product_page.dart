import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0.0,
            start: 0.0,
            end: 0.0,
            height: 200.0,
            child: _ProductPicture(),
          ),
        ],
      ),
    );
  }
}

class _ProductPicture extends StatelessWidget {
  const _ProductPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      fit: BoxFit.cover,
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration());
  }
}

/// Faire ici Quantité & Vendu
class _ProductData extends StatelessWidget {
  const _ProductData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// Faire ici boutons Végétalien & Végétarien
class _ProductButtons extends StatelessWidget {
  const _ProductButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
