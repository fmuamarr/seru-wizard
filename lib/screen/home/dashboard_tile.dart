import 'package:flutter/material.dart';
import 'package:seru_wizard/core/constants/color_constant.dart';

class DashboardTile extends StatelessWidget {
  final String dashboardTitle;
  final String dashboardValue;
  final dashboardColor;
  final String imageName;

  const DashboardTile({
    super.key,
    required this.dashboardTitle,
    required this.dashboardValue,
    required this.dashboardColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: dashboardColor[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(imageName),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dashboardValue,
                      style: TextStyle(
                          color: ColorConstants.kGradientColorBottom,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dashboardTitle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Work Sans',
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
