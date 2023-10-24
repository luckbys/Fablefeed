import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://mxmenawrrkpqrzqknesw.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im14bWVuYXdycmtwcXJ6cWtuZXN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjY3ODY2ODYsImV4cCI6MTk4MjM2MjY4Nn0.QsHverp06gp41Dmvta8nyJ-nhy4qp5rMlQsU8FvKc5k';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
