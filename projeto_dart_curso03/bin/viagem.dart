import 'transport.dart';

class Viagem {
  static String codigoTrabalho = "KODS36";
  double dineheiro = 0;
  Transporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String, dynamic> resgistroPrecos = {};

   int _totalLocaisVistados = 0;

  Viagem({required this.locomocao});

  printCodigo() {
    print(codigoTrabalho);
  }

  void escolherMeioTransporteEnum(Transporte locomocao) {
   switch (locomocao) {
      case Transporte.carro:
        print("Vou de CARRO para aventura!");
        break;
      case Transporte.bike:
        print("Vou de BIKE para aventura!");
        break;
      case Transporte.andando:
        print("Vou de ANDANDO para aventura!");
        break;
      case Transporte.skate:
        print("Vou de SKATE para aventura!");
        break;
      case Transporte.aviao:
        print("Vou de AVIAO para aventura!");
        break;
      case Transporte.patins:
        print("Vou de PATINS para aventura!");
        break;
      case Transporte.trem:
        print("Vou de TREM para aventura!");
        break;
      case Transporte.onibus:
        print("Vou de ONIBUS para aventura!");
        break;
      default:
        print("Estou indo para a aventura, isso que importa!");
        break;
    } 
}

  void visitar(String localVisita) {
    registrosVisitados.add(localVisita);
    _totalLocaisVistados +=1;
  }

  void registrarPrecoVisita(String local, dynamic preco) {
    resgistroPrecos[local] = preco;
  }

  int get consultarTotalLocaisVisitados {
    return _totalLocaisVistados;
  }

  void set alterarLocaisVisitados(int novaQnt) {
    if(novaQnt < 10) {
      _totalLocaisVistados = novaQnt;
    } else {
      print("Não é possível!!");
    }
  }


}