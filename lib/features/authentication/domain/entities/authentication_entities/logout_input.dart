class LogoutInput {
  final LogutDeviceEnum deviceType;

  LogoutInput({required this.deviceType});
}

enum LogutDeviceEnum { desktop, ios, android }
