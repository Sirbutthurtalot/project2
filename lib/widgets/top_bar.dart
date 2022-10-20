import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart';

import '../providers/providers.dart';

class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int cartSize = ref.watch(cartProvider).length;
    return AppBar(
        leading: IconButton(
            icon: const Icon(Icons.home), onPressed: () => context.go("/")),
        title: const Text("Cube shop"),
        actions: <Widget>[
          IconButton(
              onPressed: () => context.go('/search'), icon: Icon(Icons.search)),
          IconButton(
            icon: Badge(
                badgeContent: Text(cartSize.toString(),
                    style: TextStyle(color: Colors.white)),
                child: const Icon(Icons.shopping_cart)),
            onPressed: () => context.go("/cart"),
          ),
          IconButton(
            icon: const Icon(Icons.account_box),
            onPressed: () => context.go("/user"),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
