class AddressModel {
  int? id;
  String? titleFirst;
  String? titleSecond;
  String? description;
  bool? isSelected;
}

List<AddressModel> addresses = [
  AddressModel()
    ..id = 1
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = true,
  AddressModel()
    ..id = 2
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..id = 3
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..id = 4
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..id = 5
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..id = 6
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
];
