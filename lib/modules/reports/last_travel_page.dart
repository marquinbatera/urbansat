import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:urbansat/models/vehicles/vehicles_model.dart';
import 'package:urbansat/modules/reports/last_travel_controller.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';
import 'package:urbansat/shared/widgets/input_text/input_text_form_widget.dart';

class LastTravelPage extends StatefulWidget {
  const LastTravelPage({Key? key}) : super(key: key);

  @override
  _LastTravelPageState createState() => _LastTravelPageState();
}

final LastTravelController lastController = Get.put(LastTravelController());

class _LastTravelPageState extends State<LastTravelPage> {
  @override
  void initState() {
    super.initState();
    lastController.getListVehicles();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.grey,
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.18,
            width: double.maxFinite,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return lastController.vehiclesList.where((String option) {
                      return option
                          .toString()
                          .contains(textEditingValue.text.toUpperCase());
                    });
                  },
                  optionsViewBuilder:
                      (context, Function(String) onSelected, options) {
                    return Material(
                      elevation: 4,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index) {
                          final option = options.elementAt(index);

                          return ListTile(
                            title: Text(
                              option.toString(),
                              style: TextStyles.titleListTile,
                            ),
                            onTap: () {
                              onSelected(option.toString());
                            },
                          );
                        },
                        separatorBuilder: (ctx, index) => Divider(),
                        itemCount: options.length,
                      ),
                    );
                  },
                  onSelected: (String selection) {
                    print('You just selected ${selection.toString()}');
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                    return InputTextFormWidget(
                      label: 'Veículo',
                      icon: FontAwesomeIcons.carAlt,
                      hint: 'Selecione um veículo',
                      controller: controller,
                      focusNode: focusNode,
                      editingComplete: onEditingComplete,
                    );
                  },
                ),
                Container(
                  width: size.width * 0.75,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Buscar',
                    style: TextStyles.buttonBoldBackground,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
