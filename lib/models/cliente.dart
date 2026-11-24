import 'endereco.dart';

class Cliente {
  final int id;
  String nome;
  String telefone;
  final DateTime dataCadastro;
  Endereco? endereco; // Pode ser nulo (?)

  Cliente({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.dataCadastro,
    this.endereco,
  });
}
