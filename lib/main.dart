import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ShortsScreen(),
    Center(child: Text('Subscriptions', style: TextStyle(fontSize: 24))),
    Center(child: Text('Library', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Library'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Welcome to Home Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ShortsScreen extends StatelessWidget {
  final List<String> imageUrls = [
    "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcTQ1MDNmaXgxeGJkcGJiMDZ2azB1Z3Y5MTN6M2owb24wNWk3dnJpcCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/De7VtxzbbpVWIr9kuv/giphy.gif",
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR5YuYtS9ZsJNPo57emMTfe8vNRl3JFvmcHcxbkqt4TF5SPfWIW',
    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR5YuYtS9ZsJNPo57emMTfe8vNRl3JFvmcHcxbkqt4TF5SPfWIW',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shorts', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(Icons.error, size: 100, color: Colors.red),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 100,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    Text('1.4M', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.thumb_down_alt_outlined, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    Text('4,095', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                    Text('19K', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: Row(
                  children: [
                    Text(
                      '"Plants can\'t speak',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.red,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   child: Text('Subscribe', style: TextStyle(color: Colors.white)),
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}