import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Posts",
      "Followers",
      "Friends",
      "Photos",
    ];
    List<String> body = [
      "100",
      "500",
      "1000",
      "200",
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(10.r),
        child: Column(
          children: [
            buildUserImageAndCover(),
            SizedBox(
              height: 10.h,
            ),
            buildUserNameAndBio(),
            SizedBox(
              height: 20.h,
            ),
            buildUserInfo(
              context,
              title: title,
              body: body,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildUserImageAndCover() => SizedBox(
        height: 200.h,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                width: double.infinity,
                height: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    topLeft: Radius.circular(5.r),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/free-photo/social-media-concept-composition_23-2150169145.jpg?t=st=1716042147~exp=1716045747~hmac=49083b17b93d079c2354a085925d1ee429c0c3515f8fd92126a936685eaee8aa&w=900",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 57.r,
                backgroundImage: const NetworkImage(
                  "https://img.freepik.com/free-photo/social-media-concept-composition_23-2150169145.jpg?t=st=1716042147~exp=1716045747~hmac=49083b17b93d079c2354a085925d1ee429c0c3515f8fd92126a936685eaee8aa&w=900",
                ),
              ),
            )
          ],
        ),
      );

  Widget buildUserNameAndBio() => Column(
        children: [
          Text(
            "Ahmed Elghareeb",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "bio....",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
        ],
      );

  Widget buildUserInfo(context, {required List<String> title, required List<String> body}) =>
      Row(
        children: List.generate(
          title.length,
          (index) => Expanded(
            child: Column(
              children: [
                Text(
                  title[index],
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  body[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildButtons() => Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  minimumSize: Size(double.infinity, 40.h)),
              child: Text(
                "Add Photos",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(40.w, 40.h),
            ),
            child: Icon(
              Icons.edit,
              size: 18.r,
            ),
          ),
        ],
      );
}
