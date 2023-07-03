import '../utils/enums.dart';

UserType getUserType(String userType) {
  switch (userType.toLowerCase()) {
    case 'client':
      return UserType.client;
    case 'lawyer':
      return UserType.lawyer;
    default:
      return UserType.client;
  }
}


UserStatus getUserStatus(String? status) {
  if (status != null) {
    switch (status.toLowerCase()) {
      case 'verified':
        return UserStatus.verified;
      case 'pending':
        return UserStatus.pending;
      case 'active':
        return UserStatus.active;
      default:
        return UserStatus.pending;
    }
  } else {
    return UserStatus.pending;
  }
}