class ProdutoModel {
  late int? pkProduto = 0;
  final String imagem;
  final String nome;
  final String descricao;
  final double preco;
  final int quantidade;

  ProdutoModel(
      {required this.imagem,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.quantidade});

  ProdutoModel.fromJson(Map<String, dynamic> json)
      : pkProduto = json['pkProduto'],
        imagem = json['imagem'],
        nome = json['nome'],
        descricao = json['descricao'],
        preco = json['preco'],
        quantidade = json['quantidade'];

  Map<String, dynamic> toJson() => {
        'pkProduto': pkProduto,
        'imagem': imagem,
        'name': nome,
        'descricao': descricao,
        'preco': preco,
        'quantidade': quantidade
      };

  @override
  String toString() {
    // TODO: implement toString
    return "[ ${this.pkProduto} - ${this.nome} - ${this.imagem} - ${this.descricao} - ${this.preco} - ${this.quantidade} ]";
  }
}
