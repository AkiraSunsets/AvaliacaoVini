import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CardProjeto extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String descricao;
  final String imagemUrl;
  final List<String> tags;
  final String? link;
  final String participantes;

  const CardProjeto({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.descricao,
    required this.imagemUrl,
    required this.tags,
    this.link,
    this.participantes = '1',
  });

  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw Exception('Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth < 350 ? 12.0 : 20.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF14162A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3A2DFF).withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.network(
              imagemUrl,
              width: double.infinity,
              height: screenWidth < 350 ? 140 : 180,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 15),

          // Header: Título e Badge
          Row(
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth < 350 ? 18 : 22,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A2DFF).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(0xFF3A2DFF)),
                ),
                child: Row(
                  children: [
                    Text(
                      participantes,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.people_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            subtitulo,
            style: const TextStyle(
              color: Color(0xFF00D2FF),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            descricao,
            style: TextStyle(
              color: const Color(0xFFCBD5E1),
              fontSize: screenWidth < 350 ? 13 : 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 15),

          // Tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7928CA).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xFF7928CA).withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 10,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 10),

          // Footer: Link
          link != null
              ? InkWell(
                  onTap: () => _abrirLink(link!),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Code',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 350 ? 14 : 16,
                          color: const Color(0xFFFF0C92),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.code,
                        color: Color(0xFFFF0C92),
                        size: 18,
                      ),
                    ],
                  ),
                )
              : const Row(
                  children: [
                    Text(
                      'Projeto privado',
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.lock, color: Colors.white54, size: 14),
                  ],
                ),
        ],
      ),
    );
  }
}
