
import 'package:flutter/material.dart';

// class ConfirmDialogEx extends StatefulWidget {
//   final double? width;
//   final double? height;
//   final String? title;
//   final String message;
//   final PopupState state;
//   final String? acceptText;
//   final String? dismissText;
//   final void Function() onAccept;
//   final void Function()? onDismiss;
//   final void Function()? onError;

//   const ConfirmDialogEx({
//     Key? key,
//     this.width,
//     this.height,
//     this.acceptText,
//     this.dismissText,
//     this.onDismiss,
//     this.title,
//     this.onError,
//     required this.onAccept,
//     this.state = PopupState.info,
//     required this.message,
//   }) : super(key: key);

//   @override
//   State<ConfirmDialogEx> createState() => _ConfirmDialogExState();
// }

// class _ConfirmDialogExState extends State<ConfirmDialogEx> {
//   final controller = ScreenshotController();

//   @override
//   Widget build(BuildContext context) {
//     return Screenshot(
//       controller: controller,
//       child: Align(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: widget.width ?? 250.0,
//               height: widget.height ?? 280.0,
//               margin: const EdgeInsets.all(50.0),
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       color: Theme.of(context).primaryColor,
//                       child: getIcon(widget.state),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [
//                         //* Vertical Spacer
//                         const SizedBox(height: 10.0),

//                         Row(
//                           children: [
//                             Expanded(
//                               child: SizedBox(
//                                 child: Text(
//                                   widget.message.length > 85
//                                       ? '${widget.message.substring(0, 85)}...'
//                                       : widget.message,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14.0,
//                                     decoration: TextDecoration.none,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         //* Vertical Spacer
//                         const SizedBox(height: 15.0),

//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Visibility(
//                               visible: widget.onDismiss != null,
//                               child: SizedBox(
//                                 child: ElevatedButton(
//                                   style: TextButton.styleFrom(
//                                     elevation: 0.0,
//                                     backgroundColor: Colors.grey,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25.0),
//                                     ),
//                                   ),
//                                   onPressed: widget.onDismiss,
//                                   child:
//                                       Text('  ${widget.dismissText ?? 'NO'} '),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10.0),
//                             SizedBox(
//                               child: ElevatedButton(
//                                 style: TextButton.styleFrom(
//                                   elevation: 0.0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                   ),
//                                 ),
//                                 onPressed: widget.onAccept,
//                                 child: Text(' ${widget.acceptText ?? 'OK'} '),
//                               ),
//                             ),

//                             //* Horizontal Spacer
//                             const SizedBox(width: 10.0),

//                             Visibility(
//                               visible: widget.state == PopupState.error,
//                               child: TextButton(
//                                 style: TextButton.styleFrom(
//                                   elevation: 0.0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                   ),
//                                 ),
//                                 onPressed: () async {
//                                   final dirPath =
//                                       (await getTemporaryDirectory()).path;

//                                   final path = await controller.captureAndSave(
//                                     dirPath,
//                                     delay: const Duration(milliseconds: 100),
//                                   );

//                                   File? file;

//                                   if (path != null) {
//                                     file = File(path);
//                                   }

//                                   if (!mounted) return;

//                                   await Navigator.pushNamed(
//                                     context,
//                                     '/$support',
//                                     arguments: [
//                                       {
//                                         'detail': widget.message,
//                                         'title': widget.title,
//                                         'category': 'Bug Report',
//                                         'image': file,
//                                       }
//                                     ],
//                                   );
//                                 },
//                                 child: Row(
//                                   children: const [
//                                     Icon(
//                                       Icons.screenshot,
//                                       color: Colors.orange,
//                                       size: 20.0,
//                                     ),
//                                     Text(' ${'Get Help'}'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget getIcon(PopupState state, {double? size}) {
//   if (state == PopupState.error) {
//     return Align(
//       child: SizedBox(
//         width: size ?? 70.0,
//         height: size ?? 70.0,
//         child: const ImageIcon(
//           AssetImage('assets/images/xmark.png'),
//           color: Colors.white,
//         ),
//       ),
//     );
//   } else if (state == PopupState.confirm) {
//     return Align(
//       child: SizedBox(
//         width: size ?? 70.0,
//         height: size ?? 70.0,
//         child: const ImageIcon(
//           AssetImage('assets/images/question.png'),
//           color: Colors.white,
//         ),
//       ),
//     );
//   } else if (state == PopupState.success) {
//     return Align(
//       child: SizedBox(
//         width: size ?? 70.0,
//         height: size ?? 70.0,
//         child: const ImageIcon(
//           AssetImage('assets/images/check_2.png'),
//           color: Colors.white,
//         ),
//       ),
//     );
//   } else {
//     return Align(
//       child: SizedBox(
//         width: size ?? 70.0,
//         height: size ?? 70.0,
//         child: const ImageIcon(
//           AssetImage('assets/images/info.png'),
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

Future<dynamic> showCustomDialog(
  BuildContext context,
  Widget child, {
  bool? dismissible,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible ?? false,
    builder: (context) => child,
  );
}
