import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcador_bozo/controllers/homeController.dart';
import 'package:marcador_bozo/models/jogadorModel.dart';
import 'package:marcador_bozo/velhaScreen.dart';

class Home extends StatefulWidget {
  Home({super.key});

  TextEditingController nomeJogadorController = TextEditingController();
  HomeController homeController = Get.put(HomeController());

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                dialogNovoJogo(context);
              },
              child: Container(
                width: 80,
                height: 60,
                child: Text("Novo Jogo"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dialogNovoJogo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 60,
                        child: TextField(
                          controller: widget.nomeJogadorController,
                          decoration: InputDecoration(
                            hintText: "Nome do jogador",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.homeController.jogadores.add(
                              Jogador(nome: widget.nomeJogadorController.text));
                          widget.nomeJogadorController.text = "";
                        },
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
                // lista que exibe nome dos jogadores cadastrados para o jogo
                Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: widget.homeController.jogadores.length,
                    itemBuilder: (ctx, index) {
                      return Text(
                        widget.homeController.jogadores[index].nome.toString(),
                      );
                    },
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: widget.homeController.jogadores.length <= 0
                        ? null
                        : () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => VelhaScreen(
                                  widget.homeController.jogadores,
                                ),
                              ),
                            );
                          },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.deepPurple[300],
                      ),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Começar Jogo",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
