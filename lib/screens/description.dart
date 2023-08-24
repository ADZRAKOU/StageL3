import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionPage extends StatefulWidget {
  DescriptionPage({super.key, required this.specialisation});
  dynamic specialisation;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  List<dynamic> specialisations = [
    {
      'id': 1,
      'name': 'Ophtamologie',
      'description':
          'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
      'icon': Icons.remove_red_eye,
      'color': Colors.blue,
    },
    {
      'id': 2,
      'name': 'Dermatologie',
      'description':
          'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
      'icon': Icons.sick_rounded,
      'color': Colors.orange,
    },
    {
      'id': 3,
      'name': 'Cardiologie',
      'description':
          'Cette rubrique correspond à la rubrique ophtamologie.\nVous y trouverez des docteurs spécialistes dans le domaine des yeux.\nIls seront disponibles à ces horaires',
      'icon': Icons.heart_broken,
      'color': Colors.red,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Détails de la spécialisation'),
        centerTitle: true,
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
            Icon(
              widget.specialisation['icon'],
              color: widget.specialisation['color'],
              size: MediaQuery.of(context).size.width / 2,
            ),
            Text(
              widget.specialisation['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.specialisation['description'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialisations.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              specialisation: specialisations[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: specialisations[index]['color'],
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
                                Icon(
                                  specialisations[index]['icon'],
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  specialisations[index]['name'],
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
                                specialisations[index]['description'].substring(
                                      0,
                                      specialisations[index]['description']
                                              .indexOf('.') +
                                          1,
                                    ) +
                                    '...',
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
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.specialisation['color'],
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Prendre rendez vous',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
