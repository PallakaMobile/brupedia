import 'package:brupedia/data/models/helper/DataProfile.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

///*********************************************
/// Created by ukietux on 26/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class UserCard extends StatelessWidget {
  final DataProfile dataProfile;

  const UserCard({Key key, this.dataProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widthInPercent(100, context),
        height: Dimens.height30,
        decoration: BoxDecorations.primary,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                "images/ic_header_pattern.svg",
                width: widthInPercent(65, context),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(dataProfile.imageUrl),
                    radius: 30.h,
                  ),
                  SizedBox(
                    height: dp8(context),
                  ),
                  Text(
                    dataProfile.userName,
                    style: TextStyles.whiteBold
                        .copyWith(fontSize: Dimens.fontLarge1),
                  ),
                  Text(
                    dataProfile.position,
                    style: TextStyles.white,
                  ),
                  Text(
                    dataProfile.title,
                    style: TextStyles.white.copyWith(
                      fontSize: Dimens.fontSmall,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
