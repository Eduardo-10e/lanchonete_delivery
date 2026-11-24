class Pagamento {
  final int id;
  final String formaPagamento;
  final double valor;
  String status;
  DateTime? dataPagamento; // Pode ser nulo (?) ate ser pago

  Pagamento({
    required this.id,
    required this.formaPagamento,
    required this.valor,
    required this.status,
    this.dataPagamento,
  });
}
