class RequestResponse {
  late bool success;
  String? error;
  Map<String, dynamic>? data;

  RequestResponse(this.success, {this.error});

  RequestResponse.fromJson(json) {
    data = json;
    success = true;
  }

  toJson() {
    return {
      'success': this.success,
      'error': this.error,
      'body': this.data,
    };
  }
}
