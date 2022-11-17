// import 'package:flutter/material.dart';
// import 'package:flutter_app_1/BlogCard.dart';
// import 'Blog.dart';
// import 'BlogBloc.dart';
// import 'BlogCard2.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// // bloc
//   final BlogBloc _blogBloc = BlogBloc();

//   @override
//   // imppp
//   void dispose() {
//     _blogBloc.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder<List<Blog>>(
//           stream: _blogBloc.blogListStream,
//           builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) => BlogCard2(snapshot.data![index]),
//             );
//           }),
//     );
//   }
// }
