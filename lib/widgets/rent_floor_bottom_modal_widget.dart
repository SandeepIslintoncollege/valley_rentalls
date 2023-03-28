import 'package:flutter/material.dart';
import 'package:valleyrentals/config.dart';
import 'package:valleyrentals/providers/rent_floor_response_one.dart';

import '../pages/rent_floor_detail_page.dart';
import '../services/shared_services.dart';

class RentFloorBottomModalWidget extends StatelessWidget {
  const RentFloorBottomModalWidget({
    Key? key,
    required this.rentFloor,
  }) : super(key: key);

  final RentFloorResponseModelOne rentFloor;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          15,
        ),
        topRight: Radius.circular(
          15,
        ),
      ),
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(
                      4,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: FadeInImage(
                        placeholder: const AssetImage('images/home.png'),
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'http://${Config.authority}/Images/${rentFloor.images[0]}',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rs. ${rentFloor.amount} per month',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            rentFloor.bhk,
                            style: TextStyle(
                              color: SharedService.primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RentFloorDetailPage.routeName,
                                arguments: rentFloor.id,
                              );
                            },
                            child: const Text('View Details'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
