import 'package:lms/helper/api.dart';

import '../post_gettoken.dart';



class AllSchedule{

  Future< Map<String, dynamic>> Get_All_Schedule({required String companyname,required String accounttype,required String username,required String password})async{
    Map<String,dynamic> token =await  GetToken().get_token(companyname: companyname, accounttype: accounttype, username: username, password: password);
    Map<String, dynamic>  data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/instructor/',
        token:token['token']);
    print('$data');
    return data;





}
}