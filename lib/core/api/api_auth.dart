import 'dart:io';
import '../cache_manager/cache_manager.dart';
import '../helpers/helpers.dart';
import '../utils/strings.dart';

final headers = {'Content-type'};

// Future<Map<String, String>> getHeaders({bool? jsonRequest}) async {
//   pp((await getAuthUser())?.token);

//   if (jsonRequest != null && jsonRequest) {
//     return {
//       'Content-type': 'application/json',
//       HttpHeaders.authorizationHeader:
//           'Bearer ${(await getAuthUser())?.token ?? ''}',
//       'Accept': 'application/json'
//     };
//   }
//   return {
//     HttpHeaders.authorizationHeader:
//         'Bearer ${(await getAuthUser())?.token ?? ''}',
//     'Accept': 'application/json'
//   };
// }

// Future<Auth?> getAuthUser() async {
//   final data = await CacheManager.instance.getPref(authUserKey);

//   if (data != null) {
//     return AuthModel.fromJson(
//       await CacheManager.instance.getPref(authUserKey),
//     );
//   }
//   return null;
// }

// PayStack API Keys
const liveSecretKey = 'sk_live_df506249c29561c5b69c0c5093780537678a5bf1';
const livePublicKey = 'pk_live_ae9025985add34b8a75b0be1e3c0b65246f95c45';
const testPublicKey = 'pk_test_a919e0c2cc4dced9ecc40dc04ebc4ecfdc9cd032';
