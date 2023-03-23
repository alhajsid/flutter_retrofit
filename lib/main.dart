import 'package:flutter/material.dart';
import 'package:flutter_retrofit/service.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alhaj"),
        ),
        body: _buildBody(context));
  }

  FutureBuilder<List<Rockets>> _buildBody(BuildContext context) {
    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Rockets>>(
      future: client.getRockets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Rockets> posts = snapshot.data!;
          List<Rockets> temp = [];
          temp.addAll(posts);
          temp.addAll(posts);
          temp.addAll(posts);
          temp.addAll(posts);
          return _buildPosts(context, temp);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<Rockets> tasks) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: tasks.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        for (final i in tasks[index].flickr_images!) {
          print(i);
        }
        return Row(
          children: [
            ClipOval(
              child: FadeInImage(
                image: NetworkImage(tasks[index].flickr_images?.first ??
                    "https://img.freepik.com/premium-vector/update-concept-application-loading-process-symbol-web-screen-vector-illustration-flat_186332-1253.jpg"),
                width: 100,
                height: 100,
                placeholder: AssetImage("assets/images/error.png"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks[index].name ?? "",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  tasks[index].country ?? "",
                ),
              ],
            ),
          ],
        );
      }, separatorBuilder: (BuildContext context, int index) =>SizedBox(
      height: 10,
    ),
    );
  }
}
