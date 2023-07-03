enum Environment { staging, production }

enum UserStatus { verified, pending, active }

enum ImageType { network, asset, binary }

enum CropType { square, horiz, vertz }

enum ProcessState { done, failed, loading, idle }

enum PopupState { info, error, success, confirm }

enum AuthState { login, otpSent, register, expired, none }

enum UserType {
  client,
  lawyer,
}
