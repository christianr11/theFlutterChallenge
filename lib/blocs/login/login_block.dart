import 'package:flutterChallenge/blocs/login/login_event.dart';
import 'package:flutterChallenge/blocs/login/login_state.dart';
import 'package:flutterChallenge/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({LoginState initialState, this.userRepository})
      : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is LoginButtonEvent) {
        yield LoginLoadingState();
        var user = await userRepository.signIn(event.email, event.password);
        yield LoginSuccessState(user: user);
      }
    } catch (e) {
      yield LoginFailureState(message: e.toString());
    }
  }
}
