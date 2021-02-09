import 'package:http/http.dart' as http;
import 'package:smsm/model/member.dart';

class Services {
  Future fetchUsers() async {
    try {
      http.Response response = await http.get('https://api.github.com/users');
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (error) {
      print(error);
    }
  }
}
