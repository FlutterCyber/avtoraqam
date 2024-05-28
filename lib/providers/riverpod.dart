import 'package:avtoraqam/providers/pinfl_details_provider.dart';
import 'package:avtoraqam/providers/token_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'loading_provider.dart';

final tokensProvider =
    ChangeNotifierProvider<TokenProvider>((ref) => TokenProvider());

final pinflDetailsProvider = ChangeNotifierProvider<PinflDetailsProvider>(
    (ref) => PinflDetailsProvider());

final loadingProvider = ChangeNotifierProvider<LoadingProvider>(
    (ref) => LoadingProvider());
