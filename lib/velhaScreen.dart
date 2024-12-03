import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marcador_bozo/controllers/homeController.dart';
import 'package:marcador_bozo/models/jogadorModel.dart';

class VelhaScreen extends StatefulWidget {
  // const VelhaScreen({super.key});

  List<Jogador> jogadores = [];

  VelhaScreen(this.jogadores);

  List<dynamic> listaAs = ["Tora", 1, 2, 3, 4, 5];
  List<dynamic> listaFull = ["Tora", 10, 15];
  List<dynamic> listaQuadra = ["Tora", 4, 8, 12, 16, 20];
  List<dynamic> listaDuque = ["Tora", 2, 4, 6, 8, 10];
  List<dynamic> listaSeguida = ["Tora", 20, 25];
  List<dynamic> listaQuina = ["Tora", 5, 10, 15, 20, 25];
  List<dynamic> listaTerno = ["Tora", 3, 6, 9, 12, 15];
  List<dynamic> listaQuadrada = ["Tora", 30, 35];
  List<dynamic> listaSena = ["Tora", 6, 12, 18, 24, 30];
  List<dynamic> listaGeneral = ["Tora", 40, "Boca"];

  // late Jogador jogadorSelecionado;

  HomeController homeController = Get.put(HomeController());

  @override
  State<VelhaScreen> createState() => _VelhaScreenState();
}

class _VelhaScreenState extends State<VelhaScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.homeController.jogadorSelecionado = widget.jogadores[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 50), // margin nomes jogadores
              height: 40,
              width: MediaQuery.of(context).size.width * 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.jogadores.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width /
                        widget.jogadores.length,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.homeController.jogadorSelecionado =
                                    widget.jogadores[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ), // Apenas para visualização
                              ),
                              child: Center(
                                child: Text("${widget.jogadores[index].nome}"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ),
          Expanded(
            child: linhasPontos(),
          )
        ],
      ),
    );
  }

  linhasPontos() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 30, bottom: 25),
            child: Text(
              widget.homeController.jogadorSelecionado.total.toString(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaAs, "as");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(12),
                    height: 80,
                    child: Column(
                      children: [
                        // Text("ÁS"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.as == 0
                                  ? ""
                                  : widget.homeController.jogadorSelecionado.as
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaFull, "full");
                  },
                  child: Container(
                    // margin: EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    width: 40,
                    child: Column(
                      children: [
                        // Text("FULL"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.full == 0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.full
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaQuadra, "quadra");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    width: 40,
                    child: Column(
                      children: [
                        // Text("QUADRA"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.quadra ==
                                      0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.quadra
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaDuque, "duque");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    // width: 40,
                    child: Column(
                      children: [
                        // Text("DUQUE"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.duque ==
                                      0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.duque
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaSeguida, "seguida");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    width: 40,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado
                                          .seguida ==
                                      0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.seguida
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaQuina, "quina");
                  },
                  child: Container(
                    // margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    child: Column(
                      children: [
                        // Text("QUINA"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.quina ==
                                      0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.quina
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaTerno, "terno");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black),
                      ),
                    ),
                    height: 80,
                    // width: 40,
                    child: Column(
                      children: [
                        // Text("TERNO"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.terno ==
                                      0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.terno
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(
                        context, widget.listaQuadrada, "quadrada");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    height: 80,
                    width: 40,
                    child: Column(
                      children: [
                        // Text("QUADRADA"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado
                                          .quadrada ==
                                      0
                                  ? ""
                                  : widget.homeController.jogadorSelecionado
                                      .quadrada
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    dialogMarcaPontos(context, widget.listaSena, "sena");
                  },
                  child: Container(
                    height: 80,
                    width: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("SENA"),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.homeController.jogadorSelecionado.sena == 0
                                  ? ""
                                  : widget
                                      .homeController.jogadorSelecionado.sena
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  dialogMarcaPontos(context, widget.listaGeneral, "general");
                },
                child: Container(
                  margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  height: 80,
                  width: 80,
                  child: Column(
                    children: [
                      // Text("GENERAL"),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            widget.homeController.jogadorSelecionado.general ==
                                    0
                                ? ""
                                : widget
                                    .homeController.jogadorSelecionado.general
                                    .toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  dialogMarcaPontos(BuildContext context, List listaPontos, String tipoPonto) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: listaPontos.length,
              itemBuilder: (ctx, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        switch (tipoPonto) {
                          case "as":
                            setState(() {
                              widget.homeController.jogadorSelecionado.as =
                                  listaPontos[index];
                            });
                            break;
                          case "duque":
                            setState(() {
                              widget.homeController.jogadorSelecionado.duque =
                                  listaPontos[index];
                            });
                            break;
                          case "terno":
                            setState(() {
                              widget.homeController.jogadorSelecionado.terno =
                                  listaPontos[index];
                            });
                            break;
                          case "quadra":
                            setState(() {
                              widget.homeController.jogadorSelecionado.quadra =
                                  listaPontos[index];
                            });
                            break;
                          case "quina":
                            setState(() {
                              widget.homeController.jogadorSelecionado.quina =
                                  listaPontos[index];
                            });
                            break;
                          case "sena":
                            setState(() {
                              widget.homeController.jogadorSelecionado.sena =
                                  listaPontos[index];
                            });
                            break;
                          case "full":
                            setState(() {
                              widget.homeController.jogadorSelecionado.full =
                                  listaPontos[index];
                            });
                            break;
                          case "seguida":
                            setState(() {
                              widget.homeController.jogadorSelecionado.seguida =
                                  listaPontos[index];
                            });
                            break;
                          case "quadrada":
                            setState(() {
                              widget.homeController.jogadorSelecionado
                                  .quadrada = listaPontos[index];
                            });
                            break;
                          case "general":
                            setState(() {
                              widget.homeController.jogadorSelecionado.general =
                                  listaPontos[index];
                            });
                            break;
                          default:
                        }

                        Navigator.of(context).pop();
                        print(widget.homeController.jogadorSelecionado.as);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 12),
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Text(
                          "${listaPontos[index]}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
