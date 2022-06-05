# `infinite_scroll_pagination` Hooks

Hookified variant of the package [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination)

# Installation

```bash
$ flutter pub add hookified_infinite_scroll_pagination
```

> You don't need `infinite_scroll_pagination` as hookified_infinite_scroll_pagination package already re-exports everything within `infinite_scroll_pagination`

# Basic Usage

Based on the [EdsonBueno/infinite_scroll_pagination/example/example.md](https://github.com/EdsonBueno/infinite_scroll_pagination/tree/master/example/example.md)
```dart
class CharacterListView extends HookWidget {
  static const _pageSize = 20;

  @override
  Widget build(BuildContext context) {
    final _pagingController = usePagingController(
      firstPageKey: 0,
      onPageRequest: (pageKey, pagingController) async {
        try {
          final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length;
            pagingController.appendPage(newItems, nextPageKey);
          }
        } catch (error) {
          pagingController.error = error;
        }
      }
    );

    return PagedListView<int, CharacterSummary>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CharacterSummary>(
        itemBuilder: (context, item, index) => CharacterListItem(
          character: item,
        ),
      ),
    );
  }
}
```