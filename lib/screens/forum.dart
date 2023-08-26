import 'package:flutter/material.dart';
import 'package:masante228/models/specialite.dart';
import 'package:masante228/screens/provider/user_provider.dart';
import 'package:masante228/utils/color_utils.dart';
import 'package:masante228/utils/utils.dart';
import 'package:provider/provider.dart';

import 'description.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserProvider userProvider;

  // List<dynamic> specialisations = [
  //   {
  //     'id': 1,
  //     'name': 'Ophtamologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.remove_red_eye,
  //     'color': Colors.blue,
  //   },
  //   {
  //     'id': 2,
  //     'name': 'Dermatologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.sick_rounded,
  //     'color': Colors.orange,
  //   },
  //   {
  //     'id': 3,
  //     'name': 'Cardiologie',
  //     'description':
  //         'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
  //     'icon': Icons.heart_broken,
  //     'color': Colors.red,
  //   }
  // ];

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Specialisations'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Voir plus',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: userProvider.specialites.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: userProvider.specialites.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DescriptionPage(
                                    specialisation: userProvider.specialites[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: randomColor(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 12,
                                        height: 50,
                                      ),
                                      const Icon(
                                        Icons.add_home_work,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        userProvider.specialites[index].nom,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      userProvider.specialites[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(
                        child: Text("Vide"),
                      ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Prise de rendez-vous',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  'https://img.freepik.com/vecteurs-libre/prise-rendez-vous-calendrier_52683-39831.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
