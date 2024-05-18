import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialko/utils/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Feeds"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                margin: EdgeInsetsDirectional.all(8.r),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    cacheImage(
                      "https://img.freepik.com/free-photo/social-media-concept-composition_23-2150169145.jpg?t=st=1716042147~exp=1716045747~hmac=49083b17b93d079c2354a085925d1ee429c0c3515f8fd92126a936685eaee8aa&w=900",
                      BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.all(10.r),
                      child: Text(
                        "Communicate with Friends",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
                child: Padding(
                  padding: EdgeInsetsDirectional.all(10.r),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: const NetworkImage(
                              "https://img.freepik.com/free-photo/full-length-portrait-stylish-female-blogger-standing-purple-dreamy-caucasian-girl-white-sweater-dancing_197531-12107.jpg?t=st=1716043300~exp=1716046900~hmac=1d97a485f67abab1e318e7d044f8de1c758445e95fdfd7dfc94f694bb23f7dd2&w=1060",
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("Ahmed Elghareeb",
                                        style: TextStyle(height: 1.4)),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Icon(
                                      Icons.verified,
                                      size: 15.r,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  ],
                                ),
                                const Text("18 May, 2024 at 05:49 PM",
                                    style: TextStyle(height: 1.4)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              size: 18.r,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
