import 'item.dart';

class Porcao extends Item {
  final int quantidade;
  final String tamanho;
  final String sabor;

  Porcao({
    required super.id,
    required super.nome,
    required super.preco,
    required super.disponivel,
    required this.quantidade,
    required this.tamanho,
    required this.sabor,
  }) : super(categoria: 'Porcao') {
    if (quantidade <= 0) {
      throw ArgumentError('A quantidade deve ser positiva.');
    }
  }

  @override
  String descricaoDetalhada() {
    return 'Porcoes: $quantidade | Tamanho: $tamanho | Sabor: $sabor';
  }
}
