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
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF14162A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF3A2DFF).withOpacity(0.3),
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.network(
                imagemUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            
            // Título
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A2DFF).withOpacity(0.2), // 
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xFF3A2DFF)),
                  ),
                  child: Row(
                    children: [
                      Text(participantes, style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 5),
                      const Icon(Icons.people_rounded, color: Colors.white, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Subtítulo 
            Text(
              subtitulo,
              style: const TextStyle(
                color: Color(0xFF00D2FF), 
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            
            // Descrição
            Text(
              descricao,
              style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF7928CA).withOpacity(0.2), 
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: const Color(0xFF7928CA).withOpacity(0.3)),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 12),
                ),
              )).toList(),
            ),
            
            const Spacer(),
            const Divider(color: Colors.white12),
            const SizedBox(height: 10),
            
            // Link de Ação
            link != null
                ? GestureDetector(
                    onTap: () => _abrirLink(link!),
                    child: const Row(
                      children: [
                        Text(
                          'View Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFFF0C92), 
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.code, color: Color(0xFFFF0C92), size: 20),
                      ],
                    ),
                  )
                : const Row(
                    children: [
                      Text(
                        'Projeto privado',
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.lock, color: Colors.white54, size: 18),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}