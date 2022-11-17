import 'dart:async';
import 'Blog.dart';

class BlogBloc {
  List<Blog> _blogList = [
    Blog(1, "Why fluuter is imp", 8,
        "https://ik.imagekit.io/988yjzaslk/blog-1.jpeg"),
    Blog(2, "All u need to know abt react native", 7,
        "https://ik.imagekit.io/988yjzaslk/blog-2.jpeg"),
    Blog(3, "what are pros of NextJs", 9,
        "https://ik.imagekit.io/988yjzaslk/blog-1.jpeg"),
    Blog(4, "All u need to know about aws", 6,
        "https://ik.imagekit.io/988yjzaslk/blog-2.jpeg")
  ];

// sink for adding and stream for getting the data

// increment n dec of rating
  final _blogListStreamController = StreamController<List<Blog>>();
  final _blogRatingIncrementStreamController = StreamController<Blog>();
  final _blogRatingDecrementStreamController = StreamController<Blog>();

  // getters
  Stream<List<Blog>> get blogListStream => _blogListStreamController.stream;

// sink
  StreamSink<List<Blog>> get blogListSink => _blogListStreamController.sink;

  StreamSink<Blog> get blogRatingIncrement =>
      _blogRatingIncrementStreamController.sink;

  StreamSink<Blog> get blogRatingDecrement =>
      _blogRatingDecrementStreamController.sink;

// constructor
  BlogBloc() {
    _blogListStreamController.add(_blogList);
    _blogRatingIncrementStreamController.stream.listen(_incrementRating);
    _blogRatingDecrementStreamController.stream.listen(_decrementRating);
  }

// core functions
  _incrementRating(Blog blog) {
    int rating = blog.rating;
// any logic needed
    int updatedRating = rating + 1;
// updating in list
    _blogList[blog.id - 1].rating = updatedRating;
    blogListSink.add(_blogList);
// updated the sink with new modified list !
  }

  _decrementRating(Blog blog) {
    int rating = blog.rating;
    int updatedRating = rating - 1;
// updating in list
    _blogList[blog.id - 1].rating = updatedRating;
    blogListSink.add(_blogList);
// updated the sink with new modified list !
  }

// free up resourses
  void dispose() {
    _blogRatingIncrementStreamController.close();
    _blogRatingDecrementStreamController.close();
    _blogListStreamController.close();
// closed all active streams
  }
}
