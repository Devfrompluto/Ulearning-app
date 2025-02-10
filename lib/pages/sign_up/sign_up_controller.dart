import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_riverpod/common/widgets/popup_messages.dart';
import 'package:ulearning_riverpod/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String repassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email field is empty");
      return;
    }

    if (state.password != state.rePassword) {
      toastInfo("Your password did not match");
      return;
    }
  }
}
