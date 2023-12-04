import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.all(10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 20.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: double.infinity,
                              height:
                                  40.0, // Increased height for title shimmer effect
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: 100.0,
                              height: 12.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        width: 100,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(12.0), // Set border radius
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
