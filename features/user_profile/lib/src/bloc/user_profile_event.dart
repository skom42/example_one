abstract class UserProfileEvent {}

class UserProfileInitializeEvent extends UserProfileEvent {
  final bool isReroute;

  UserProfileInitializeEvent({
    this.isReroute = false,
  });
}
