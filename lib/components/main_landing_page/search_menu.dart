import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamonos_mgp/components/common/widget_view.dart';
import 'package:vamonos_mgp/components/main_landing_page/home/home_provider.dart';

class SearchMenu extends StatefulWidget {
  final ScrollController scrollController;
  const SearchMenu(this.scrollController, {super.key});

  @override
  SearchMenuController createState() => SearchMenuController();
}

class SearchMenuController extends State<SearchMenu> {
  dismissSearchBarListener() {
    final offset = widget.scrollController.offset;

    if ((-offset) > MediaQuery.of(context).size.height / 6) {
      Provider.of<HomeComponentProvider>(context, listen: false)
          .setDisplayedPanel(BottomPanel.routeList);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(dismissSearchBarListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(dismissSearchBarListener);
  }

  @override
  Widget build(BuildContext context) {
    return SearchMenuView(this);
  }
}

class SearchMenuView extends WidgetView<SearchMenu, SearchMenuController> {
  const SearchMenuView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        controller: widget.scrollController,
        itemBuilder: (context, idx) {
          if (idx == 0) {
            return const SizedBox(height: 50);
          } else if (idx < 10) {
            return TextField(
              decoration: InputDecoration(hintText: "This is input no $idx"),
            );
          } else {
            return ListTile(title: Text("Sample option $idx"));
          }
        });
  }
}
