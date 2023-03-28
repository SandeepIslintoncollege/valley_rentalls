import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valleyrentals/config.dart';
import 'package:valleyrentals/providers/rent_floor_response_one.dart';
import 'package:valleyrentals/pages/my_rents_edit_page.dart';

import '../Utilities/snackbars.dart';
import '../providers/rooms_provider.dart';
import '../services/shared_services.dart';

class MyRentFloorWidget extends StatelessWidget {
  const MyRentFloorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rentFloor = Provider.of<RentFloorResponseModelOne>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyRentEditPage.routeName,
            arguments: rentFloor.id);
      },
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(
                        5,
                      ),
                      topLeft: Radius.circular(
                        5,
                      ),
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
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 211, 216, 218),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 25,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${rentFloor.address}, ${rentFloor.city}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: SharedService.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rs. ${rentFloor.amount} per month',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRentEditPage.routeName,
                                  arguments: rentFloor.id);
                            },
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: const Text('Are you Sure?'),
                                    content: const Text(
                                      'Do you want to delete the Rent Floor',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await Provider.of<Rooms>(context,
                                                  listen: false)
                                              .deleteRentFloorById(rentFloor.id)
                                              .then((value) {
                                            Navigator.of(context).pop();
                                            SnackBars.showNormalSnackbar(
                                                context,
                                                'Rent Floor deleted successfully!!!');
                                          }).catchError(
                                            (e) {
                                              SnackBars.showErrorSnackBar(
                                                  context,
                                                  'Failed to delete the Rent Floor');
                                            },
                                          );
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )
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
