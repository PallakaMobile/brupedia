import 'package:brupedia/data/models/responses/login_response.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/utils.dart';
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
  const UserCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = sl<User>();
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
              child: SvgPicture.network(
                "ic_header_pattern".toIconDictionary(),
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
                    backgroundImage: NetworkImage(user.profile.avatar),
                    radius: 30.h,
                  ),
                  SizedBox(
                    height: dp8(context),
                  ),
                  Text(
                    user.name,
                    style: TextStyles.whiteBold
                        .copyWith(fontSize: Dimens.fontLarge1),
                  ),
                  Text(
                    user.profile.jabatan,
                    style: TextStyles.white,
                  ),
                  Text(
                    user.profile.bidang,
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
