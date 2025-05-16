import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ),
);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/choso2.jpg',
            title: 'Jujutsu Kaisen vol.7',
            description: 'A pesar de las heridas y pérdidas que sufrieron del ataque en el Evento de Buena Voluntad, los estudiantes del Colegio Técnico de Magia Metropolitana de Tokio y del Colegio de Jujutsu de Kioto tienen poco tiempo para descansar ya que la gente comienza a morir en circunstancias misteriosas.',
          ),
          makePage(
            page: 2,
            image: 'assets/images/re.jpg',
            title: 'Tokyo Ghoul RE vol.8',
            description: 'Haise está decidido a ayudar a sus viejos amigos a escapar de la prisión de Cochlea, no quiere lastimar a ninguno de sus compañeros del CCG. Pero su mentor, Kishou Arima, le quita la decision.',
          ),
          makePage(
            page: 3,
            image: 'assets/images/reo.jpg',
            title: 'BlueLock vol.8',
            description: 'Ante el equipo de Isagi y Nagi, al que acaba de unirse Barou, se encuentran Kunigami, Chigiri y Reo. ¡Si quieren estar a la altura, tendrán que conseguir desencadenar una reacción química durante el partido que les haga evolucionar!',
          ),
          makePage(
            page: 4,
            image: 'assets/images/re2.jpg',
            title: 'Tokyo Ghoul RE vol.2',
            description: 'Siendo medio ghoul, Haise Sasaki recibe la tarea de convertirse en el mentor de Urie, Shirazu, Mutsuki y Yonebayashi, miembros de los Quinx.',
          ),
        ],
      ),
    );
  }

  Widget makePage({required String image, required String title, required String description, required int page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeAnimation(
                    delay: 2,
                    child: Text(
                      page.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 1,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            child: const Icon(Icons.star, color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            child: const Icon(Icons.star, color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            child: const Icon(Icons.star, color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3),
                            child: const Icon(Icons.star, color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Icon(Icons.star, color: Colors.grey, size: 15),
                          ),
                          const Text('4.0', style: TextStyle(color: Colors.white70)),
                          const Text(
                            '(2300)',
                            style: TextStyle(color: Colors.white38, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeAnimation(
                      delay: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white70,
                            height: 1.9,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeAnimation(
                      delay: 2.5,
                      child: const Text(
                        'READ MORE',
                        style: TextStyle(
                          color: Colors.white70,
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _translateY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _translateY = Tween<double>(begin: 120.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(
      Duration(milliseconds: (500 * widget.delay).round()),
      () {
        if (mounted) _controller.forward();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, _translateY.value),
            child: widget.child,
          ),
        );
      },
      child: widget.child,
    );
  }
}