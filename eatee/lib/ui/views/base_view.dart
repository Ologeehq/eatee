import 'package:eatee/core/providers/base_provider.dart';
import 'package:eatee/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseProvider> extends StatefulWidget {
  final Widget Function(BuildContext context, T provider, Widget child) builder;
  final Function(T) onProviderReady;
  final Function(T) onProviderDisposed;
  BaseView(
      {Key key,
      @required this.builder,
      this.onProviderDisposed,
      this.onProviderReady})
      : super(key: key);
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseProvider> extends State<BaseView<T>> {
  T provider = locator<T>();
  @override
  void initState() {
    super.initState();
    if (widget.onProviderReady != null) widget.onProviderReady(provider);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: provider,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.onProviderDisposed != null) widget.onProviderDisposed(provider);
    super.dispose();
  }
}
