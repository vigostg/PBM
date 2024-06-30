import 'package:flutter/material.dart';

class ChildActivitiesPage extends StatelessWidget {
  final String childName;
  final int childAge;

  const ChildActivitiesPage({super.key, required this.childName, required this.childAge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan kegiatan Anak'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_child_activities.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSection('Informasi Anak', [
                  _buildInfoRow('Name', childName),
                  _buildInfoRow('Age', '$childAge years'),
                  _buildInfoRow('Drop-off Date', _getFormattedDate(DateTime.now())),
                  _buildInfoRow('Arrival Time', '08:30 AM'),
                  _buildInfoRow('Body Temperature', '36.5°C'),
                  _buildInfoRow('Condition', 'Healthy'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Meal Schedule', [
                  _buildMealInfo('Sarapan', 'Pancake', 'beberapa', 'Makan dengan baik'),
                  _buildMealInfo('Makan siang', 'Pasta', 'banyak', 'Selesai semuanya'),
                  _buildMealInfo('Makan malam', 'Sup ayam', 'beberapa', 'Makan perlahan'),
                  _buildMealInfo('Cairan', 'Air', 'banyak', 'Banyak minum'),
                  _buildMealInfo('Lainnya', 'Buah-buahan', 'beberapa', 'Punya beberapa potong'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Toilet Time', [
                  _buildInfoRow('Time', '09:00 AM'),
                  _buildInfoRow('Type', 'Potty'),
                  _buildInfoRow('Dry/Wet/BM', 'Dry'),
                ]),
                const SizedBox(height: 20),
                _buildSection('Child\'s Feelings', [
                  _buildFeelingRow('Sedih', false),
                  _buildFeelingRow('Bahagia', true),
                  _buildFeelingRow('Malu', false),
                  _buildFeelingRow('Percaya diri', true),
                  _buildFeelingRow('Nakal', false),
                ]),
                const SizedBox(height: 20),
                _buildSection('Barang Dibutuhkan', [
                  _buildItemRow('Popok', false),
                  _buildItemRow('Handuk', true),
                  _buildItemRow('Handuk tangan', false),
                  _buildItemRow('Sabun', true),
                  _buildItemRow('Sampoo', true),
                  _buildItemRow('Krim', false),
                  _buildItemRow('Susu', true),
                  _buildItemRow('Pakaian', true),
                  _buildItemRow('Pasta Gigi', false),
                  _buildItemRow('Lainnya', false),
                ]),
                const SizedBox(height: 20),
                _buildSection('Informasi Tambahan', [
                  _buildInfoRow('Waktu Istirahat', '1 jam'),
                  _buildInfoRow('Waktu Mandi', '15 menit'),
                  _buildInfoRow('Waktu Mandi', '10 menit'),
                  _buildInfoRow('Deskripsi Kegiatan', 'Bermain dengan balok dan melukis'),
                  _buildInfoRow('Catatan Orangtua', 'Semoga Hari kamu menyenangkan!'),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.0),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Column(children: children),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label:',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMealInfo(String mealType, String food, String quantity, String comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mealType,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        _buildInfoRow('Makanan', food),
        _buildInfoRow('Kuantitas', quantity),
        _buildInfoRow('Komentar', comments),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildFeelingRow(String feeling, bool isExpressed) {
    return _buildInfoRow(feeling, isExpressed ? 'Yes' : 'No');
  }

  Widget _buildItemRow(String item, bool isNeeded) {
    return _buildInfoRow(item, isNeeded ? 'Yes' : 'No');
  }

  String _getFormattedDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}
