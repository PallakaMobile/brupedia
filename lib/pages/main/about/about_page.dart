import 'package:brupedia/blocs/about/about_bloc.dart';
import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/resources/dimens.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  AboutBloc _aboutBloc;

  @override
  void initState() {
    super.initState();
    _aboutBloc = BlocProvider.of<AboutBloc>(context);
    _aboutBloc.add(GetAboutEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _aboutBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        appBar: null,
        child: BlocBuilder(
          cubit: _aboutBloc,
          builder: (_, state) {
            switch (state.status) {
              case Status.LOADING:
                return Center(child: Loading());
                break;
              case Status.ERROR:
                return Center(child: Empty());
                break;
              case Status.SUCCESS:
                {
                  return HtmlView(
                    htmlString: state.data,
                  );
                }
                break;
              default:
                return Container();
            }
          },
        ));
  }
}
