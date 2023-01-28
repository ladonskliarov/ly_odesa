import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderEventsWidget extends StatefulWidget {
  final List<String> urlListImages;
  const SliderEventsWidget({required this.urlListImages, Key? key}) : super(key: key);

  @override
  State<SliderEventsWidget> createState() => _SliderEventsWidgetState();
}

class _SliderEventsWidgetState extends State<SliderEventsWidget> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      width: double.infinity,
      height: 250,
      child: Stack(
          children: [
            PageView.builder(
                itemCount: widget.urlListImages.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.urlListImages[index],
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child:
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },
                  );
                }
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 20,
                  activeDotColor: Colors.white,
                ),
                controller: _pageController,
                count: widget.urlListImages.length,
              ),
            )
          ]
      ),
    );
  }
}