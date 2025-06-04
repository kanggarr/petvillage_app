## Pet Village
**แพลตฟอร์มสำหรับซื้อขายและรับเลี้ยงสัตว์เลี้ยง**

ระบบนี้ถูกพัฒนาขึ้นเพื่อช่วยเหลือผู้ที่ต้องการแพลตฟอร์มสำหรับการซื้อขายและรับเลี้ยงสัตว์ที่มาความน่าเชื่อถือ 
และเป็นแพลตฟอร์มสำหรับแลกเปลี่ยนข้อมูลวิธีการดูแลสัตว์ผ่านบล็อกโพสในชุมชน

## ขั้นตอนการติดตั้งแอปพลิเคชัน

**Frontend**

```bash
git clone https://github.com/kanggarr/petvillage_app.git
```

**Backend**

```bash
git clone https://github.com/kanggarr/petvillage_app_sever.git
```

## การติดตั้งและวิธีการใช้งาน

1. ติดตั้ง Dependencies

**Frontend (Flutter)**

```bash
flutter pub get
```

**Backend (Node.js)**

```bash
npm i
```
2. การตั้งค่าโปรเจกต์
สร้างไฟล์ .env ในโฟลเดอร์ backend และใส่ค่าดังนี้:

```bash
PORT=8080
MONGO_URI=mongodb+srv://kpcfinalproject:KPC394203@cluster0.3artxhq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
TOKEN_SECRET=ThisIsSecreateKeyForPetVillAgeCreateOn05052025
EMAIL_USER=pond78902@gmail.com
EMAIL_PASS=yblvqwcuaifpjlap
ENABLE_EMAIL=False
```

สร้างไฟล์ .env หรือกำหนดค่าตัวแปรในแอป Flutter ดังนี้:

```bash
API_ANDROID_URL=http://10.0.2.2:8080/
API_IOS_URL=http://127.0.0.1:8080/
```

3. วิธีรันโปรเจกต์

* ตรวจสอบอุปกรณ์ที่เชื่อมต่ออยู่ (เช่น Android Emulator หรือ iOS Simulator)

* Backend ใช้คำสั่ง 

```bash
npm run dev
```

* Frontend ใช้คำสั่ง
```bash
flutter run
```

4. อธิบายผลลัพธ์ เมื่อรันโปรเจกต์เรียบร้อยแล้ว:

Backend จะเปิดใช้งาน API บนพอร์ต 8080

Frontend จะเปิดแอปบนอุปกรณ์ที่เชื่อมต่ออยู่

ผู้ใช้สามารถใช้งานฟีเจอร์ต่าง ๆ ได้ เช่น:

- ระบบล็อกอิน / สมัครสมาชิก

- อ่าน/เขียนบล็อก

- โพสต์ขาย/รับเลี้ยงสัตว์ (สำหรับ user ที่ลงทะเบียนเป็นร้านค้า)

- พูดคุยผ่านแชท

- แก้ไขโปรไฟล์

## โครงสร้างโปรเจกต์
```
PETVILLAGE/
├── backend/               # Node.js Backend
│   ├── controllers/
│   ├── data/
│   ├── models/
│   ├── routes/
│   ├── middleware/
│   ├── temp_uploads/
│   ├── uploads/           # สำหรับใบอนุญาตร้านค้า
│   ├── utils/
│   ├── .env               # ไฟล์ตั้งค่า Backend
│   └── server.js
│
├── frontend/              # Flutter Frontend
│   ├── lib/
│   │   ├── app/
│   │   ├── constants/
│   │   ├── models/
│   │   ├── services/
│   │   ├── ui/
│   │   └── main.dart
│   ├── assets/
|   |   ├── fonts/
│   |   ├── icons/
│   |   └── images/
│   ├── .env               # ไฟล์ตั้งค่า API URL (ถ้ามี)
│   └── pubspec.yaml
├── README.md
└── .gitignore
```

## ข้อกำหนดระบบ
- Flutter SDK           >= 3.13.0
- Dart SDK              รวมใน Flutter 3.13.0+
- Android SDK           API level 34 (compileSdk)
- Android NDK           (ใช้ตามที่ Flutter กำหนด)
- Java Development Kit  JDK 11 หรือ JDK 17
- Gradle                7.4
- Android Gradle Plugin 7.4.2
- Kotlin                1.8.21
- RAM อย่างน้อย 8GB แนะนำ
---
