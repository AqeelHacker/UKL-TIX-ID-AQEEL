import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.95);
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  final List<String> _imagePaths = [
    'assets/slider1.jpeg',
    'assets/slider2.jpeg',
    'assets/slider3.jpeg',
    'assets/slider4.jpeg',
    'assets/slider6.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Reset ke slide pertama
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background slider tetap konstan
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: const Color(0xFF001A4D), 
            borderRadius: BorderRadius.circular(10), 
          ),
        ),

        Column(
          children: [
            // Slider dengan jarak antar item
            AspectRatio(
              aspectRatio: 6 / 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20), // Jarak antar slider
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(12.0), // Membulatkan gambar
                      child: Image.asset(
                        _imagePaths[index],
                        fit: BoxFit.cover, // Menyesuaikan gambar
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8.0),

            // Indicator slider
            SmoothPageIndicator(
              controller: _pageController,
              count: _imagePaths.length,
              effect: WormEffect(
                activeDotColor:
                    const Color.fromARGB(255, 233, 144, 10).withOpacity(1),
                dotColor: const Color.fromARGB(255, 255, 255, 255),
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
