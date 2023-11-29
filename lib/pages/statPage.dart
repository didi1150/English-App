import 'package:eng_app_v2/components/secondaryScaffold.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});
  final double progressValue = 0.4;
  final List<double> milestones = [0.2, 0.5, 0.8];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        const SizedBox(height: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey,
                  color: Colors.blue,
                  minHeight: 20,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: milestones.map((milestone) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: milestone * 100 -
                                  5), // Adjust margin as needed
                          child: Column(
                            children: [
                              const Icon(
                                Icons
                                    .star, // You can replace this with your milestone indicator
                                color: Colors.orange,
                                size: 20,
                              ),
                              Text('${(milestone)}%',
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                "Only 6 more sales left until the next discount!",
                style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey,
              strokeWidth: 150,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          ),
        ),
        const Center(
          child: Text("6940lbs of food has been saved \nfrom disposal in Haar",
              style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
