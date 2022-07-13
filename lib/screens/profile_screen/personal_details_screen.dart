import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:rewire/screens/models/user_model.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/constant.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:rewire/widgets/custom_button.dart';
import '../../services/profile_services.dart';
import '../../upload/upload_file.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PersonalDetailsScreen extends StatefulWidget {
  FirebaseUser? firebaseUser;
  PersonalDetailsScreen({Key? key, this.firebaseUser}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    firstName.text = widget.firebaseUser?.firstname ?? "";
    email.text = widget.firebaseUser?.email ?? "";
    // TODO: implement initState
    super.initState();
  }

  bool showImage = false;
  ImagePicker picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(profileBg), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          await getImage();
                        },
                        child: const Icon(Icons.arrow_back_outlined)),
                    const SizedBox(width: AppConstant.size5),
                    Text(
                      Txt.personalDetailsTxt,
                      style: FontTextStyle.poppinsW6S20greyShade9,
                    )
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 150,
                    width: AppConstant.displayWidth(context),
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 150,
                        width: AppConstant.displayWidth(context) * 0.85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(personalDetailsBg))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppConstant.size100,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 97,
                      width: 97,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorUtils.stromCloud3, width: 4),
                          image: DecorationImage(
                              image: image != null
                                  ? Image.file(image!, fit: BoxFit.fill).image
                                  : CachedNetworkImageProvider(
                                      widget.firebaseUser?.profilePic ??
                                          "https://w0.peakpx.com/wallpaper/138/911/HD-wallpaper-virat-kohli-cartoon-india-vector-illustration.jpg",
                                    ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: AppConstant.displayWidth(context) * 0.20,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        print("hei");
                        await getImage();
                      },
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: ColorUtils.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorUtils.stromCloud3, width: 4),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print("hie");
                          },
                          child: Icon(
                            Icons.edit,
                            color: ColorUtils.stromCloud,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 70, 16, 0),
                  child: Column(
                    children: [
                      CustomInputField(
                        fieldController: firstName,
                        hint: "John",
                        fieldName: Txt.firstNameTxt,
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: ColorUtils.stromCloud,
                        ),
                      ),
                      const SizedBox(height: AppConstant.size25),
                      CustomInputField(
                        isRead: true,
                        fieldController: email,
                        hint: "johndeo@gmail.com",
                        fieldName: Txt.emailTxt,
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: ColorUtils.stromCloud,
                        ),
                      ),
                      const Spacer(),
                      CustomButton(
                        title: Txt.saveTxt,
                        onPressed: () async {
                          final data = await StorageMethods()
                              .uplaodImageToServer(image, 'profile_pic');
                          FirebaseUser? firebaseUser = widget.firebaseUser;
                          firebaseUser?.firstname = firstName.text;
                          firebaseUser?.profilePic = data['url'];
                          ProfileService().updateProfile(firebaseUser!);
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: AppConstant.size50),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> cropImage(File image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        cropStyle: CropStyle.rectangle,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Color(0xff37966f),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(title: "Cropper"));

    return croppedFile;
  }

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    final File? croppedFile = await cropImage(File(pickedFile!.path));

    setState(
      () {
        if (croppedFile != null) {
          image = File(croppedFile.path);
          showImage = true;
        } else {
          print('No image selected.');
        }
      },
    );
  }
}
