import 'package:flutter/material.dart';

class ActivityInputPage extends StatefulWidget {
  const ActivityInputPage({super.key});

  @override
  _ActivityInputPageState createState() => _ActivityInputPageState();
}

class _ActivityInputPageState extends State<ActivityInputPage> {
  final _formKey = GlobalKey<FormState>();
  String childName = '';
  String childAge = '';
  String childTemperature = '';
  String childCondition = '';
  String otherFeeling = '';
  String otherItemNeeded = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay bathroomTime = TimeOfDay.now();
  TimeOfDay dropOffTime = TimeOfDay.now(); 

  String toiletType = 'Potty';
  String toiletCondition = 'Wet';
  
  Map<String, Map<String, String>> meals = {
    'Sarapan': {'Makanan': '', 'Kuantitas': 'none', 'Komentar': ''},
    'Makan Siang': {'Makanan': '', 'Kuantitas': 'none', 'Komentar': ''},
    'Makan Malam': {'Makanan': '', 'Kuantitas': 'none', 'Komentar': ''},
    'Cairan': {'Makanan': '', 'Kuantitas': 'none', 'Komentar': ''},
    'Lainnya': {'Makanan': '', 'Kuantitas': 'none', 'Komentar': ''},
  };

  String showerTime = '';
  String activityDescription = '';
  String parentNote = '';

  Map<String, bool> feelings = {
    'Sedih': false,
    'Bahagia': false,
    'Confident': false,
    'Nakal': false,
    'Malu': false,
    'Mudah Bergaul': false,
    'Lainnya': false,
  };

  Map<String, bool> itemsNeeded = {
    'Popok': false,
    'Handuk ': false,
    'Handuk Tangan': false,
    'Sabun': false,
    'Sampo': false,
    'Krim': false,
    'Susu': false,
    'Pakaian': false,
    'Pasta Gigi': false,
    'Lainnya': false,
  };

Widget buildOtherFeelingTextField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Perasaan Lainnya',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onChanged: (val) {
      setState(() {
        otherItemNeeded = val;
      });
    },
  );
}

Widget buildOtherItemNeededTextField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Barang lain yang dibutuhkan',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onChanged: (val) {
      setState(() {
        otherItemNeeded = val;
      });
    },
  );
}

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _selectTime(BuildContext context, TimeOfDay initialTime, Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (picked != null) {
      setState(() {
        onTimeSelected(picked);
      });
    }
  }

  _selectBathroomTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: bathroomTime,
    );
    if (picked != null) {
      setState(() {
        bathroomTime = picked;
      });
    }
  }

  void _updateMealQuantity(String mealType, String quantity) {
    setState(() {
      meals[mealType]!['Kuantitas'] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input aktivitas Anak'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 163, 186, 197),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_activity_input.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Informasi Anak',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nama Anak',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Masukkan Nama Anak' : null,
                    onChanged: (val) {
                      setState(() => childName = val);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Umur Anak',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Masukkan Umur Anak' : null,
                    onChanged: (val) {
                      setState(() => childAge = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Suhu Badan(°C)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Masukkan suhu Anak' : null,
                    onChanged: (val) {
                      setState(() => childTemperature = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Kondisi Anak',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Masukkan Suhu Anak' : null,
                    onChanged: (val) {
                      setState(() => childCondition = val);
                    },
                  ),

                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () => _selectDate(context),
                  ),

                  ListTile(
                    title: Text("Waktu: $selectedDate"),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),

                                    ListTile(
                    title: Text("Waktu kedatangan: ${dropOffTime.format(context)}"), // Display drop-off time
                    trailing: const Icon(Icons.access_time),
                    onTap: () => _selectTime(context, dropOffTime, (picked) => dropOffTime = picked), // Select drop-off time
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Makanan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...meals.keys.map((mealType) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealType[0].toUpperCase() + mealType.substring(1),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Makanan',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              meals[mealType]!['Makanana'] = val;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Kuantitas:'),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('None'),
                                    value: 'none',
                                    groupValue: meals[mealType]!['Kuantitas'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Some'),
                                    value: 'some',
                                    groupValue: meals[mealType]!['Kuantitas'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('Banyak'),
                                    value: 'Banyak',
                                    groupValue: meals[mealType]!['Kuantitas'],
                                    onChanged: (val) {
                                      _updateMealQuantity(mealType, val!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField
(
                          decoration: InputDecoration(
                            hintText: 'Komentar',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              meals[mealType]!['Komentar'] = val;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),

const SizedBox(height: 20),
                  const Text(
                    'Waktu ke toilet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text("Time: ${bathroomTime.format(context)}"), // Display toilet time
                    trailing: const Icon(Icons.access_time),
                    onTap: () => _selectBathroomTime(context), // Select toilet time
                  ),
                  const SizedBox(height: 10),
                  const Text('Type:', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Toilet'),
                          value: 'Toilet',
                          groupValue: toiletType,
                          onChanged: (val) {
                            setState(() {
                              toiletType = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Popok'),
                          value: 'Popok',
                          groupValue: toiletType,
                          onChanged: (val) {
                            setState(() {
                              toiletType = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Dry/Wet/BM:', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Dry'),
                          value: 'Dry',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Wet'),
                          value: 'Wet',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('BM'),
                          value: 'BM',
                          groupValue: toiletCondition,
                          onChanged: (val) {
                            setState(() {
                              toiletCondition = val!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Aktivitas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Deskripsi Aktivitas',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => activityDescription = val);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Catatan untuk Orang tua',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'catatan',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() => parentNote = val);
                    },
                  ),

Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Perasaan Anak",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ...feelings.keys.map((String key) {
                      if (key == 'Lainnya') {
                        return CheckboxListTile(
                          title: Text(key),
                          value: feelings[key],
                          onChanged: (bool? value) {
                            setState(() {
                              feelings[key] = value!;
                              if (value == true) otherFeeling = '';
                            });
                          },
                        );
                      }
                      return CheckboxListTile(
                        title: Text(key),
                        value: feelings[key],
                        onChanged: (bool? value) {
                          setState(() {
                            feelings[key] = value!;
                          });
                        },
                      );
                    }),
                    if (feelings['Other'] == true) buildOtherFeelingTextField(),
                  ],
                ),


Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kebutuhan yang dibutuhkan Anak',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ...itemsNeeded.keys.map((String key) {
                      if (key == 'Lainnya') {
                        return CheckboxListTile(
                          title: Text(key),
                          value: itemsNeeded[key],
                          onChanged: (bool? value) {
                            setState(() {
                              itemsNeeded[key] = value!;
                              if (value == true) otherItemNeeded = '';
                            });
                          },
                        );
                      }
                      return CheckboxListTile(
                        title: Text(key),
                        value: itemsNeeded[key],
                        onChanged: (bool? value) {
                          setState(() {
                            itemsNeeded[key] = value!;
                          });
                        },
                      );
                    }),
                    if (itemsNeeded['Lainnya'] == true) buildOtherItemNeededTextField(),
                  ],
                ),


                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Aktivitas Anak Berhasil Disimpan")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 163, 186, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
