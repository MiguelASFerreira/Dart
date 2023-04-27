// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 25;
  bool isMadura;

  Fruta melancia = Fruta("Melancia", 1500.0, "Verde", "Doce", 40);
  melancia.estaMadura(43);

  Legumes mandioca1 = Legumes("Macaxeira", 1200, "Marrom", true);
  Fruta banana1 = Fruta("Banana", 75, "Amarela", "Doce", 12);
  Nozes macadamia = Nozes("Macadâmia", 2, "Branco Amarelo", "Doce", 20, 35);
  Citricas limao = Citricas("Limão", 50, "Verde", "Azedo", 16, 9);

  mandioca1.printAlimento();
  banana1.printAlimento();
  macadamia.printAlimento();
  limao.printAlimento();

  mandioca1.cozinhar();
  limao.fazerSuco();
  // banana1.separarIngredientes();
  macadamia.fazerMassa();

}

class Fruta extends Alimento implements Bolo{
  String sabor; 
  int diasDesdeColheita; 
  bool? isMadura;

  Fruta(
    String nome,
    double peso,
    String cor,
    this.sabor,
    this.diasDesdeColheita,
    {this.isMadura}
  ): super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida $diasDesdeColheita dia(s), e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }
  void fazerSuco() {
    print("Você fez um ótimo suco de $nome");
  }
  
  @override
  void assar() {
    print("Colocar no forno");
  }
  
  @override
  void fazerMassa() {
    print('Misturar a $nome com Farinha, açucar e ovos');
  }
  
  @override
  void separarIngredientes() {
    print("Catar a $nome");
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(
    this.nome,
    this.peso,
    this.cor,
  );

  void printAlimento() {
    print("Este(a) $nome pesa $peso gramas e é $cor");
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;

  Legumes(
    String nome,
    double peso,
    String cor,
    this.isPrecisaCozinhar
  ): super(nome, peso, cor);


  void cozinhar() {
    if(isPrecisaCozinhar ) {
      print("Pronto, o $nome está cozinhando!");
    } else {
      print("Nem precisa cozinhar");
    }
  }
  
  @override
  void assar() {
    // Colocar masi tempo
  }
  
  @override
  void fazerMassa() {
    // Fazer uma papa com o legume
  }
  
  @override
  void separarIngredientes() {
    // Ver se o alimento está cozido ou cru
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(
    String nome,
    double peso,
    String cor,
    String sabor,
    int diasDesdeColheita,
    this.nivelAzedo,
  ): super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if(existe) {
      print("Existe refrigerante de $nome");
    } else {
      print("Não existe refri de $nome");
    }
  }
}

class Nozes extends Fruta{
  double porcentagemOleoNatural;

  Nozes(
    String nome,
    double peso,
    String cor,
    String sabor,
    int diasDesdeColheita,
    this.porcentagemOleoNatural,
  ): super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}



abstract class Bolo {
 
  void separarIngredientes();
  
  void fazerMassa();
  
  void assar();
}



