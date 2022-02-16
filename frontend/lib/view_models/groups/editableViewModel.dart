abstract class EditableViewModel {
  List<int> get getSelected;
  bool get getEditStatus => _edit;

  bool _edit = false;

  void privateToggleEdit(selected) {
    _edit = !_edit;

    if (_edit == false) {
      selected.clear();
    }
  }

  void toggleEdit();

  void privateToggleSelect(List selected, int index) {
    selected.contains(index) ? selected.remove(index) : selected.add(index);
  }

  void toggleSelect(int index);

  void delete();
  List<int> privateSelectAll(List selected, List list) {
    return selected.isEmpty ? [for (var i = 0; i < list.length; i++) i] : [];
  }

  void selectAll();
}
