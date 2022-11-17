import 'package:flutter/material.dart';
import 'package:flutter_app_1/Blog.dart';

class BlogCard extends StatelessWidget {
  // final String title, details, url;
  // dynamic rating; // or int
  final Blog blog;
  BlogCard(this.blog);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          CircleImage(blog?.url ??
              'https://cdn.staticmb.com/magicservicestatic/images/pincode/city/web/Mumbai.png'),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "Descriptionnn ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 66, 62, 62),
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 138, 90, 235),
                  ),
                  Text('${blog.rating ?? 50}'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => ,
                      //   ),
                      // ),
                    },
                    child: Icon(
                      Icons.arrow_upward_sharp,
                      size: 25.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  GestureDetector(
                    onTap: () => {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => ,
                      //   ),
                      // ),
                    },
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      size: 25.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

// https://cdn.staticmb.com/magicservicestatic/images/pincode/city/web/Mumbai.png

class CircleImage extends StatelessWidget {
  final String renderUrl;
  CircleImage(this.renderUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl),
        ),
      ),
    );
  }
}
