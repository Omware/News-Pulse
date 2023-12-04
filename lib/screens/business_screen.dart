// import 'package:flutter/material.dart';
// import 'package:newsapp/service/news_service.dart';
// import 'package:newsapp/widgets/news_card.dart';
// import 'package:newsapp/widgets/news_card_shimmer.dart';

// class BusinessNewsScreen extends StatefulWidget {
//   const BusinessNewsScreen({super.key});

//   @override
//   State<BusinessNewsScreen> createState() => _BusinessNewsScreenState();
// }

// class _BusinessNewsScreenState extends State<BusinessNewsScreen> {
//   var newsService = NewsService();

//   @override
//   void initState() {
//     newsService.getBusiness();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: newsService.getBusiness(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const ShimmerLoader();
//             }

//             if (snapshot.hasError) {

//             }

//             if (snapshot.data!.isEmpty) {
//               return const Center(
//                 child: Text('No articles found'),
//               );
//             }

//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (ctx, index) => NewsCard(
//                       article: snapshot.data![index],
//                     ));
//           }),
//     );
//   }
// }
