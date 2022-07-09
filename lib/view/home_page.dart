import 'package:flutter/material.dart';
import 'package:pokedex/presenter/presenter_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PresenterController>().getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              ),
            ),
          ],
        ),
        body: Consumer<PresenterController>(
          builder: (_, controller, child) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: controller.pokemonList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        title: Text(controller.pokemonList[index].name ?? ''),
                        leading: Image.network(
                            controller.pokemonList[index].thumbnailImage ?? ''),
                        trailing: Text(
                          '#${controller.pokemonList[index].number ?? ''}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/detalhes',
                              arguments: controller.pokemonList[index]);
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ));
  }
}
