/*
email-already-in-use:
Thrown if there already exists an account with the given email address.
invalid-email:
Thrown if the email address is not valid.
operation-not-allowed:
Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
weak-password:
Thrown if the password is not strong enough.

sign in error

invalid-email:
Thrown if the email address is not valid.
user-disabled:
Thrown if the user corresponding to the given email has been disabled.
user-not-found:
Thrown if there is no user corresponding to the given email.
wrong-password:
Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
 */


enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  weakPassword,
  undefined,
}