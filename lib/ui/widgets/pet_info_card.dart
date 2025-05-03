import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petvillage_app/ui/common/assets.dart';

class PetInfoCard extends StatelessWidget {
  const PetInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ต้องการหาผู้เมตตาอุปการะ น้องสุนัข", // TODO: เชื่อมกับ API
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(Assets.assetsIconsLocationIcon),
            const SizedBox(width: 4),
            const Text(
              "เมืองเชียงใหม่, เชียงใหม่", // TODO: เชื่อมกับ API
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color(0xFF4F9451),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                textStyle: const TextStyle(fontSize: 12),
              ),
              icon: SvgPicture.asset(Assets.assetsIconsDeliveryIcon),
              label: const Text("ส่งฟรีทั่วประเทศ", // TODO: เชื่อมกับ API
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Kanit")),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "ราคา ",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Kanit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              TextSpan(
                text: "รับเลี้ยง", // TODO: เชื่อมกับ API
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
          child: const Padding(
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
                  "หนูเป็นเด็กตัวอาจจะไม่เล็กแต่ใจหนูมุ้งมิ้งมากค่ะ สุขภาพดี วัคซีนไม่เคยขาดเช็คร่างกายล่าสุด แข็งแรงบึกบึนมากค่ะด้วยคุณพ่อคุณแม่เดิมของหนูมีเหตุจำเป็น ที่ไม่สามารถดูแลหนูได้ดีจริงๆ คุณพ่อคุณแม่ก็ไม่อยากปล่อยให้หนูไปอยู่ที่อื่น ถ้าไม่สุดจริง คงไม่เกิดเหตุการณ์อย่างนี้ค่ะ ขอคุณพ่อคุณแม่ที่เข้าใจในสายพันธุ์ มีพื้นที่และบริเวณให้น้องได้วิ่งเล่น มีสี่ห้องหัวใจที่ว่างสำหรับหนู มาช่วยให้หนูไปเติมเต็มให้ด้วยนะคะ",
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
                        "Great Pyrenees",
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
                      "ผู้",
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
                      "1 ปี",
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
