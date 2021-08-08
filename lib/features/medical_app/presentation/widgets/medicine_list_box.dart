import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/config/asset_const.dart';
import 'package:machinetest/config/color_const.dart';
import 'package:machinetest/features/medical_app/domain/entity/medical_model.dart';
import 'package:machinetest/features/medical_app/presentation/pages/home/med_detail_page.dart';

class MedicineListBox extends StatelessWidget {
  const MedicineListBox({
    Key? key,
    required this.medicines,
  }) : super(key: key);

  final AssociatedDrug medicines;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MedDetailPage(medicine: medicines));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 4),
                color: kLightGreyColor.withOpacity(0.5),
              )
            ]),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Hero(
                    tag: medicines.name!,
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
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
                        width: 35,
                        height: 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicines.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          medicines.strength!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Dosage',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.grey.shade400),
                ),
                Text(medicines.dose!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
