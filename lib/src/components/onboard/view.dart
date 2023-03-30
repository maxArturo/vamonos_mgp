import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:vamonos_mgp/src/adapters/filesystem/persisted_state_provider.dart';
import 'package:vamonos_mgp/src/components/common/widget_view.dart';
import 'package:vamonos_mgp/src/components/home/home.dart';
import 'package:vamonos_mgp/src/components/onboard/widget.dart';

class OnboardingPageView
    extends WidgetView<OnboardingPage, OnboardingPageController> {
  const OnboardingPageView(
    super.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe.builder(
          itemCount: state.pagesData.length,
          itemBuilder: (BuildContext context, int index) {
            return OnboardingPageWidget(data: state.pagesData[index]);
          },
          positionSlideIcon: 0.8,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          onPageChangeCallback: state.pageChangeCallback,
          waveType: WaveType.liquidReveal,
          liquidController: state.liquidController,
          fullTransitionValue: 880,
          enableSideReveal: true,
          enableLoop: false,
          ignoreUserGestureWhileAnimating: true,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List<Widget>.generate(state.pagesData.length, _buildDot),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 40),
            child: Consumer(builder: (context, ref, child) {
              return TextButton(
                onPressed: () async {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    await ref
                        .read(persistedStateProvider.notifier)
                        .setDemoShown();
                  });

                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.01),
                    foregroundColor: Colors.black),
                child: Text((state.isLastPage ? "ir al app" : "saltar intro")
                    .toUpperCase()),
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 40),
            child: TextButton(
              onPressed: () {
                if (state.isLastPage) {
                  return;
                }

                state.liquidController.jumpToPage(
                    page: state.liquidController.currentPage + 1 >
                            state.pagesData.length - 1
                        ? 0
                        : state.liquidController.currentPage + 1);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.01),
                  foregroundColor:
                      state.isLastPage ? Colors.grey : Colors.black),
              child: Text("Siguiente".toUpperCase()),
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((state.page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPageWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      data.assetLocation,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 40, 30),
                  child: Text(
                    data.text,
                    style: GoogleFonts.openSans(
                      fontSize:
                          MediaQuery.of(context).size.height > 600 ? 18 : 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
