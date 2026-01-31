import 'package:flutter/material.dart';

void main() {
  runApp(const ReyesApp());
}

class ReyesApp extends StatelessWidget {
  const ReyesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter Joselyn',
      debugShowCheckedModeBanner: false,
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  bool opcionActiva = false;

  void mostrarSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Persigue tus sueños con pasión y determinación!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Inicio'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Text(
              'Aplicación Flutter Joselyn Reyes',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),

            /// WIDGET NUEVO
            SwitchListTile(
              title: const Text('Activar opción'),
              value: opcionActiva,
              onChanged: (bool valor) {
                setState(() {
                  opcionActiva = valor;
                });
              },
            ),

            if (opcionActiva) ...<Widget>[
              const SizedBox(height: 20),
              // Display image when option is active
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: mostrarSnack,
              child: const Text('Mostrar mensaje'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SegundaPage(),
                  ),
                );
              },
              child: const Text('Ir a segunda pantalla'),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPage extends StatefulWidget {
  const SegundaPage({super.key});

  @override
  State<SegundaPage> createState() => _SegundaPageState();
}

class _SegundaPageState extends State<SegundaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Esta es la segunda pantalla! Sigue explorando y creando maravillas.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Vista'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Esta es la segunda pantalla de mi proyecto',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}