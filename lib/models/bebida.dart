import 'item.dart';

class Bebida extends Item {
  final int volumeMl;
  bool gelada;
  final String sabor;

  Bebida({
    required super.id,
    required super.nome,
    required super.preco,
    required super.disponivel,
    required this.volumeMl,
    required this.gelada,
    required this.sabor,
  }) : super(categoria: 'Bebida') {
    if (volumeMl <= 0) {
      throw ArgumentError('O volume deve ser positivo.');
    }
  }

  @override
  String descricaoDetalhada() {
    final temp = gelada ? 'Gelada' : 'Natural';
    return 'Volume: ${volumeMl}ml | $temp | Sabor: $sabor';
  }
}
