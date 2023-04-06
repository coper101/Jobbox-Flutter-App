import 'package:flutter/material.dart';

enum TabFilters { recent, nearby }

extension TabBarFiltersExtension on TabFilters {
  String get title {
    switch (this) {
      case TabFilters.recent:
        return 'Recent Jobs';
      case TabFilters.nearby:
        return 'Near You';
    }
  }
}

class FilterTabBar extends StatefulWidget {
  // -- States --
  const FilterTabBar({super.key});

  @override
  State<FilterTabBar> createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar> {
  // -- States --
  TabFilters _activeFilter = TabFilters.recent;

  // -- Actions --
  void _toggleTab(TabFilters filter) {
    setState(() {
      _activeFilter = filter;
    });
  }

  // -- UI --
  Widget _tabBar(BuildContext context, TabFilters filter, VoidCallback onTap) {
    final isActive = _activeFilter == filter;
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Text(
                  filter.title,
                  style: TextStyle(
                    color: isActive
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.3),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                if (isActive)
                  Container(
                    width: 102,
                    height: 4.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // color: Theme.of(context).colorScheme.secondary,
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tabBar(
              context, TabFilters.recent, () => _toggleTab(TabFilters.recent)),
          _tabBar(
              context, TabFilters.nearby, () => _toggleTab(TabFilters.nearby)),
        ],
      ),
    );
  }
}