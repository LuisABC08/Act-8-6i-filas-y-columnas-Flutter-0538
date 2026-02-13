import 'package:flutter/material.dart';

void main() => runApp(const EasyDiet());

class EasyDiet extends StatelessWidget {
  const EasyDiet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyDiet',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212), // Gris más oscuro
      ),
      home: const PlanesFilaColumna(),
    );
  }
}

class PlanesFilaColumna extends StatelessWidget {
  const PlanesFilaColumna({super.key});

  IconData _getIconForMeal(String mealName) {
    switch (mealName) {
      case "Desayuno":
        return Icons.free_breakfast;
      case "Snack 1":
      case "Snack 2":
        return Icons.fastfood;
      case "Almuerzo":
        return Icons.lunch_dining;
      case "Cena":
        return Icons.dinner_dining;
      case "Postre":
        return Icons.cake;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Easy Diet",
          style: TextStyle(color: Colors.lime, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.lime),
            onPressed: () {}, // Acción para Planes
          ),
          IconButton(
            icon: const Icon(Icons.restaurant_menu, color: Colors.lime),
            onPressed: () {}, // Acción para Recetas
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Fila 1
              Expanded(child: _buildRow("Desayuno", "Snack 1")),
              const SizedBox(height: 16), // Separación entre filas
              // Fila 2
              Expanded(child: _buildRow("Almuerzo", "Snack 2")),
              const SizedBox(height: 16),
              // Fila 3
              Expanded(child: _buildRow("Cena", "Postre")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String text1, String text2) {
    return Row(
      children: [
        _buildMealContainer(text1),
        const SizedBox(width: 16),
        _buildMealContainer(text2),
      ],
    );
  }

  Widget _buildMealContainer(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[900], // Color de contenedor
          borderRadius: BorderRadius.circular(12),
         
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_getIconForMeal(text), color: Colors.lime, size: 40), // Color de ícono
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
