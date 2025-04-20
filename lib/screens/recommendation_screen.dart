import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationScreen extends StatefulWidget {
  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final List<Map<String, dynamic>> sites = [
    {
      'name': 'Flutter',
      'url': 'https://flutter.dev',
      'image':
          'https://static-00.iconduck.com/assets.00/flutter-original-icon-414x512-j8mz4eu9.png',
      'favorite': false,
    },
    {
      'name': 'Dart',
      'url': 'https://dart.dev',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
      'favorite': false,
    },
    {
      'name': 'W3Schools',
      'url': 'https://w3schools.com',
      'image': 'https://avatars.githubusercontent.com/u/77673807?v=4',
      'favorite': false,
    },
  ];

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membuka link')),
      );
    }
  }

  void _toggleFavorite(int index) {
    setState(() {
      sites[index]['favorite'] = !(sites[index]['favorite'] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rekomendasi Situs')),
      body: ListView.builder(
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                site['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 50),
              ),
              title: Text(site['name']),
              subtitle: Text(site['url']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.open_in_browser),
                    onPressed: () => _launchUrl(context, site['url']),
                  ),
                  IconButton(
                    icon: Icon(
                      site['favorite'] ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => _toggleFavorite(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
