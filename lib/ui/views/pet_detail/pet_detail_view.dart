import 'package:flutter/material.dart';
import 'package:petvillage_app/ui/widgets/pet_image_slider.dart';
import 'package:petvillage_app/ui/widgets/pet_info_card.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pet Village",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              PetImageSlider(), // ใส่รูป
              SizedBox(height: 16),
              PetInfoCard()
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
