import 'package:flutter/material.dart';
import 'package:seru_wizard/screen/home/dashboard_tile.dart';
import 'package:seru_wizard/screen/wizard/wizard_1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List dashboardList = [
    ["Input Wizard", "1", Colors.red, 'assets/images/dummy_logo.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Work Sans',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Fadillah Muamar!',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Work Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://picsum.photos/536/333"),
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'MonumentExtended',
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: dashboardList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WizardScreen1(),
                        ),
                      );
                    },
                    child: DashboardTile(
                      dashboardTitle: dashboardList[index][0],
                      dashboardValue: dashboardList[index][1],
                      dashboardColor: dashboardList[index][2],
                      imageName: dashboardList[index][3],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
