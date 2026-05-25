import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const OctaPadProApp());
}

class OctaPadProApp extends StatelessWidget {
  const OctaPadProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sambalpuri OctaPad Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D15),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE040FB),
          secondary: Color(0xFF00E5FF),
          surface: Color(0xFF1A1A2E),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/pad': (context) => const OctaPadScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0D0D15), Color(0xFF1A1A2E)],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'OCTAPAD PRO',
                  style: GoogleFonts.orbitron(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white70),
                    onPressed: () {},
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Banner
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6200EA), Color(0xFF00B8D4)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6200EA).withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -30,
                              top: -20,
                              child: Icon(
                                Icons.music_note,
                                size: 150,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'SAMBALPURI\nCULTURE',
                                    style: GoogleFonts.orbitron(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Experience the ultimate folk beats',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Start Button
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/pad'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE040FB),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 10,
                          shadowColor: const Color(0xFFE040FB).withOpacity(0.5),
                        ),
                        child: Text(
                          'START PLAYING',
                          style: GoogleFonts.orbitron(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Text(
                        'Trending Categories',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2.5,
                        children: [
                          _buildCategoryCard('Sambalpuri', Icons.festival, const Color(0xFFFF5252)),
                          _buildCategoryCard('DJ Remix', Icons.album, const Color(0xFF448AFF)),
                          _buildCategoryCard('Meme Sounds', Icons.emoji_emotions, const Color(0xFFFFD740)),
                          _buildCategoryCard('Bass Drop', Icons.speaker, const Color(0xFF69F0AE)),
                          _buildCategoryCard('Trap Beats', Icons.whatshot, const Color(0xFFFF4081)),
                          _buildCategoryCard('EDM', Icons.headphones, const Color(0xFF18FFFF)),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF232336),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class OctaPadScreen extends StatefulWidget {
  const OctaPadScreen({super.key});

  @override
  State<OctaPadScreen> createState() => _OctaPadScreenState();
}

class _OctaPadScreenState extends State<OctaPadScreen> {
  final List<Color> _padColors = [
    const Color(0xFFFF1744), const Color(0xFFD500F9), const Color(0xFF00E5FF), const Color(0xFF00E676),
    const Color(0xFFFF9100), const Color(0xFF2979FF), const Color(0xFFFFEA00), const Color(0xFFF50057),
    const Color(0xFF00B0FF), const Color(0xFF1DE9B6), const Color(0xFFFF3D00), const Color(0xFF651FFF),
    const Color(0xFF76FF03), const Color(0xFFFF4081), const Color(0xFF00E5FF), const Color(0xFFFF1744),
  ];
  
  final List<String> _padLabels = [
    'Kick', 'Snare', 'Hi-Hat', 'Crash',
    'Dhol 1', 'Dhol 2', 'Tasa', 'Nishan',
    'Bass', 'Drop', 'Synth', 'FX',
    'Vocal', 'Scratch', 'Horn', 'Boom'
  ];

  final Set<int> _activePads = {};

  void _onPadDown(int index) {
    setState(() {
      _activePads.add(index);
    });
    // Add real sound playback logic here later
  }

  void _onPadUp(int index) {
    setState(() {
      _activePads.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'SAMBALPURI BEATS',
                    style: GoogleFonts.orbitron(
                      color: const Color(0xFF00E5FF),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fiber_manual_record, color: Colors.redAccent),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.loop, color: Colors.white70),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            
            // Visualizer area placeholder
            Container(
              height: isPortrait ? 60 : 40,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0D0D15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  30,
                  (index) => Container(
                    width: 4,
                    height: _activePads.isNotEmpty ? 10 + (index % 5) * 8.0 : 4,
                    decoration: BoxDecoration(
                      color: _activePads.isNotEmpty ? const Color(0xFF00E5FF) : Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),

            // Pads
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = isPortrait ? 4 : 8;
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: isPortrait ? 1.0 : 1.2,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTapDown: (_) => _onPadDown(index),
                          onTapUp: (_) => _onPadUp(index),
                          onTapCancel: () => _onPadUp(index),
                          child: _buildPad(index),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPad(int index) {
    final bool isActive = _activePads.contains(index);
    final Color baseColor = _padColors[index];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      decoration: BoxDecoration(
        color: isActive ? baseColor : const Color(0xFF2A2A3D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? Colors.white : baseColor.withOpacity(0.5),
          width: isActive ? 2 : 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: baseColor.withOpacity(0.8),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ]
            : [
                BoxShadow(
                  color: baseColor.withOpacity(0.1),
                  blurRadius: 5,
                )
              ],
      ),
      child: Center(
        child: Text(
          _padLabels[index],
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: isActive ? Colors.black : Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
