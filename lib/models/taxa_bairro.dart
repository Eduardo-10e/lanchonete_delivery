class TaxaBairro {
  final int id;
  final String bairro;
  final double _valorTaxa; // Atributo privado (_)
  final bool ativo;

  TaxaBairro({
    required this.id,
    required this.bairro,
    required double valorTaxa,
    required this.ativo,
  }) : _valorTaxa = valorTaxa {
    if (id <= 0) throw ArgumentError('O id da taxa deve ser positivo.');
    if (bairro.trim().isEmpty) throw ArgumentError('O bairro nao pode ficar vazio.');
    if (valorTaxa < 0) throw ArgumentError('A taxa nao pode ser negativa.');
  }

  double get valorTaxa => _valorTaxa;
}
