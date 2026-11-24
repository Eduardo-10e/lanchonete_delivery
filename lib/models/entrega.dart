class Entrega {
  final int id;
  final String bairro;
  double distanciaKm;
  String status;
  DateTime dataPrevista;
  DateTime? dataEntrega; // Pode ser nulo (?) ate ser entregue

  Entrega({
    required this.id,
    required this.bairro,
    required this.distanciaKm,
    required this.status,
    required this.dataPrevista,
    this.dataEntrega,
  });
}
