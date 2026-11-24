import 'package:flutter/material.dart';
import 'models/bebida.dart';
import 'models/item.dart';
import 'models/lanche.dart';
import 'models/porcao.dart';

void main() {
  runApp(const LanchoneteDeliveryApp());
}

class LanchoneteDeliveryApp extends StatelessWidget {
  const LanchoneteDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lanchonete Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TelaCardapio(),
    );
  }
}

class TelaCardapio extends StatelessWidget {
  const TelaCardapio({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista com 6 objetos do sistema (requisito minimo: 5)
    final List<Item> cardapio = [
      Lanche(
        id: 1,
        nome: 'X-Tudo Artesanal',
        preco: 28.90,
        disponivel: true,
        tipoPao: 'Brioche',
        tipoCarne: 'Blend Bovino 180g',
        adicionais: 'Bacon, Cheddar e Ovo',
      ),
      Lanche(
        id: 2,
        nome: 'X-Salada Classico',
        preco: 21.50,
        disponivel: true,
        tipoPao: 'Tradicional',
        tipoCarne: 'Hamburguer 120g',
        // adicionais fica null
      ),
      Porcao(
        id: 3,
        nome: 'Batata Frita Especial',
        preco: 24.00,
        disponivel: true,
        quantidade: 1,
        tamanho: 'Grande',
        sabor: 'Cheddar e Bacon',
      ),
      Porcao(
        id: 4,
        nome: 'Aneis de Cebola',
        preco: 19.90,
        disponivel: false,
        quantidade: 12,
        tamanho: 'Media',
        sabor: 'Tradicional',
      ),
      Bebida(
        id: 5,
        nome: 'Refrigerante Cola',
        preco: 7.50,
        disponivel: true,
        volumeMl: 350,
        gelada: true,
        sabor: 'Cola',
      ),
      Bebida(
        id: 6,
        nome: 'Suco Natural',
        preco: 9.00,
        disponivel: true,
        volumeMl: 500,
        gelada: true,
        sabor: 'Laranja',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanchonete Delivery'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: cardapio.length,
        itemBuilder: (context, index) {
          final item = cardapio[index];

          IconData icone = Icons.fastfood;
          if (item is Bebida) {
            icone = Icons.local_drink;
          } else if (item is Porcao) {
            icone = Icons.restaurant;
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                icone,
                color: item.disponivel ? Colors.deepOrange : Colors.grey,
              ),
              title: Text(
                item.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Categoria: ${item.categoria} | ${item.disponivel ? "Disponivel" : "Indisponivel"}\n'
                '${item.descricaoDetalhada()}',
              ),
              trailing: Text(
                'R\$ ${item.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
