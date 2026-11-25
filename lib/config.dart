/// Base URL of the Django REST Framework backend.
///
/// Defaults to `http://10.0.2.2:8000` for Android Emulator.
/// Override with --dart-define=API_BASE_URL=... for other platforms.
const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://127.0.0.1:8000',
);
