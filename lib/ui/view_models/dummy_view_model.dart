import 'base_view_model.dart';

class DummyViewModel extends BaseViewModel {
  DummyViewModel() {
    _init();
  }

  _init() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 1));
    setLoading(false);
  }
}
