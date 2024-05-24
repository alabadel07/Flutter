import 'package:flutter/material.dart';
import 'package:store/services/categories_service.dart';
import 'package:store/models/category.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key});

  final CategoriesService _categoriesService = CategoriesService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(),
              ],
            ),
            FutureBuilder<List<Category>>(
              future: _categoriesService.getCategories(),
              builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                      'Une erreur est survenue lors du chargement des catégories.');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        onTap: () {
                          // Action à effectuer lorsqu'une catégorie est sélectionnée
                        },
                      );
                    },
                  );
                } else {
                  return Text('Aucune catégorie trouvée.');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
