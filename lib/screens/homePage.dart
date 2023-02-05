import 'package:flutter/material.dart';
import 'package:nagp_quizup/screens/loginPage.dart';
import 'package:nagp_quizup/screens/quizPage.dart';
import 'package:nagp_quizup/screens/userProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.emailAddress});

  final String title;
  final String emailAddress;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select the Quiz",
                style: TextStyle(fontSize: 28),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3 - 80,
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                    onPressed: () {
                      print('python btn pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const QuizPage(quiz: 'python')),
                      );
                    },
                    child: const Text("Python")),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3 - 80,
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                    onPressed: () {
                      print('btn AWS pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage(quiz: 'aws')),
                      );
                    },
                    child: const Text("AWS")),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3 - 80,
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                    onPressed: () {
                      print('btn GOT pressed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage(quiz: 'got')),
                      );
                    },
                    child: const Text("GOT")),
              ),
            ],
          )),
          Center(
            child: Text("ssshhhh.. we've answers"),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            icon: Icon(Icons.question_answer),
          ),
          Tab(
            icon: Icon(Icons.arrow_right_outlined),
          ),
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'NAGP Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                print(' open the profile page');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => UserProfilePage(
                //           title: "Profile", email: widget.emailAddress)),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('About us'),
            ),
          ],
        ),
      ),
    );
  }
}
