import 'package:provider/provider.dart';
import 'package:site_admin/core/services/api/api.dart';
import 'package:site_admin/core/services/api/fake_api.dart';
import 'package:site_admin/core/services/api/http_api.dart';

const bool USE_FAKE_API_IMPLEMENTATION = true;

List<SingleChildCloneableWidget> providers = [
  ...independentProviders,
  ...dependentProviders,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentProviders = [
  Provider<Api>.value(
    value: USE_FAKE_API_IMPLEMENTATION ? FakeApi() : HttpApi(),
  )
];

List<SingleChildCloneableWidget> dependentProviders = [];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
