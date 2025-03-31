import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/pet_delivery.dart';
import 'package:petvillage_app/ui/widgets/pet_image_slider.dart';
import 'package:petvillage_app/ui/widgets/pet_info_card.dart';
import 'package:petvillage_app/ui/widgets/pet_store.dart';
import 'package:stacked/stacked.dart';
import 'pet_detail_viewmodel.dart';

class PetDetailView extends StackedView<PetDetailViewModel> {
  const PetDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PetDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const PetImageSlider(), // ใส่รูป
              const SizedBox(height: 16),
              const PetInfoCard(),
              const SizedBox(height: 8),
              PetDelivery(),
              const SizedBox(height: 8),
              PetStore(),
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
