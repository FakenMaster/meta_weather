import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_weather/pages/search_location/bloc/search_bloc.dart';
import 'package:meta_weather/pages/search_location/search_empty_widget.dart';
import 'package:meta_weather/pages/search_location/search_error_widget.dart';
import 'package:meta_weather/pages/search_location/search_loading_widget.dart';
import 'package:meta_weather/pages/search_location/search_location_result_widget.dart';

import 'search_intro_widget.dart';

class SearchLocationWidget extends StatefulWidget {
  @override
  _SearchLocationWidgetState createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  SearchLocationBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = SearchLocationBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchState>(
      stream: bloc.state,
      builder: (context, snapshot) {
        final state = snapshot.data;
        return Scaffold(
            body: Stack(
          children: [
            Flex(direction: Axis.vertical, children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '搜索地名',
                  ),
                  style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: "Hind",
                    decoration: TextDecoration.none,
                  ),
                  onChanged: bloc.onTextChanged.add,
                ),
              ),
              Divider(color: Colors.red,height: 1,),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildChild(state),
                ),
              )
            ])
          ],
        ));
      },
    );
  }

  Widget _buildChild(SearchState state) {
    if (state is SearchNoTerm) {
      return SearchIntro();
    } else if (state is SearchEmpty) {
      return EmptyWidget();
    } else if (state is SearchLoading) {
      return LoadingWidget();
    } else if (state is SearchError) {
      return SearchErrorWidget();
    } else if (state is SearchPopulated) {
      return SearchLocationResultWidget(state.result);
    }

    throw Exception('${state.runtimeType} is not supported');
  }
}
