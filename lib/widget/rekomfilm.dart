import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecommendationSection extends StatefulWidget {
  final List<Map<String, dynamic>> filmData;

  const RecommendationSection({super.key, required this.filmData});

  @override
  State<RecommendationSection> createState() => _RecommendationSectionState();
}

class _RecommendationSectionState extends State<RecommendationSection> {
  final PageController _sliderController = PageController(viewportFraction: 0.9);
  int _currentSlide = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _sliderController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentSlide < widget.filmData.length - 1) {
        _currentSlide++;
      } else {
        _currentSlide = 0;
      }
      _sliderController.animateToPage(
        _currentSlide,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400, // Tinggi slider untuk potret
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blueGrey, // Warna latar belakang di sini
            ),
            child: PageView.builder(
              controller: _sliderController,
              itemCount: widget.filmData.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentSlide = index;
                });
              },
              itemBuilder: (context, index) {
                final film = widget.filmData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      // Card Background
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          film['imagePath'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),

                      // Overlay untuk informasi
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                film['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "⭐ ${film['rating']} dari penonton!",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE9900A),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  print("Tiket untuk ${film['title']} dibeli");
                                },
                                child: const Text("Beli Tiket"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          color: const Color(0xFF001A4D), 
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: SmoothPageIndicator(
              controller: _sliderController,
              count: widget.filmData.length,
              effect: const WormEffect(
                activeDotColor: Color(0xFFE9900A),
                dotColor: Colors.white,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
