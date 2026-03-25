// This is a mockup for backend response handling. Replace with your actual backend response format.
class SignInResponse {
  final bool success;
  final String? message;

  SignInResponse({required this.success, this.message});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      success: json['success'] ?? false,
      message: json['message'],
    );
  }
}
