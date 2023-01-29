/*

  Created by: Bakhromjon Polat
  Created on: Jan 29 2023 12:01:26
  Github: https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
/*

  Created by: Abduxalilov Abdulloh
  Created on: Jan 29 2023 13:00:18
  Documentation: 

*/

import 'api_service.dart';

class ApiRequests extends ApiService {
  ApiRequests._();

  static final ApiRequests instance = ApiRequests._();

  Future<HttpResult> getCounties() async {
    return await get('/countries');
  }
}
