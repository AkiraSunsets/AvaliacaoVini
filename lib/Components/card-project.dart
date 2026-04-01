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
    double internalPadding = screenWidth < 350 ? 12.0 : 15.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(internalPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF14162A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF3A2DFF).withOpacity(0.2),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.network(
              imagemUrl,
              width: double.infinity,
              height: screenWidth < 350 ? 100 : 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth < 350 ? 18 : 20,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A2DFF).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(0xFF3A2DFF).withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Text(participantes, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(width: 4),
                    const Icon(Icons.people_rounded, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ],
          ),
          Text(
            subtitulo,
            style: const TextStyle(
              color: Color(0xFF00D2FF),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            descricao,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFFCBD5E1),
              fontSize: screenWidth < 350 ? 13 : 14,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags.take(5).map((tag) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF7928CA).withOpacity(0.15),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xFF7928CA).withOpacity(0.3)),
              ),
              child: Text(
                tag,
                style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 10),
              ),
            )).toList(),
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.white10, height: 1),
          const SizedBox(height: 12),
          link != null
              ? InkWell(
                  onTap: () => _abrirLink(link!),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Code',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFFFF0C92),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.code, color: Color(0xFFFF0C92), size: 18),
                    ],
                  ),
                )
              : Row(
                  children: [
                    Text('Projeto privado', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 13)),
                    const SizedBox(width: 6),
                    Icon(Icons.lock, color: Colors.white.withOpacity(0.4), size: 14),
                  ],
                ),
        ],
      ),
    );
  }
}