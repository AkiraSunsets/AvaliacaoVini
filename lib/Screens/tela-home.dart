import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F24),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // HEADER
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF0B1023),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Color(0xFF676767),
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'KA',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.menu, color: Colors.white, size: 40),
                ],
              ),
            ),
          ),

          const SizedBox(height: 60),

          // FOTO
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 290,
                height: 290,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0xFF873693),
                      offset: Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(300),
                  border: Border.all(color: const Color(0xFF873693), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    'https://akira-sunsets-portfolio.vercel.app/assets/img/foto.jpg',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // TEXTOS
          Column(
            children: [
              const Text(
                "Hello I'm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              GradientText(
                "Ketlyn Araújo",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                colors: const [Color(0xFFBF0C6D), Color(0xFF3A2DFF)],
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Text(
            "Web Developer | Frontend - UX/UI",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 50),

          //Section button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFDA0067), Color(0xFF6919AB)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),

                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "See More",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
