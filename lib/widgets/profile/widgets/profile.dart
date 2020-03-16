
import 'package:flutter/material.dart';
import 'package:sma/models/profile/profile.dart';
import 'package:sma/shared/colors.dart';

class CompanyProfileWidget extends StatelessWidget {

  final CompanyProfile profile;

  CompanyProfileWidget({
    @required this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text('About ${profile.companyName}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        )),

        SizedBox(height: 8),

        Text('About ${profile.description}',
          style: TextStyle(
            fontSize: 16,
            color: kLightGray,
            height: 1.75
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 8),
        Divider(
          color: kLightGray,
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('CEO'),
          trailing: Text('${profile.ceo}'),
        ),
        Divider(
          color: kLightGray,
        ),

        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('Sector'),
          trailing: Text('${profile.sector}'),
        ),
        Divider(
          color: kLightGray,
        ),

        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('Exchange'),
          trailing: Text('${profile.exchange}'),
        ),
        Divider(
          color: kLightGray,
        ),

        SizedBox(height: 30),

      ],


    );
  }
}