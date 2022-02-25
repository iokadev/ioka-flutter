String orderIdFromAccessToken(String orderAccessToken) {
  return orderAccessToken.split('_secret_').first;
}

String customerIdFromAccessToken(String customerAccessToken) {
  return customerAccessToken.split('_secret_').first;
}