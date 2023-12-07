// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:helpme/app_components/navigate_to.dart';
// import 'package:helpme/app_components/section_class.dart';
// import 'package:helpme/app_components/text_form.dart';
// import 'package:helpme/client/bloc/home_client_cubit.dart';
// import 'package:helpme/client/bloc/home_client_states.dart';
// import 'package:helpme/client/screens/sections/detail_technical_screen.dart';
//
// // ignore: must_be_immutable
// class PlumbingScreen extends StatelessWidget {
//   PlumbingScreen({Key? key}) : super(key: key);
//   TextEditingController filterController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) =>
//       BlocProvider<ClientCubit>(
//         create: (BuildContext context) =>
//         ClientCubit()
//           ..clientGetTechnicalsData(),
//         child: BlocConsumer<ClientCubit, ClientStates>(
//           listener: (BuildContext context, ClientStates state) {},
//           builder: (BuildContext context, ClientStates state) {
//             final ClientCubit cubit = ClientCubit.get(context);
//             return ConditionalBuilder(
//               condition: state is! ClientGetTechnicalsDataLoadingState ,
//               builder: (context) =>
//                   Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: Scaffold(
//                       body: SafeArea(
//                         child: SingleChildScrollView(
//                           physics: const BouncingScrollPhysics(),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15),
//                             child: Form(
//                               key: formKey,
//                               child: InkWell(
//                                 onTap: () async {
//                                   await navigateTo(
//                                       context, const DetailTechnicalScreen());
//                                 },
//                                 child: Column(
//                                   children: <Widget>[
//                                     Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         IconButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           icon: const Icon(
//                                             Icons.arrow_back_ios,
//                                           ),
//                                         ),
//                                         const Text(
//                                           'قسم السباكه',
//                                           style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w700,
//                                             color: Color(0xff000000),
//                                           ),
//                                         ),
//                                         IconButton(
//                                           onPressed: () async {
//                                             await showModalBottomSheet(
//                                               backgroundColor:
//                                               const Color(0x00000080),
//                                               context: context,
//                                               builder: (BuildContext context) =>
//                                                   Directionality(
//                                                     textDirection: TextDirection
//                                                         .rtl,
//                                                     child: Column(
//                                                       children: <Widget>[
//                                                         const Spacer(),
//                                                         SvgPicture.asset(
//                                                           'assets/icons/Rectangle.svg',
//                                                         ),
//                                                         const SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         Container(
//                                                           width: double
//                                                               .infinity,
//                                                           height: 410,
//                                                           decoration: BoxDecoration(
//                                                             color: Colors.grey
//                                                                 .shade100,
//                                                             borderRadius:
//                                                             const BorderRadius
//                                                                 .vertical(
//                                                               top: Radius
//                                                                   .circular(30),
//                                                             ),
//                                                           ),
//                                                           child: Padding(
//                                                             padding:
//                                                             const EdgeInsets
//                                                                 .all(15),
//                                                             child: Column(
//                                                               children: <
//                                                                   Widget>[
//                                                                 const SizedBox(
//                                                                   height: 20,
//                                                                 ),
//                                                                 textForm(
//                                                                   controller:
//                                                                   filterController,
//                                                                   validation:
//                                                                       (
//                                                                       dynamic value) {
//                                                                     if (value
//                                                                         .toString()
//                                                                         .isEmpty) {
//                                                                       return 'من فضلك اكتب ما تريد البحث عنه';
//                                                                     }
//                                                                     return null;
//                                                                   },
//                                                                   type:
//                                                                   TextInputType
//                                                                       .text,
//                                                                   prefixIcon:
//                                                                   Icons.search,
//                                                                   hintText:
//                                                                   'اختر المحافظة',
//                                                                 ),
//                                                                 const SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 const Align(
//                                                                   alignment:
//                                                                   Alignment
//                                                                       .topRight,
//                                                                   child: Text(
//                                                                     'التقييم',
//                                                                     style: TextStyle(
//                                                                       fontSize: 16,
//                                                                       fontWeight:
//                                                                       FontWeight
//                                                                           .w400,
//                                                                       color: Color(
//                                                                           0xff000000),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 const SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Row(
//                                                                   textDirection:
//                                                                   TextDirection
//                                                                       .ltr,
//                                                                   mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .spaceBetween,
//                                                                   children: <
//                                                                       Widget>[
//                                                                     textButtonRating(
//                                                                       text: '1',
//                                                                     ),
//                                                                     textButtonRating(
//                                                                       text: '2',
//                                                                     ),
//                                                                     textButtonRating(
//                                                                       text: '3',
//                                                                     ),
//                                                                     textButtonRating(
//                                                                       text: '4',
//                                                                     ),
//                                                                     textButtonRating(
//                                                                       text: '5',
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 const SizedBox(
//                                                                   height: 15,
//                                                                 ),
//                                                                 Container(
//                                                                   width: 117,
//                                                                   height: 30,
//                                                                   decoration:
//                                                                   BoxDecoration(
//                                                                     borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                         5),
//                                                                     color: const Color(
//                                                                         0xffFF7A00),
//                                                                   ),
//                                                                   child: TextButton
//                                                                       .icon(
//                                                                     onPressed: () {},
//                                                                     icon: const Icon(
//                                                                       Icons
//                                                                           .filter_list,
//                                                                       size: 20,
//                                                                       textDirection:
//                                                                       TextDirection
//                                                                           .ltr,
//                                                                       color: Color(
//                                                                           0xffFFFFFF),
//                                                                     ),
//                                                                     label: const Text(
//                                                                       'طلب الفلتر',
//                                                                       style: TextStyle(
//                                                                         color: Color(
//                                                                             0xffFFFFFF),
//                                                                         fontSize: 14,
//                                                                         fontWeight:
//                                                                         FontWeight
//                                                                             .w700,
//                                                                         height: 1,
//                                                                       ),
//                                                                       textDirection:
//                                                                       TextDirection
//                                                                           .rtl,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                             );
//                                           },
//                                           icon: const Icon(
//                                             Icons.filter_list,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     SizedBox(
//                                       height: 645,
//                                       child: ListView.separated(
//                                         physics: const BouncingScrollPhysics(),
//                                         itemBuilder:
//                                             (BuildContext context, int index) =>
//                                             Container(
//                                               width: double.infinity,
//                                               height: 70,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius: BorderRadius
//                                                     .circular(9),
//                                               ),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(
//                                                     5),
//                                                 child: Row(
//                                                   children: <Widget>[
//                                                     const CircleAvatar(
//                                                       radius: 40,
//                                                       backgroundImage: AssetImage(
//                                                         'assets/images/aa.jpg',
//                                                       ),
//                                                     ),
//                                                     Column(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                       children: <Widget>[
//                                                         Text(
//                                                           '${cubit
//                                                               .clientGetTechnicalsDataModel!
//                                                               .data![index]
//                                                               .user!.name}',
//                                                           style: TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight: FontWeight
//                                                                 .w700,
//                                                             color: Color(
//                                                                 0xff000000),
//                                                           ),
//                                                         ),
//                                                         Row(
//                                                           children: <Widget>[
//                                                             const Icon(
//                                                               Icons
//                                                                   .location_on_sharp,
//                                                               color: Color(
//                                                                   0xffFF8B00),
//                                                               size: 20,
//                                                             ),
//                                                             const SizedBox(
//                                                               width: 4,
//                                                             ),
//                                                             Text(
//                                                               '${cubit
//                                                                   .clientGetTechnicalsDataModel!
//                                                                   .data![index]
//                                                                   .user!
//                                                                   .governorate}',
//                                                               style: TextStyle(
//                                                                 fontSize: 13,
//                                                                 fontWeight:
//                                                                 FontWeight.w700,
//                                                                 color: Colors
//                                                                     .orange
//                                                                     .shade500,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     const Spacer(),
//                                                     Row(
//                                                       children: <Widget>[
//                                                         const Text(
//                                                           '4.9',
//                                                           style: TextStyle(
//                                                             fontSize: 13,
//                                                             fontWeight: FontWeight
//                                                                 .w700,
//                                                             color: Colors
//                                                                 .orangeAccent,
//                                                           ),
//                                                         ),
//                                                         const SizedBox(
//                                                           width: 3,
//                                                         ),
//                                                         const Icon(
//                                                           Icons.star,
//                                                           color: Colors.orange,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                         separatorBuilder:
//                                             (BuildContext context, int index) =>
//                                         const SizedBox(
//                                           height: 5,
//                                           width: double.infinity,
//                                         ),
//                                         itemCount: cubit
//                                             .clientGetTechnicalsDataModel!.data!
//                                             .length,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//               fallback: (context) =>
//               const Center(child: CircularProgressIndicator()),
//             );
//           },
//         ),
//       );
// }
