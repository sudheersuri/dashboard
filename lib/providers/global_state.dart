import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Map<String, dynamic>> pages = [
  {
    'title': 'Home',
    'icon': Icons.home_outlined,
  },
  {
    'title': 'Customers',
    'icon': Icons.person_outline,
  },
  {
    'title': 'Orders',
    'icon': Icons.shopping_cart_outlined,
  },
  {
    'title': 'Products',
    'icon': Icons.shopping_bag_outlined
  }
];

final selectedPageProvider = StateProvider<dynamic>((_)=> 0);
final themeModeProvider = StateProvider<dynamic>((_) => 'light');

updateState(ref,targeProvider,newState) {
  ref.read(targeProvider.notifier).update((state) => newState);
}

watch(ref,targetProvider) {
  return ref.watch(targetProvider);
}