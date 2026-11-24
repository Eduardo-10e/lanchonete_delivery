import '../models/item.dart';

class ItemRepository {
  final List<Item> _itens = [];

  void cadastrar(Item item) {
    if (buscar(item.id) != null) {
      throw ArgumentError('Ja existe um item com esse id.');
    }
    _itens.add(item);
  }

  List<Item> listar() {
    return List.unmodifiable(_itens);
  }

  Item? buscar(int id) {
    for (final item in _itens) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  void alterar({
    required int id,
    required String novoNome,
    required double novoPreco,
    required bool disponivel,
  }) {
    final item = buscar(id);
    if (item == null) {
      throw ArgumentError('Item nao encontrado.');
    }
    if (novoNome.trim().isEmpty) {
      throw ArgumentError('Nome obrigatorio.');
    }
    if (novoPreco <= 0) {
      throw ArgumentError('O preco deve ser positivo.');
    }
    item.nome = novoNome.trim();
    item.preco = novoPreco;
    item.disponivel = disponivel;
  }

  bool remover(int id) {
    final item = buscar(id);
    if (item == null) {
      return false;
    }
    _itens.remove(item);
    return true;
  }
}
