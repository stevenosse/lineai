import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class LogoutController extends ChangeNotifier {
  final SupabaseClient _supabaseClient;

  LogoutController({
    SupabaseClient? supabaseClient,
  }) : _supabaseClient = supabaseClient ?? Supabase.instance.client;

  Future<void> logout() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (e) {
      log('Failed to logout:', error: e);
    }
  }
}
