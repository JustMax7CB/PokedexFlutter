import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compie_assignment/models/pokemon.dart';
import 'package:compie_assignment/services/api.dart';
import 'package:compie_assignment/services/shared_preferences.dart';
import 'package:compie_assignment/theme/colors.dart';
import 'package:compie_assignment/widgets/pokemon_card.dart';
import 'package:compie_assignment/widgets/pokemon_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../theme/theme.dart';
import '../widgets/custom_appBar.dart';
import 'dart:developer' as dev;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceWidth;
  TextEditingController searchBarController = TextEditingController();
  PokeAPI api = GetIt.instance.get<PokeAPI>();
  SharedPreferencesService sharedPrefs =
      GetIt.instance.get<SharedPreferencesService>();
  List autoCompletePokemons = [];
  Map<String, dynamic> savedPokemons = {};

  Future getSavedPokemons() async {
    Set keys = await sharedPrefs.getKeys();
    for (String name in keys) {
      await api.fetchPokemon(name).then((value) => savedPokemons[name] = value);
    }
    return savedPokemons;
  }

  @override
  void initState() {
    super.initState();
  }

  switchTheme() {
    MyTheme themeMode = GetIt.instance.get<MyTheme>();

    setState(() {
      themeMode.switchTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(_deviceWidth, 100),
          child: pokeAppBar(context: context, switchTheme: switchTheme),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          style: TextStyle(color: white),
                          onFieldSubmitted: (String value) async {
                            setState(() {});
                            Pokemon pokemon = await api.fetchPokemon(value);
                            showDialog(pokemon);
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  searchBarController.clear();
                                }),
                            hintText: "Type Pokemon Name",
                          ),
                          controller: searchBarController,
                          onChanged: (value) async {
                            if (value.length > 2) {
                              autoCompletePokemons =
                                  await api.getAutocompletePokemons(value);
                            } else {
                              autoCompletePokemons = [];
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: autoCompletePokemons.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side:
                                const BorderSide(width: 1, color: Colors.grey),
                          ),
                          child: ListTile(
                            title: Text(autoCompletePokemons[index]),
                            onTap: () async {
                              setState(() {
                                searchBarController.text =
                                    autoCompletePokemons[index];
                                autoCompletePokemons = [];
                              });
                              Pokemon pokemon = await api
                                  .fetchPokemon(searchBarController.text);
                              showDialog(pokemon);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 450,
                child: FutureBuilder(
                  future: getSavedPokemons(),
                  builder: (context, snapshot) {
                    List<PokemonCard> cards = [];
                    if (snapshot.hasData) {
                      for (String key in snapshot.data.keys) {
                        cards.add(PokemonCard(pokemon: snapshot.data[key]));
                      }
                      return ListView(
                        children: cards,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    sharedPrefs.clearPreferences();
                  });
                },
                child: const Text("Clear Saved"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialog(Pokemon pokemon) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      body: PokemonDialogBox(pokemon: pokemon),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        sharedPrefs.save(pokemon.name, pokemon);
        setState(() {});
      },
      btnOkText: "Save Pokemon",
    ).show();
  }
}
