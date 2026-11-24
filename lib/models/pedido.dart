import 'cliente.dart';
import 'entrega.dart';
import 'item_pedido.dart';
import 'pagamento.dart';
import 'taxa_bairro.dart';

class Pedido {
  final int id;
  final DateTime dataHora;
  String status;
  double _valorItens = 0;
  double _taxaEntrega = 0;
  double _total = 0;
  String? enderecoEntrega;
  final Cliente cliente;
  final List<ItemPedido> itens = [];
  Entrega? entrega;
  Pagamento? pagamento;

  Pedido({
    required this.id,
    required this.dataHora,
    required this.status,
    required this.cliente,
  });

  double get valorItens => _valorItens;
  double get taxaEntrega => _taxaEntrega;
  double get total => _total;

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  // Regra de negocio principal: confirma o pedido e calcula totais com taxa do bairro
  void confirmar(TaxaBairro taxa) {
    if (itens.isEmpty) {
      throw StateError('O pedido precisa ter pelo menos um item.');
    }
    if (cliente.endereco == null || cliente.endereco!.bairro.trim().isEmpty) {
      throw StateError('O cliente precisa de endereco com bairro informado.');
    }
    if (!taxa.ativo ||
        taxa.bairro.toLowerCase() != cliente.endereco!.bairro.toLowerCase()) {
      throw StateError('Nao existe taxa ativa para o bairro.');
    }

    _valorItens = 0;
    for (final item in itens) {
      _valorItens += item.subtotal;
    }
    _taxaEntrega = taxa.valorTaxa;
    _total = _valorItens + _taxaEntrega;
    enderecoEntrega = cliente.endereco!.formatar();
    status = 'CONFIRMADO';
  }
}
