## Simple Usage

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