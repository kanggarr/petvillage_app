import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petvillage_app/models/pet_model.dart';
import 'package:petvillage_app/ui/common/assets.dart';

class PetInfoCard extends StatelessWidget {
  final PetModel petModel;

  const PetInfoCard({Key? key, required this.petModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          petModel.name, // TODO: เชื่อมกับ API
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(Assets.assetsIconsLocationIcon),
            const SizedBox(width: 4),
            Text(
              petModel.location, // TODO: เชื่อมกับ API
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500),
            ),
            // const Spacer(),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     backgroundColor: const Color(0xFF4F9451),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //     textStyle: const TextStyle(fontSize: 12),
            //   ),
            //   icon: SvgPicture.asset(Assets.assetsIconsDeliveryIcon),
            //   label: const Text("ส่งฟรีทั่วประเทศ", // TODO: เชื่อมกับ API
            //       style: TextStyle(
            //           color: Color(0xFFFFFFFF),
            //           fontSize: 16,
            //           fontWeight: FontWeight.normal,
            //           fontFamily: "Kanit")),
            // ),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "ราคา ",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Kanit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                text: petModel.price.toString(), // TODO: เชื่อมกับ API
                style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontFamily: "Kanit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              TextSpan(
                  text: " บาท",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Kanit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ข้อมูลโดยรวม :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  //TODO: เชื่อมกับ API
                  petModel.description,
                  softWrap: true,
                  maxLines: null,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "สายพันธุ์ : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Expanded(
                      child: Text(
                        //TODO: เชื่อมกับ API
                        petModel.breed,
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "เพศ : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Text(
                      //TODO: เชื่อมกับ API
                      petModel.gender,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "อายุ : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Text(
                      //TODO: เชื่อมกับ API
                      "${petModel.age.toString()} ปี",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
