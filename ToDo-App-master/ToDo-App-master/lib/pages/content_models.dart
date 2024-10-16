class UnbordingContent {
  String image;
  String title;
  String decription;
  UnbordingContent(
      {required this.title, required this.decription, required this.image});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: "Wellcome to app",
      decription:
          "TodoApp helps you organize your daily tasks smartly and efficiently. Start your day with a clear task list ready to conquer any challenges!",
      image: "assets/images/sc01.png"),
  UnbordingContent(
      title: "Quick and Easy Notes",
      decription:
          "Add tasks to your list with just a few clicks. TodoApp allows you to jot down ideas instantly, ensuring you never miss anything important.",
      image: "assets/images/sc2.png"),
  UnbordingContent(
      title: "Track Your Progress", decription: "Mark completed tasks and monitor your progress day by day. With TodoApp, you'll always know how far you've come and what's next.", image: "assets/images/sc3.png"),
  UnbordingContent(
      title: "Customize to Your Style", decription: "TodoApp offers various options for personalization. Choose colors, themes, and notification settings to match your work style.", image: "assets/images/sc4.png"),
];
