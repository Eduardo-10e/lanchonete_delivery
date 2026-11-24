abstract class Item {
  final int id;
  String nome;
  double _preco; // Atributo privado (_)
  bool disponivel;
  final String categoria;

  Item({
    required this.id,
    required this.nome,
    required double preco,
    required this.disponivel,
    required this.categoria,
  }) : _preco = preco {
    if (id <= 0) {
      throw ArgumentError('O id deve ser positivo.');
    }
    if (nome.trim().isEmpty) {
      throw ArgumentError('O nome nao pode ficar vazio.');
    }
    if (preco <= 0) {
      throw ArgumentError('O preco deve ser positivo.');
    }
    nome = nome.trim();
  }

  // Getter para o atributo privado _preco
  double get preco => _preco;

  set preco(double valor) {
    if (valor <= 0) {
      throw ArgumentError('O preco deve ser positivo.');
    }
    _preco = valor;
  }

  // Regra de negocio: descricao detalhada implementada nas subclasses
  String descricaoDetalhada();

  String descricaoBase() {
    final status = disponivel ? 'Disponivel' : 'Indisponivel';
    return '$id - $nome | $categoria | R\$ ${_preco.toStringAsFixed(2)} | $status';
  }
}
