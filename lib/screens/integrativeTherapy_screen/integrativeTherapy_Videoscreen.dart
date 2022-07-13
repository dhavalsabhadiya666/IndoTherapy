import 'package:flutter/material.dart';
import 'package:rewire/screens/models/course_model.dart';
import 'package:rewire/services/profile_services.dart';
import 'package:rewire/utils/asset_paths.dart';
import 'package:rewire/utils/font_style_utils.dart';
import 'package:rewire/utils/strings.dart';
import 'package:video_player/video_player.dart';
import '../../utils/colors.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_loader.dart';
import '../models/content_model.dart';

class IntegrativeTherapyVideoScreen extends StatefulWidget {
  CourseModel? courseModel;
  IntegrativeTherapyVideoScreen({Key? key, this.courseModel}) : super(key: key);

  @override
  State<IntegrativeTherapyVideoScreen> createState() =>
      _IntegrativeTherapyVideoScreenState();
}

class _IntegrativeTherapyVideoScreenState
    extends State<IntegrativeTherapyVideoScreen> {
  VideoPlayerController? _videoPlayerController;
  bool isPlay = true;
  bool isVisible = false;
  bool isZoom = false;
  bool isLoader = true;
  ContentModel? contentModel;

  @override
  void initState() {
    getContentData();
    super.initState();
  }

  getContentData() async {
    contentModel = await ProfileService.contentData(
        id: widget.courseModel!.courseId.toString());
    _videoPlayerController = VideoPlayerController.network(
        contentModel != null ? contentModel!.contentFile.toString() : "")
      ..initialize().then((_) {
        setState(() {
          isLoader = false;
        });
        _videoPlayerController?.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: SizedBox(
                        height:
                            isZoom ? AppConstant.displayHeight(context) : 300,
                        width: AppConstant.displayWidth(context),
                        child: isZoom
                            ? _videoPlayerController!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _videoPlayerController!
                                        .value.aspectRatio,
                                    child: VideoPlayer(_videoPlayerController!))
                                : Container()
                            : (_videoPlayerController != null
                                    ? _videoPlayerController!
                                        .value.isInitialized
                                    : false)
                                ? VideoPlayer(_videoPlayerController!)
                                : Container(),
                      ),
                    ),
                    isVisible
                        ? Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      _videoPlayerController!.seekTo(Duration(
                                          seconds: _videoPlayerController!
                                                  .value.position.inSeconds -
                                              10));
                                    },
                                    child: const Icon(
                                      Icons.fast_rewind_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                const Padding(padding: EdgeInsets.all(2)),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        fixedSize: MaterialStateProperty.all(
                                            Size(70, 70)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100)))),
                                    onPressed: () {
                                      setState(() {
                                        isPlay = !isPlay;
                                      });
                                      isPlay
                                          ? _videoPlayerController!.play()
                                          : _videoPlayerController!.pause();
                                    },
                                    child: isPlay
                                        ? Icon(
                                            Icons.pause,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.play_arrow,
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                Padding(padding: EdgeInsets.all(2)),
                                GestureDetector(
                                    onTap: () {
                                      _videoPlayerController!.seekTo(Duration(
                                          seconds: _videoPlayerController!
                                                  .value.position.inSeconds +
                                              10));
                                    },
                                    child: Icon(
                                      Icons.fast_forward_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ],
                            ),
                          )
                        : SizedBox(),
                    isVisible
                        ? Positioned(
                            left: 16,
                            right: 16,
                            top: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Image(image: AssetImage(videoIcon))
                              ],
                            ))
                        : SizedBox(),
                    isVisible
                        ? Positioned(
                            left: 16,
                            right: 50,
                            bottom: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _videoPlayerController!
                                      .value.position.inSeconds
                                      .toString(),
                                  style: FontTextStyle.poppinsW5S12white,
                                ),
                                Text(
                                  "30:50",
                                  style: FontTextStyle.poppinsW5S12white,
                                ),
                              ],
                            ))
                        : SizedBox(),
                    isVisible
                        ? Positioned(
                            left: 16,
                            right: 16,
                            bottom: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      AppConstant.displayWidth(context) * 0.8,
                                  child: VideoProgressIndicator(
                                    _videoPlayerController!,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                        backgroundColor: Colors.white,
                                        bufferedColor: Colors.white,
                                        playedColor: ColorUtils.primaryOrange),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isZoom = !isZoom;
                                    });
                                  },
                                  child: Icon(
                                    Icons.zoom_out_map_outlined,
                                    color: ColorUtils.white,
                                  ),
                                )
                              ],
                            ))
                        : SizedBox(),
                  ],
                ),
                isZoom
                    ? SizedBox()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppConstant.size30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.courseModel!.courseName.toString(),
                                  style: FontTextStyle.poppinsW6S20greyShade9,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorUtils.greyShade2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mark as done",
                                        style: FontTextStyle
                                            .poppinsW4S12greyShade9,
                                      ),
                                      Icon(
                                        Icons.check_circle_rounded,
                                        size: 16,
                                        color: ColorUtils.greyShade4,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppConstant.size10),
                            Row(
                              children: [
                                Text("5 May 22",
                                    style:
                                        FontTextStyle.poppinsW4S10greyShade5),
                                SizedBox(width: AppConstant.size5),
                                Icon(Icons.circle,
                                    color: ColorUtils.greyShade5, size: 5),
                                SizedBox(width: AppConstant.size5),
                                Text("36 min",
                                    style:
                                        FontTextStyle.poppinsW4S10greyShade5),
                              ],
                            ),
                            SizedBox(height: AppConstant.size10),
                            Text(
                              (contentModel != null &&
                                      contentModel!.contentDescription != null)
                                  ? contentModel!.contentDescription!.toString()
                                  : "",
                              style: FontTextStyle.poppinsW4S14greyShade6,
                            ),
                            SizedBox(height: AppConstant.size20),
                            Text(
                              Txt.similarExercisesTxt,
                              style: FontTextStyle.poppinsW6S18stromCloud,
                            ),
                          ],
                        ),
                      ),

                ///Static
                /*Container(
                  height: 314,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(therapyVideo), fit: BoxFit.cover)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Image(image: AssetImage(videoIcon))
                      ],
                    ),
                  ),
                ),*/
                isZoom
                    ? SizedBox()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              padding: EdgeInsets.all(16),
                              height: 96,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorUtils.grey.withOpacity(0.1),
                                      blurRadius: 8,
                                    )
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(image: AssetImage(therapyImage)),
                                  SizedBox(width: AppConstant.size15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Mystical Fog",
                                        style: FontTextStyle
                                            .poppinsW5S16greyShade9,
                                      ),
                                      SizedBox(height: AppConstant.size5),
                                      Row(
                                        children: [
                                          Text("5 May",
                                              style: FontTextStyle
                                                  .poppinsW4S10greyShade5),
                                          SizedBox(width: AppConstant.size5),
                                          Icon(Icons.circle,
                                              color: ColorUtils.greyShade5,
                                              size: 5),
                                          SizedBox(width: AppConstant.size5),
                                          Text("36 min",
                                              style: FontTextStyle
                                                  .poppinsW4S10greyShade5),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.play_circle_fill_outlined,
                                    color: ColorUtils.primaryOrange,
                                  )
                                ],
                              ),
                            )),
              ],
            ),
          ),
        ),
        isLoader == true ? CustomLoader() : SizedBox.shrink()
      ],
    );
  }
}
