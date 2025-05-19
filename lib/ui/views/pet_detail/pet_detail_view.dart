import 'package:flutter/material.dart';
import 'package:petvillage_app/models/pet_model.dart';
import 'package:petvillage_app/ui/widgets/pet_delivery.dart';
import 'package:petvillage_app/ui/widgets/pet_image_slider.dart';
import 'package:petvillage_app/ui/widgets/pet_info_card.dart';
import 'package:petvillage_app/ui/widgets/pet_store.dart';
import 'package:stacked/stacked.dart';
import 'pet_detail_viewmodel.dart';

class PetDetailView extends StackedView<PetDetailViewModel> {
  final PetModel petModel;

  const PetDetailView({Key? key, required this.petModel}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PetDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pet Village",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424)),
              ),
              const SizedBox(height: 12),
              const PetImageSlider(),
              const SizedBox(height: 16),
              PetInfoCard(petModel: petModel),
              const SizedBox(height: 12),
              PetDelivery(petModel: petModel),
              const SizedBox(height: 12),
              PetStore(onPressed: viewModel.navigateToShopProfile),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: const Color(0xFF4F9451),
                          ),
                          child: const Text(
                            "ติดต่อคนขาย",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF)),
                          )),
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: const Color(0xFFFF8687),
                          ),
                          child: const Text(
                            "เพิ่มรายการโปรด",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF)),
                          )),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  PetDetailViewModel viewModelBuilder(BuildContext context) =>
      PetDetailViewModel();
}
