import 'package:crm_flutter/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../logic/bloc/user/user_bloc.dart';
import '../../widgets/show_user_photo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// app bar
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.icoLogo,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                      ZoomTapAnimation(
                        onTap: () => Navigator.pushNamed(
                            context, AppRouter.profileScreen),
                        child: Container(
                          height: 40,
                          width: 40,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: AppColors.grayishBlue.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: BlocBuilder<UserBloc, UserState>(
                            buildWhen: (previous, current) =>
                                current.userStatus == UserStatus.loaded,
                            builder: (context, state) =>
                                const ShowUserPhotoItem(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                children: [
                  Row(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        buildWhen: (previous, current) =>
                            current.userStatus == UserStatus.loaded,
                        builder: (context, state) => Text(
                          'Welcome back, ${UserData.name}!',
                          style: AppTextStyles.nunitoSansW600.copyWith(
                            color: AppColors.grey,
                            fontSize: 16,
                            ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Dashboard',
                    style: AppTextStyles.nunitoSansW700.copyWith(
                      color: AppColors.darkShadeGreen,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
