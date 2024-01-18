// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:taskify/shared/utils/logger.dart';
import 'package:taskify/shared/widgets/snackbar.dart';

class EmailService {
  /// Function to send email
  Future<int> sendOtp(BuildContext context, String email) async {
    String username = 'devjoboy@gmail.com';
    String password = 'jdeasnpdzvzwjqqw';

    final smtpServer = gmail(username, password);
    Random random = Random();

    int otp = random.nextInt(8999) + 1000;

    final message = Message()
    ..from=Address(username, 'Taskify')
    ..recipients=[email]
    ..subject='Feedback from Time Guard Application'
    ..text='Your OTP is $otp';

    try {
      await send(message, smtpServer);
      showSnackbar(context, 'OTP sent successfully. Check your email.');
      return otp;
    } on MailerException {
      showSnackbar(context, 'An error occured while sending feedback');
      return 0;
    } catch (e) {
      showSnackbar(context, 'An error occured');
      logger(e.toString());
      return 0;
    }

  }
}