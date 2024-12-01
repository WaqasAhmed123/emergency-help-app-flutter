sealed class ApiResponse<T> {}

class Initial<T> extends ApiResponse<T> {}

class Loading<T> extends ApiResponse<T> {}

class Success<T> extends ApiResponse<T> {
  final T data;
  Success(this.data);
}

class NetworkError<T> extends ApiResponse<T> {}

class Error<T> extends ApiResponse<T> {
  final String errorMessage;
  Error(this.errorMessage);
}
