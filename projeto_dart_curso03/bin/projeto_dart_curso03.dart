import 'transport.dart';
import 'viagem.dart';

void main() {
  Viagem viagemMaio = Viagem(locomocao: Transporte.aviao);  
  print(viagemMaio.consultarTotalLocaisVisitados);
  viagemMaio.visitar("Museu");
  viagemMaio.visitar("Cinema");
  viagemMaio.visitar("Lan House");
  print(viagemMaio.consultarTotalLocaisVisitados);

  viagemMaio.alterarLocaisVisitados = 112;
  viagemMaio.visitar(" House");
  print(viagemMaio.consultarTotalLocaisVisitados);
}
