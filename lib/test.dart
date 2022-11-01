// import 'package:flutter/material.dart';
// import 'package:textfield_tags/textfield_tags.dart';
//
// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   late double _distanceToField;
//   late TextfieldTagsController _controller;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _distanceToField = MediaQuery.of(context).size.width;
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   Function(String)? add;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextfieldTagsController();
//   }
//
//   List<String>? tagss = [];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "wellcome",
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 74, 137, 92),
//           centerTitle: true,
//           title: const Text('Enter a tag...'),
//         ),
//         body: Column(
//           children: [
//             TextFieldTags(
//               textfieldTagsController: _controller,
//               textSeparators: const [' ', ','],
//               letterCase: LetterCase.normal,
//               validator: (String tag) {
//                 if (tag == 'php') {
//                   return 'No, please just no';
//                 } else if (_controller.getTags!.contains(tag)) {
//                   return 'you already entered that';
//                 }
//                 return null;
//               },
//               inputfieldBuilder:
//                   (context, tec, fn, error, onChanged, onSubmitted) {
//                 return ((context, sc, tags, onTagDelete) {
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextField(
//                       controller: tec,
//                       focusNode: fn,
//                       decoration: InputDecoration(
//                         isDense: true,
//                         border: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 74, 137, 92),
//                             width: 3.0,
//                           ),
//                         ),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color.fromARGB(255, 74, 137, 92),
//                             width: 3.0,
//                           ),
//                         ),
//                         helperText: 'Enter language...',
//                         helperStyle: const TextStyle(
//                           color: Color.fromARGB(255, 74, 137, 92),
//                         ),
//                         hintText: _controller.hasTags ? '' : "Enter tag...",
//                         errorText: error,
//                         prefixIconConstraints:
//                             BoxConstraints(maxWidth: _distanceToField * 0.74),
//                         prefixIcon: tags.isNotEmpty
//                             ? SingleChildScrollView(
//                                 controller: sc,
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                     children: tags.map((String tag) {
//                                   return Container(
//                                     decoration: const BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(20.0),
//                                       ),
//                                       color: Color.fromARGB(255, 74, 137, 92),
//                                     ),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 5.0),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         InkWell(
//                                           child: Text(
//                                             tag.toString(),
//                                             style: const TextStyle(
//                                                 color: Colors.white),
//                                           ),
//                                           onTap: () {
//                                             setState(() {
//                                               add = onSubmitted;
//                                             });
//                                             print("$tag selected");
//                                           },
//                                         ),
//                                         const SizedBox(width: 4.0),
//                                         InkWell(
//                                           child: const Icon(
//                                             Icons.cancel,
//                                             size: 14.0,
//                                             color: Color.fromARGB(
//                                                 255, 233, 233, 233),
//                                           ),
//                                           onTap: () {
//                                             onTagDelete(tag);
//                                           },
//                                         )
//                                       ],
//                                     ),
//                                   );
//                                 }).toList()),
//                               )
//                             : null,
//                       ),
//                       onChanged: onChanged,
//                       onSubmitted: (value) {
//                         setState(() {
//                           tagss!.add(value);
//                         });
//                       },
//                     ),
//                   );
//                 });
//               },
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                   const Color.fromARGB(255, 74, 137, 92),
//                 ),
//               ),
//               onPressed: () {
//                 _controller.clearTags();
//               },
//               child: const Text('CLEAR TAGS'),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 400,
//               child: ListView.builder(
//                   itemCount: tagss!.length,
//                   itemBuilder: (context, index) {
//                     return Text(tagss![index]);
//                     // Expanded(
//                     //   child: Container(
//                     //      height: 300,
//                     //     width: MediaQuery.of(context).size.width, child: Column(
//                     //     children:
//                     //   ),
//                     //   ),
//                     // );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
