class Failure implements Exception {
  final String message;

  Failure([this.message = "An unexpected error occured"]); 
}
