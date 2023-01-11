class MultiSelect {
  String title;
  bool isSelected;
  int category ;

  MultiSelect({required this.title, this.isSelected = false,required this.category});

  MultiSelect copyWith({
    String? title,
    bool? isSelected,
    int? category,
  }) {
    return MultiSelect(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      category: category ?? this.category,
    );
  }
}
