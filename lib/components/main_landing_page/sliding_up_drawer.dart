import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/components/main_landing_page/home/home_provider.dart';
import 'package:vamonos_mgp/components/main_landing_page/routes_near_you_list/widget.dart';
import 'package:vamonos_mgp/components/main_landing_page/search_menu.dart';

class SlidingUpDrawer extends StatefulWidget {
  final ScrollController sc;

  const SlidingUpDrawer(
    this.sc, {
    super.key,
  });

  @override
  SlidingUpDrawerController createState() => SlidingUpDrawerController();
}

class SlidingUpDrawerController extends State<SlidingUpDrawer> {
  double _verticalDragStart = 0.0;
  double _verticalDragEnd = 0.0;
  late Widget _currentlyDisplayedWidget;

  get verticalDragStart => _verticalDragStart;
  get verticalDragEnd => _verticalDragEnd;
  get currentlyDisplayedWidget => _currentlyDisplayedWidget;

  setVerticalDragStart(double location) =>
      setState(() => _verticalDragStart = location);

  setVerticalDragEnd(double location) =>
      setState(() => _verticalDragEnd = location);

  @override
  Widget build(BuildContext context) {
    return SlidingUpDrawerView(this);
  }
}

class SlidingUpDrawerView
    extends WidgetView<SlidingUpDrawer, SlidingUpDrawerController> {
  const SlidingUpDrawerView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onVerticalDragDown: (details) {
          final dragDownDy = details.globalPosition.dy;
          debugPrint("drag down dy is: $dragDownDy");

          state.setVerticalDragStart(details.globalPosition.dy);

          Provider.of<HomeComponentProvider>(context, listen: false)
              .setSearchBarFocused(false);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onVerticalDragUpdate: (details) {
          final dy = details.globalPosition.dy;
          debugPrint("drag update dy is: $dy");
          state.setVerticalDragEnd(dy);
        },
        onVerticalDragEnd: (details) {
          final end = state.verticalDragEnd;
          debugPrint("final drag end is: $end");

          final delta = state.verticalDragEnd - state.verticalDragStart;
          debugPrint("final drag delta is: $delta");
          if ((state.verticalDragEnd - state.verticalDragStart >=
                  MediaQuery.of(context).size.height / 6) &&
              Provider.of<HomeComponentProvider>(context, listen: false)
                      .displayedPanel ==
                  BottomPanel.searchMenu) {
            Provider.of<HomeComponentProvider>(context, listen: false)
                .setDisplayedPanel(BottomPanel.routeList);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Consumer<HomeComponentProvider>(
            builder: (context, provider, child) {
          switch (provider.displayedPanel) {
            case BottomPanel.routeList:
              state._currentlyDisplayedWidget = RoutesNearYouList(widget.sc);
              return RoutesNearYouList(widget.sc);
            // break;
            case BottomPanel.searchMenu:
              // state._currentlyDisplayedWidget = SearchMenu(widget.sc);
              return SearchMenu(widget.sc);
            // break;
            default:
              throw UnsupportedError("invalid panel provided");
          }
          // final allegedKey =
          //     provider.displayedPanel == BottomPanel.routeList ? 0 : 1;
          // debugPrint("sigh alleged key $allegedKey");
          // return AnimatedSwitcher(
          //     duration: const Duration(seconds: 1),
          //     transitionBuilder: (Widget child, Animation<double> animation) {
          //       return ScaleTransition(scale: animation, child: child);
          //     },
          //     child: Text(
          //       provider.displayedPanel.toString(),
          //       style: const TextStyle(fontSize: 80),
          //       key: ValueKey(
          //           provider.displayedPanel == BottomPanel.routeList ? 0 : 1),
          //     ));
        }));
  }
}
