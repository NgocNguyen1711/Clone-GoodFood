import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/color_scheme.dart';

import '../../../../models/restaurant/restaurant_model.dart';
import '../../../../models/restaurant/restaurant_type_model.dart';
import '../../../../providers/restaurant_provider.dart';
import 'formfield_container.dart';

class TypeSelectField extends ConsumerStatefulWidget {
  const TypeSelectField({
    required this.restaurant,
    required this.enable,
    super.key,
  });

  final RestaurantModel restaurant;
  final bool enable;

  @override
  TypeSelectFieldState createState() => TypeSelectFieldState();
}

class TypeSelectFieldState extends ConsumerState<TypeSelectField> {
  final List<RestaurantTypeModel> selectedTypes = [];

  @override
  void didChangeDependencies() {
    final state = ref.watch(updateRestaurantController(widget.restaurant));
    selectedTypes.addAll(state.theLoai);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final typesRef = ref.watch(restaurantTypeDataProvider);
    return FormFieldContainer(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: widget.enable
                  ? () {
                      showSelectTypeDialog(context, typesRef);
                    }
                  : null,
              child: selectedTypes.isNotEmpty
                  ? FormField(
                      builder: (state) => Wrap(
                        spacing: 8,
                        children: selectedTypes
                            .map(
                              (e) => ChoiceChip(
                                selectedColor: user1,
                                label: Text(e.tenTheLoai),
                                selected: true,
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Thể loại"),
                      ),
                      enabled: false,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showSelectTypeDialog(
    BuildContext context,
    AsyncValue<List<RestaurantTypeModel>> typesRef,
  ) {
    return showDialog(
      context: context,
      builder: ((BuildContext buildContext) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text("Thể loại"),
            content: typesRef.when(
              data: (data) => Wrap(
                spacing: 8,
                children: data
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.tenTheLoai),
                        selected: selectedTypes.contains(e),
                        selectedColor: user1,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              selectedTypes.add(e);
                            });
                            this.setState(() {});
                          } else {
                            setState(() {
                              selectedTypes.remove(e);
                            });
                            this.setState(() {});
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
              error: (e, s) => Center(
                child: Text(e.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(updateRestaurantController(widget.restaurant)
                          .notifier)
                      .update(theLoai: selectedTypes);
                },
                child: const Text('Xong'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
