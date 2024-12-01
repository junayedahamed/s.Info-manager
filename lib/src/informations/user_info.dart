Map<String, dynamic> usrinfo = {};
String loginemail = '';
List info = [];

//  AwesomeDialog(
//                       dialogType: DialogType.warning,
//                       context: context,

//                       //   TextButton(
//                       //     onPressed: () {
//                       //       Navigator.of(context).pop();
//                       //     },
//                       //     child: const Text("Cancel"),
//                       //   ),
//                       btnOk: TextButton(
//                         onPressed: () {
//                           var outp = del.deleteUserById(usrinfo['id']);
//                           if (outp.toString() == "success") {
//                             usrinfo.clear();
//                             loginemail = '';
//                           }
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => Loginpage(),
//                             ),
//                           );
//                         },
//                         child: const Text("Ok"),
//                       ),
//                       btnCancel: TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text("Cancel"),
//                       ),
//                     );