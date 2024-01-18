import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:critique_corner/task_item.dart';

Future<void> createTaskNotification(Task item) async {
  await AwesomeNotifications().createNotification(content: NotificationContent(
    id: item.id,
    channelKey: 'basic_channel',
    title: 'Task',
    body: item.taskName,
    notificationLayout: NotificationLayout.Default,
    ),
    schedule: NotificationCalendar(
      hour: item.time.hour,
      minute: item.time.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    )
  );
}

Future<void> testNotification() async {
  await AwesomeNotifications().createNotification(content: NotificationContent(
      id: -1,
      channelKey: 'basic_channel',
      title: "TESTING",
      body: "THIS IS A TEST",
      notificationLayout: NotificationLayout.Default,
    )
  );
}

Future<void> cancelNotification(Task item) async
{
  await AwesomeNotifications().cancel(item.id);
}