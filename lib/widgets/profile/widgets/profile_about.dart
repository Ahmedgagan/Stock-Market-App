import 'package:flutter/material.dart';
import 'package:sma/models/profile/stock_profile.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class CompanyProfileWidget extends StatelessWidget {

  final StockProfile profile;

  CompanyProfileWidget({
    @required this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(profile.companyName, style: kProfileScreenSectionTitle),
        SizedBox(height: 8),

        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('CEO', style: subtitleStyle),
          trailing: Text('${profile.ceo}'),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('Sector', style: subtitleStyle),
          trailing: Text('${profile.sector}'),
        ),
        Divider(),

        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text('Exchange', style: subtitleStyle),
          trailing: Text('${profile.exchange}'),
        ),
        Divider(),

        Text('About ${profile.description}',
          style: TextStyle(
            fontSize: 16,
            color: kLightGray,
            height: 1.75
          ),
        ),
        Divider(),

        SizedBox(height: 30),
      ],
    );
  }
}