import 'item.dart';

class Lanche extends Item {
  String tipoPao;
  String tipoCarne;
  String? adicionais; // Atributo que pode ser nulo (?)

  Lanche({
    required super.id,
    required super.nome,
    required super.preco,
    required super.disponivel,
    required this.tipoPao,
    required this.tipoCarne,
    this.adicionais,
  }) : super(categoria: 'Lanche');

  @override
  String descricaoDetalhada() {
    final extras = (adicionais == null || adicionais!.trim().isEmpty)
        ? 'Sem adicionais'
        : adicionais!;
    return 'Pao: $tipoPao | Carne: $tipoCarne | Adicionais: $extras';
  }
}
