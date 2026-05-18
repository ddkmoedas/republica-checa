import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAppEscolar());
}

class MeuAppEscolar extends StatelessWidget {
  const MeuAppEscolar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'República Checa',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Segoe UI',
      ),
      home: const PaginaMapaInterativo(),
    );
  }
}

class PaginaMapaInterativo extends StatefulWidget {
  const PaginaMapaInterativo({super.key});

  @override
  State<PaginaMapaInterativo> createState() => _PaginaMapaInterativoState();
}

class _PaginaMapaInterativoState extends State<PaginaMapaInterativo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent.withValues(alpha: 0.08),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withValues(alpha: 0.08),
                      blurRadius: 80,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // O bloco "TRABALHO DE GEOGRAFIA" foi removido daqui!
                    const Text(
                      "Descobre a República Checa",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Passa o cursor sobre a República Checa e clica para ver os detalhes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 50),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaginaDetalhesRepublicaCheca(),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: _isHovered ? Colors.redAccent : Colors.white10,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _isHovered 
                                    ? Colors.redAccent.withValues(alpha: 0.3) 
                                    : Colors.black.withValues(alpha: 0.2),
                                blurRadius: _isHovered ? 30 : 15,
                                spreadRadius: _isHovered ? 5 : 1,
                                offset: Offset(0, _isHovered ? 12 : 5),
                              )
                            ],
                          ),
                          transform: Matrix4.translationValues(0.0, _isHovered ? -15.0 : 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    _isHovered 
                                        ? Colors.redAccent.withValues(alpha: 0.4) 
                                        : Colors.transparent,
                                    BlendMode.colorBurn,
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1528812969535-4bcefc071532?q=80&w=800&auto=format&fit=crop',
                                    height: 320,
                                    width: 500,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 320,
                                        width: 500,
                                        color: Colors.white10,
                                        child: const Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.map, size: 80, color: Colors.redAccent),
                                              SizedBox(height: 10),
                                              Text("🇨🇿 Imagem da República Checa", style: TextStyle(color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _isHovered ? Colors.redAccent : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    _isHovered 
                                        ? "REPÚBLICA CHECA SELECIONADA (CLICA!)" 
                                        : "REPÚBLICA CHECA",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: _isHovered ? Colors.redAccent : Colors.white,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaDetalhesRepublicaCheca extends StatelessWidget {
  const PaginaDetalhesRepublicaCheca({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> estatisticas = [
      {"label": "Capital", "valor": "Praga", "icon": "🏛️"},
      {"label": "União Europeia", "valor": "Entrada em 2004", "icon": "🇪🇺"},
      {"label": "Moeda", "valor": "Coroa Tcheca (CZK)", "icon": "🪙"},
      {"label": "Superfície", "valor": "Cerca de 78 000 km²", "icon": "🗺️"},
      {"label": "População", "valor": "Cerca de 10,8 Milhões", "icon": "👥"},
      {"label": "Língua Oficial", "valor": "Checo", "icon": "🗣️"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Voltar ao Mapa", style: TextStyle(fontSize: 16, color: Colors.grey)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "REPÚBLICA CHECA",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
                const SizedBox(width: 15),
                Text("🇨🇿", style: TextStyle(fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize)),
              ],
            ),
            const Text(
              "O Coração Geográfico da Europa Central",
              style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40),
            const Text(
              "Factos Gerais",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            LayoutBuilder(
              builder: (context, constraints) {
                int colunas = constraints.maxWidth > 900 ? 3 : 2;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: colunas,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 2.8,
                  ),
                  itemCount: estatisticas.length,
                  itemBuilder: (context, index) {
                    final item = estatisticas[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: Row(
                        children: [
                          Text(item["icon"]!, style: const TextStyle(fontSize: 32)),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["label"]!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                const SizedBox(height: 4),
                                Text(
                                  item["valor"]!,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 50),
            const Text(
              "Tradições e Curiosidades",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _construirCardCuriosidade(
                          titulo: "A Cidade das Cem Torres",
                          descricao: "Praga é conhecida internacionalmente pelo grande número de igrejas, castelos medievais e edifícios históricos que desenham uma silhueta inesquecível no céu.",
                          imageUrl: 'https://images.unsplash.com/photo-1541849546-216549ae216d?q=80&w=600&auto=format&fit=crop',
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: _construirCardCuriosidade(
                          titulo: "Cultura Cervejeira",
                          descricao: "Berço da lendária Pilsner, a República Checa possui uma tradição milenar de produção e orgulha-se de liderar o consumo de cerveja per capita do mundo.",
                          imageUrl: 'https://images.unsplash.com/photo-1532634922-8fe0b757fb13?q=80&w=600&auto=format&fit=crop',
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _construirCardCuriosidade(
                        titulo: "A Cidade das Cem Torres",
                        descricao: "Praga é conhecida internacionalmente pelo grande número de igrejas, castelos medievais e edifícios históricos que desenham uma silhueta inesquecível no céu.",
                        imageUrl: 'https://images.unsplash.com/photo-1541849546-216549ae216d?q=80&w=600&auto=format&fit=crop',
                      ),
                      const SizedBox(height: 30),
                      _construirCardCuriosidade(
                        titulo: "Cultura Cervejeira",
                        descricao: "Berço da lendária Pilsner, a República Checa possui uma tradição milenar de produção e orgulha-se de liderar o consumo de cerveja per capita do mundo.",
                        imageUrl: 'https://images.unsplash.com/photo-1532634922-8fe0b757fb13?q=80&w=600&auto=format&fit=crop',
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🎄 Tradição Imperdível: Mercados de Natal",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "O mercado de Natal em Praga é mundialmente famoso. As praças históricas cobrem-se de luzes cintilantes, barraquinhas de artesanato local e o aroma a Trdelník que aquece o inverno europeu.",
                    style: TextStyle(fontSize: 16, color: Colors.white, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _construirCardCuriosidade({
    required String titulo,
    required String descricao,
    required String imageUrl,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.white.withValues(alpha: 0.1),
                child: const Icon(Icons.image, size: 50, color: Colors.white24),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  descricao,
                  style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}