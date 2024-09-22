import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../common/widgets/goodfood_button.dart';
import '../../core/app_constants.dart';
import '../../models/select_types/type_model.dart';
import '../../providers/nguoidung_provider.dart';
import '../user/home/user_home.dart';

class ChooseTagsScreen extends StatefulWidget {
  static const String route = '/choose-tag';
  const ChooseTagsScreen({super.key});

  @override
  State<ChooseTagsScreen> createState() => _ChooseTagsScreenState();
}

class _ChooseTagsScreenState extends State<ChooseTagsScreen> {
  late Future<ListTypes> futureTypes;
  final List<Type> _selectedTypes = [];
  List<Type> _items = [];

  @override
  void initState() {
    super.initState();
    futureTypes = fetchListTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<ListTypes>(
        future: futureTypes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (_items.isEmpty) _items = (snapshot.data!.types).toList();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Bạn thích thể loại nào?',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 0,
                        children: List<Widget>.generate(
                          _items.length,
                          (int idx) {
                            return ChoiceChip(
                              label: Text(_items[idx].typeName),
                              selected: _selectedTypes.contains(_items[idx]),
                              onSelected: (bool selected) {
                                setState(() {
                                  selected
                                      ? _selectedTypes.add(_items[idx])
                                      : _selectedTypes.remove(_items[idx]);
                                });
                              },
                              backgroundColor:
                                  const Color.fromRGBO(240, 229, 241, 1),
                              selectedColor:
                                  const Color.fromRGBO(255, 243, 179, 1),
                              // materialTapTargetSize:
                              //     MaterialTapTargetSize.shrinkWrap,
                              //visualDensity: VisualDensity.compact,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'QuickSans',
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final tags = _selectedTypes.map((e) => e.id).toList();
                      return GoodfoodPrimaryButton(
                        onPressed: () {
                          ref
                              .watch(userTagsProvider(tags).future)
                              .then((value) {
                            Navigator.of(context)
                                .pushReplacementNamed(UserHomeScreen.route);
                          });
                        },
                        child: const Text(
                          'Tiếp theo',
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<ListTypes> fetchListTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/TheLoai/all'));

    if (response.statusCode == 200) {
      return ListTypes.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load types');
    }
  }
}
