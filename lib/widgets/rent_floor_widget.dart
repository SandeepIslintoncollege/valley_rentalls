import 'package:flutter/material.dart';
import 'package:valleyrentals/config.dart';
import 'package:valleyrentals/pages/rent_floor_detail_page.dart';

import '../services/shared_services.dart';

class RentFloorWidget extends StatelessWidget {
  final String showImage;
  final String id;
  final String address;
  final String city;
  final int amount;
  final String bhk;
  const RentFloorWidget(
      {Key? key,
      required this.showImage,
      required this.id,
      required this.address,
      required this.city,
      required this.amount,
      required this.bhk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RentFloorDetailPage.routeName,
          arguments: id,
        );
      },
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 320,
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
                        'http://${Config.authority}/Images/$showImage',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 25,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 211, 216, 218),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$address, $city',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: SharedService.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rs. $amount per month',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            bhk,
                            style: TextStyle(
                              color: SharedService.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
