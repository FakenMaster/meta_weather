import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta_weather/model/location.dart';
import 'package:meta_weather/pages/search_location/search_error_widget.dart';
import 'package:meta_weather/pages/search_location/search_loading_widget.dart';
import 'package:meta_weather/pages/weather_detail/bloc/weather_bloc.dart';
import 'package:meta_weather/pages/weather_detail/weather_detail_list_widget.dart';
import 'package:meta_weather/service/http.dart';

class WeatherDetailWidget extends StatefulWidget {
  final Location location;
  WeatherDetailWidget(this.location);
  @override
  _WeatherDetailWidgetState createState() => _WeatherDetailWidgetState();
}

class _WeatherDetailWidgetState extends State<WeatherDetailWidget> {
  WeatherBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = WeatherBloc();
    bloc.add(WeatherLoadEvent(widget.location.woeid));
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${widget.location?.title ?? ''}'),
          ),
          body: _buildChild(snapshot.data),
        );
      },
    );
  }

  Widget _buildChild(WeatherDetailState state) {
    if (state is WeatherLoadingState) {
      return LoadingWidget();
    } else if (state is WeatherErrorState) {
      return SearchErrorWidget();
    } else if (state is WeatherResultState) {
      return WeatherDetailListWidget(state.result.consolidatedWeather);
    }
    return Container();
  }
}
