import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/forget_password_blocs/forget_password_bloc/forget_password_bloc.dart';
import 'package:trim_spot_barber_side/data/firebae_authentication/phone_number_validation.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/submit_buttons.dart';



  submitButtonChangePasswordOtpPage(BuildContext context) {
  return  submitButtonCyan(context, function: () {
                    context.read<ForgetPasswordBloc>().add(
                        SubmitOtpButtonPressed(
                            verificationId:
                                PhoneNumberAuthentication.verficationId,
                            context: context));
                    return null;
                  },
                      heigh: mediaqueryHeight(0.06, context),
                      text: "submit",
                      width: mediaqueryWidth(0.5, context));
  }