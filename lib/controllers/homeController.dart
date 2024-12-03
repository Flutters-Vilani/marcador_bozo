import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:marcador_bozo/models/jogadorModel.dart';

class HomeController extends GetxController {
  List<Jogador> jogadores = <Jogador>[].obs;
  dynamic jogadorSelecionado = "".obs;

  Jogador? jogador;

  marcarPonto(dynamic tipoPonto, int ponto) {
    switch (tipoPonto) {
      case "as":
        jogador!.as = ponto;
        break;
      case "duque":
        jogador!.duque = ponto;
        break;
      case "terno":
        jogador!.terno = ponto;
        break;
      case "quadra":
        jogador!.quadra = ponto;
        break;
      case "quina":
        jogador!.quina = ponto;
        break;
      case "sena":
        jogador!.sena = ponto;
        break;
      case "full":
        jogador!.full = ponto;
        break;
      case "seguida":
        jogador!.seguida = ponto;
        break;
      case "quadrada":
        jogador!.quadrada = ponto;
        break;
      case "general":
        jogador!.general = ponto;
        break;
      default:
    }
  }
}
