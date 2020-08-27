import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'homeStateManagement.g.dart';

class homeStateClass = homeState with _$homeStateClass;

abstract class homeState with Store {
  @observable
  String title = 'Our Menu';

  @observable
  String category = 'Burgers';

  @observable
  Icon custom_Icon = Icon(Icons.search);

  @observable
  Widget search_text = Text('Our menu');

  @observable
  String searchQuery = '';

  @action
  void seacrchIconState() {
    if (this.custom_Icon.icon == Icons.search) {
      this.custom_Icon = Icon(Icons.cancel);
      this.search_text = TextField(
          onChanged: (value) {
            searchQuery = value;
          },
          decoration: InputDecoration(
            hintText: "Search Here...",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 20));
    } else {
      this.custom_Icon = Icon(Icons.search);
      this.search_text = Text('Our menu');
      searchQuery = '';
    }
  }

  @action
  void setCategory(int i) {
    switch (i) {
      case 0:
        category = 'Burgers';
        break;
      case 1:
        category = 'Sandwiches';
        break;
      case 2:
        category = 'Snacks';
        break;
      case 3:
        category = 'Drinks';
        break;
      case 4:
        category = 'Add-ons';
        break;
    }
  }

  @action
  void setTitlse(int i) {
    switch (i) {
      case 0:
        {
          title = 'Set Doctor Appointment';
        }
        break;

      case 1:
        {
          title = 'Our Menu';
        }
        break;

      case 2:
        {
          title = 'Cart';
        }
        break;
    }
  }
}
