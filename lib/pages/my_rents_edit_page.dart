import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valleyrentals/pages/faq_page.dart';
import 'package:valleyrentals/providers/rent_floor_response_one.dart';
import 'package:valleyrentals/pages/edit_rent_floor_page.dart';
import 'package:valleyrentals/pages/rent_floor_detail_page.dart';
import 'package:valleyrentals/providers/rooms_provider.dart';
import 'package:valleyrentals/widgets/change_availability_status_widget.dart';

import '../services/shared_services.dart';

class MyRentEditPage extends StatefulWidget {
  const MyRentEditPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/myRentEditPage';

  @override
  State<MyRentEditPage> createState() => _MyRentEditPageState();
}

class _MyRentEditPageState extends State<MyRentEditPage> {
  @override
  Widget build(BuildContext context) {
    final rentId = ModalRoute.of(context)!.settings.arguments as String;
    RentFloorResponseModelOne rentFloor =
        Provider.of<Rooms>(context).getMyRentFloorById(rentId);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.small(
                    backgroundColor: SharedService.primaryColor,
                    child: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RentFloorDetailPage.routeName,
                          arguments: rentId,
                        );
                      },
                      child: const Text(
                        'View Details',
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, EditRentFloorPage.routeName,
                      arguments: rentFloor.id);
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: Text(
                    'Edit Rent Floor Details',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: SharedService.primaryColor,
                    ),
                  ),
                ),
              ),
              const Divider(),
              ChangeNotifierProvider.value(
                value: rentFloor,
                child: const ChangeAvailabilityStatusWidget(),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    FaqPage.routeName,
                    arguments: rentFloor.id,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: Text(
                    'FAQ\'s',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: SharedService.primaryColor,
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
