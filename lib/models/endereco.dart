class Endereco {
  final int id;
  String rua;
  String numero;
  String bairro;
  String? complemento; // Atributo que pode ser nulo (?)
  String cep;

  Endereco({
    required this.id,
    required this.rua,
    required this.numero,
    required this.bairro,
    this.complemento,
    required this.cep,
  });

  String formatar() {
    final comp = (complemento == null || complemento!.trim().isEmpty)
        ? ''
        : ', $complemento';
    return '$rua, $numero$comp - $bairro - CEP $cep';
  }
}
