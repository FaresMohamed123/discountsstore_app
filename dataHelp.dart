// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use, file_names

import 'package:url_launcher/url_launcher.dart';

void OnPressedUrl(String uri) async {
            String url = uri;
            if (await canLaunch(url)) {
              await launch(
                url,
               
              );
            } else {
              // ignore:
              print('object');
            }
          }