import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();
  login(phone, password) async {
    try {
      return await dio.post(
          'https://firstappwithheroku.herokuapp.com/authenticate',
          data: {"phone": phone, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e);
    }
  }

  addregistration(firstName, middleName, lastName, phone, region, zone, wereda,
      kebelie, password, role) async {
    return await dio.post('https://firstappwithheroku.herokuapp.com/register',
        data: {
          "firstName": firstName,
          "middleName": middleName,
          "lastName": lastName,
          "phone": phone,
          "region": region,
          "zone": zone,
          "wereda": wereda,
          "kebelie": kebelie,
          "password": password,
          "role": role
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addinnovativeidea(innovativeTitle, innovativeDescription, innovativeImage,
      date, innovatorId) async {
    return await dio.post(
        'https://firstappwithheroku.herokuapp.com/explore_idea',
        data: {
          "innovativeTitle": innovativeTitle,
          "innovativeDescription": innovativeDescription,
          "innovativeImage": innovativeImage,
          "date": date,
          "innovatorId": innovatorId
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addproblem(
      problemTitle, problemDescription, problemImage, date, reporterId) async {
    return await dio.post(
        'https://firstappwithheroku.herokuapp.com/reportproblem',
        data: {
          "problemTitle": problemTitle,
          "problemDescription": problemDescription,
          "problemImage": problemImage,
          "date": date,
          "reporterId": reporterId
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  comment(comments, commenterId, postId, date) async {
    return await dio.post('https://firstappwithheroku.herokuapp.com/comments',
        data: {
          "comments": comments,
          "commenterId": commenterId,
          "postId": postId,
          "date": date
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
