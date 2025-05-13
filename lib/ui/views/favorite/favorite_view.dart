import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'favorite_viewmodel.dart';

class FavoriteView extends StackedView<FavoriteViewModel> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, FavoriteViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'สัตว์เลี้ยงที่ชอบ',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF242424)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.favorites.length,
                itemBuilder: (context, index) {
                  final pet = viewModel.favorites[index];
                  return Dismissible(
                    key: Key(pet['id']),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (_) => viewModel.removeFavorite(pet['id']),
                    background: Container(
                      color: Colors.redAccent,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Icon(Icons.remove_circle,
                          color: Colors.white, size: 30),
                    ),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                pet['imageUrl'],
                                width: 130,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pet['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF242424)),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'อายุ : ${pet['age']}',
                                    style: const TextStyle(
                                        color: Color(0xFF242424)),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(pet['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('เพศ : ${pet['gender']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF242424))),
                                      Text('${pet['price']} Bath',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF242424))),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FavoriteViewModel viewModelBuilder(BuildContext context) =>
      FavoriteViewModel();
}
