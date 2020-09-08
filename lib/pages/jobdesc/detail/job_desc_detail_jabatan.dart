import 'package:brupedia/blocs/blocs.dart';
import 'package:brupedia/data/models/responses/job_description_response.dart';
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class JobDescDetailJabatanPage extends StatefulWidget {
  JobDescDetailJabatanPage({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _JobDescDetailJabatanPageState createState() =>
      _JobDescDetailJabatanPageState();
}

class _JobDescDetailJabatanPageState extends State<JobDescDetailJabatanPage> {
  JobDescriptionBloc _jobDescriptionBloc;

  @override
  void initState() {
    super.initState();
    _jobDescriptionBloc = BlocProvider.of<JobDescriptionBloc>(context);
    _jobDescriptionBloc.add(GetJobDescriptionEvent(widget.id));
  }

  @override
  void dispose() {
    super.dispose();
    _jobDescriptionBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        appBar: context.appBar(),
        child: BlocBuilder(
          cubit: _jobDescriptionBloc,
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
                  JobDescriptionResponse _jobDesc = state.data;
                  return HtmlView(
                    htmlString: _jobDesc.data.content,
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
