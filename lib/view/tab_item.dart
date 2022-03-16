import 'package:flutter/material.dart';

enum TabItem {
  scanning,
  broadcasting,
}

class TabItemData {
  const TabItemData({required this.title, required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.scanning: TabItemData(title: 'Scan', icon: Icons.list),
    TabItem.broadcasting: TabItemData(title: 'Broadcast', icon: Icons.send),
  };
}
