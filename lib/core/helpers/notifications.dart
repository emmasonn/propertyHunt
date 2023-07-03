// import 'dart:convert';
// import 'package:awesome_notifications/awesome_notifications.dart';

// import '../../features/order/data/models/order_model.dart';

// Future<void> notifyMe({
//   Map<String, String>? payload,
//   required String title,
// }) async {
//   if (title.contains('Chat')) {
//     final data = json.decode(payload!['data']!)['message'];

//     // final message = ChatMessageModel(
//     //   userId: data['user_id'].toString(),
//     //   receiverId: data['receiver_id'].toString(),
//     //   text: data['message'],
//     //   date: DbDateTime.fromString(data['created_at']),
//     //   status: toMessageStatus(data['status'] ?? 'unread'),
//     //   isOwner: false,
//     // );

//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: createUniqueId,
//         channelKey: 'basic_channel',
//         groupKey: 'chat',
//         payload: payload,
//         title: 'New Message - briefpal',
//         body: data['message'],
//       ),
//     );
//   } else if (title.contains('Order')) {
//     final data = json.decode(payload!['data']!)['order'];
//     final order = OrderModel.fromMap(data);

//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: createUniqueId,
//         groupKey: 'order',
//         channelKey: 'basic_channel',
//         payload: payload,
//         title: 'New Order - briefpal',
//         body: 'You have a new order ${order.orderId}. '
//             'Your consent is required',
//       ),
//     );
//   } else {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: createUniqueId,
//         channelKey: 'basic_channel',
//         payload: null,
//         title: 'briefpal',
//         body: '',
//       ),
//     );
//   }
// }

// // Utitlities
// int get createUniqueId {
//   return DateTime.now().millisecondsSinceEpoch.remainder(303);
// }
