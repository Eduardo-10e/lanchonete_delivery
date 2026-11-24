import 'item.dart';

class ItemPedido {
  final int id;
  final int quantidade;
  final double precoUnitario;
  final double _subtotal; // Atributo privado (_)
  final Item item;

  ItemPedido({
    required this.id,
    required this.quantidade,
    required this.item,
  })  : precoUnitario = item.preco,
        _subtotal = quantidade * item.preco {
    if (quantidade <= 0) {
      throw ArgumentError('A quantidade deve ser positiva.');
    }
    if (!item.disponivel) {
      throw ArgumentError('O item deve estar disponivel.');
    }
  }

  double get subtotal => _subtotal;
}
