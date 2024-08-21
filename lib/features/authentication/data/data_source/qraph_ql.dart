const String registerMutation = r"""
mutation register($input :ManualRegisterInput!){
  register(input:$input){
    success
    code
    message
    data
} 
}
""";

const String sendEmailVerificationCodee = r"""
mutation sendEmailVerificationCode($input:SendEmailVerificationCodeInput!){
  sendEmailVerificationCode(input:$input){
    data
    code
    success
    message
  }
}
""";

const String verifyUserByEmailInput = r"""
mutation verifyUserByEmail($input:VerifyUserByEmailInput!){
  verifyUserByEmail(input:$input){
    data{
      token
    }
    code
    success
    message
  }
}
""";

const String validateUsernamee = r"""
mutation validateUsername($username:String!){
  validateUsername(username:$username){
   data
    code
    success
    message
  }
}
""";
