import 'package:flutter/material.dart';
import 'package:machinetest/config/asset_const.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/config/string_const.dart';
import 'package:machinetest/features/medical_app/domain/entity/medical_model.dart';

class MedDetailPage extends StatelessWidget {
  const MedDetailPage({required this.medicine});
  final AssociatedDrug medicine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Hero(
            tag: medicine.name!,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 16, top: 80),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    kPrimaryColor,
                    kSecondaryColor,
                    Colors.lightBlueAccent,
                  ], begin: Alignment.bottomLeft)),
              child: Image.asset(
                AssetConstant.medicine,
                width: 105,
                height: 105,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name!,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    medicine.strength!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dosage',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(medicine.dose!),
                ],
              ),
            ],
          ),
          Divider(
            height: 50,
            indent: 10,
            endIndent: 10,
            thickness: 2,
          ),
          Text(
            'Description',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            loremEpsum,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
