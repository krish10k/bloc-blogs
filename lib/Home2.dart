import 'package:flutter/material.dart';
import 'package:flutter_app_1/BlogCard.dart';
import 'Blog.dart';
import 'BlogBloc.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
// bloc
  final BlogBloc _blogBloc = BlogBloc();

  @override
  // imppp
  void dispose() {
    _blogBloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Blog>>(
          stream: _blogBloc.blogListStream,
          builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(32),
                    child: Row(
                      children: [
                        CircleImage(snapshot.data![index].url ??
                            'https://cdn.staticmb.com/magicservicestatic/images/pincode/city/web/Mumbai.png'),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(bottom: 8, left: 5),
                                child: Text(
                                  snapshot.data![index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
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
                                Text('${snapshot.data![index].rating ?? 50}'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => {
                                    _blogBloc.blogRatingIncrement
                                        .add(snapshot.data![index]),
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
                                    _blogBloc.blogRatingDecrement
                                        .add(snapshot.data![index]),
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
                });
          }),
    );
  }
}

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
