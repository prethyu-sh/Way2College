import 'package:flutter/material.dart';
class UserRegister extends StatefulWidget {
	const UserRegister({super.key});
	@override
		UserRegisterState createState() => UserRegisterState();
	}
class UserRegisterState extends State<UserRegister> {
	String textField1 = '';
	String textField2 = '';
	String textField3 = '';
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea(
				child: Container(
					constraints: const BoxConstraints.expand(),
					color: Color(0xFFFFFFFF),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Expanded(
								child: IntrinsicHeight(
									child: Container(
										color: Color(0xFFFFFFFF),
										width: double.infinity,
										height: double.infinity,
										child: SingleChildScrollView(
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Container(
														margin: const EdgeInsets.only( top: 24, bottom: 69, left: 10),
														width: 24,
														height: 24,
														child: Image.network(
															"https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/2p430m9g_expires_30_days.png",
															fit: BoxFit.fill,
														)
													),
													IntrinsicHeight(
														child: Container(
															width: double.infinity,
															child: Column(
																children: [
																	Container(
																		width: 251,
																		height: 154,
																		child: Image.network(
																			"https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/la7ez4xp_expires_30_days.png",
																			fit: BoxFit.fill,
																		)
																	),
																]
															),
														),
													),
													IntrinsicHeight(
														child: Container(
															decoration: BoxDecoration(
																borderRadius: BorderRadius.circular(46),
																color: Color(0xFF154C77),
															),
															padding: const EdgeInsets.symmetric(vertical: 71),
															margin: const EdgeInsets.only( bottom: 48, left: 22, right: 22),
															width: double.infinity,
															child: Column(
																children: [
																	IntrinsicHeight(
																		child: Container(
																			alignment: Alignment.center,
																			decoration: BoxDecoration(
																				borderRadius: BorderRadius.circular(10),
																				color: Color(0xFFFFFFFF),
																			),
																			margin: const EdgeInsets.only( bottom: 32, left: 40, right: 40),
																			width: double.infinity,
																			child: TextField(
																				style: TextStyle(
																					color: Color(0xFF000000),
																					fontSize: 16,
																				),
																				onChanged: (value) { 
																					setState(() { textField1 = value; });
																				},
																				decoration: InputDecoration(
																					hintText: "User Name",
																					isDense: true,
																					contentPadding: const EdgeInsets.only( top: 7, bottom: 7, left: 11, right: 11),
																					border: InputBorder.none,
																					focusedBorder: InputBorder.none,
																					filled: false,
																				),
																			),
																		),
																	),
																	IntrinsicHeight(
																		child: Container(
																			alignment: Alignment.center,
																			decoration: BoxDecoration(
																				borderRadius: BorderRadius.circular(10),
																				color: Color(0xFFFFFFFF),
																			),
																			margin: const EdgeInsets.only( bottom: 28, left: 40, right: 40),
																			width: double.infinity,
																			child: TextField(
																				style: TextStyle(
																					color: Color(0xFF000000),
																					fontSize: 16,
																				),
																				onChanged: (value) { 
																					setState(() { textField2 = value; });
																				},
																				decoration: InputDecoration(
																					hintText: "Password",
																					isDense: true,
																					contentPadding: const EdgeInsets.only( top: 13, bottom: 13, left: 12, right: 12),
																					border: InputBorder.none,
																					focusedBorder: InputBorder.none,
																					filled: false,
																				),
																			),
																		),
																	),
																	IntrinsicHeight(
																		child: Container(
																			alignment: Alignment.center,
																			decoration: BoxDecoration(
																				borderRadius: BorderRadius.circular(10),
																				color: Color(0xFFFFFFFF),
																			),
																			margin: const EdgeInsets.only( bottom: 42, left: 40, right: 40),
																			width: double.infinity,
																			child: TextField(
																				style: TextStyle(
																					color: Color(0xFF000000),
																					fontSize: 16,
																				),
																				onChanged: (value) { 
																					setState(() { textField3 = value; });
																				},
																				decoration: InputDecoration(
																					hintText: "Confirm Password",
																					isDense: true,
																					contentPadding: const EdgeInsets.only( top: 7, bottom: 7, left: 11, right: 11),
																					border: InputBorder.none,
																					focusedBorder: InputBorder.none,
																					filled: false,
																				),
																			),
																		),
																	),
																	InkWell(
																		onTap: () { print('Pressed'); },
																		child: IntrinsicWidth(
																			child: IntrinsicHeight(
																				child: Container(
																					decoration: BoxDecoration(
																						borderRadius: BorderRadius.circular(31),
																						color: Color(0xFFFFFFFF),
																					),
																					padding: const EdgeInsets.only( top: 16, bottom: 16, left: 46, right: 46),
																					child: Column(
																						crossAxisAlignment: CrossAxisAlignment.start,
																						children: [
																							Text(
																								"REGISTER",
																								style: TextStyle(
																									color: Color(0xFF000000),
																									fontSize: 20,
																								),
																							),
																						]
																					),
																				),
																			),
																		),
																	),
																]
															),
														),
													),
												],
											)
										),
									),
								),
							),
						],
					),
				),
			),
		);
	}
}