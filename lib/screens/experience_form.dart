import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _category = 'organization';
  String _thumbnail = '';

  final List<Map<String, String>> _categories = [
    {'value': 'organization', 'label': 'Organization'},
    {'value': 'committee', 'label': 'Committee'},
    {'value': 'volunteer', 'label': 'Volunteer'},
    {'value': 'training', 'label': 'Training & Workshop'},
    {'value': 'internship', 'label': 'Internship'},
  ];

  String? _validateThumbnail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(value.trim());

    if (uri == null ||
        !uri.hasScheme ||
        !['http', 'https'].contains(uri.scheme.toLowerCase()) ||
        uri.host.isEmpty) {
      return 'Masukkan URL HTTP/HTTPS yang valid.';
    }

    return null;
  }

  void _showSummaryDialog() {
    final selectedCategory = _categories.firstWhere(
      (category) => category['value'] == _category,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Experience Berhasil Disimpan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Berikut ringkasan data yang kamu masukkan:'),
                const SizedBox(height: 16),
                _buildSummaryItem('Title', _title),
                _buildSummaryItem('Description', _description),
                _buildSummaryItem('Category', selectedCategory['label']!),
                _buildSummaryItem(
                  'Thumbnail',
                  _thumbnail.isEmpty ? 'Tidak ada' : _thumbnail,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Tutup dialog
                Navigator.pop(context);

                // Reset seluruh field pada form
                _formKey.currentState!.reset();

                // Reset variabel ke nilai awal
                setState(() {
                  _title = '';
                  _description = '';
                  _category = 'organization';
                  _thumbnail = '';
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF384959);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Experience',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: navy,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fill in the details of your experience below.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Title
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Experience Title',
                  hintText: 'e.g. BEM Fasilkom UI',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work_outline),
                ),
                maxLength: 255,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title tidak boleh kosong.';
                  }

                  if (value.trim().length > 255) {
                    return 'Title maksimal 255 karakter.';
                  }

                  return null;
                },
                onChanged: (value) {
                  _title = value.trim();
                },
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe your experience...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.description_outlined),
                ),
                minLines: 3,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description tidak boleh kosong.';
                  }

                  return null;
                },
                onChanged: (value) {
                  _description = value.trim();
                },
              ),
              const SizedBox(height: 20),

              // Category
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['value'],
                    child: Text(category['label']!),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan pilih kategori.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Thumbnail
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Thumbnail URL (Optional)',
                  hintText: 'https://example.com/image.jpg',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image_outlined),
                ),
                keyboardType: TextInputType.url,
                validator: _validateThumbnail,
                onChanged: (value) {
                  _thumbnail = value.trim();
                },
              ),
              const SizedBox(height: 28),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showSummaryDialog();
                    }
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Save Experience'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: navy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
