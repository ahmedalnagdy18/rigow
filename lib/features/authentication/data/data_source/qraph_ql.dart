const String loginn = r"""
mutation login($input :EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
     data{
       token
    }
    code
    success
    message
   
} 
}
""";

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
      firstName
      lastName
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

const String completeProfileAsUserr = r"""
mutation completeProfileAsUser($input:CompleteProfileInput!){
  completeProfileAsUser(input:$input){
    data
    {
      firstName
      lastName
      id
    }
    code
    success
    message
  
  }
}
""";

const String countriess = r"""
query countries($paginate:PaginatorInput, $searchKey: String){
  countries(paginate:$paginate, searchKey:$searchKey){
    data{
      items{
        id
        name
      }
    }
  }
}
""";

const String statess = r"""
query states($input:StatesFilterInput!){
  states(filter:$input){
     data{
      items{
        id
        name
      }
    }
    code
    success
    message
  }
}
""";

const String citiess = r"""
query cities($cityid : CitiesFilterInput!){
  cities (filter:$cityid){
    data{
      items{
        id
        name
      }
    }
    code
    success
    message
  }
}
""";

const String forgetPasswordd = r"""
mutation forgetPassword ($input:ForgetPasswordInput!){
  forgetPassword(input:$input){
    data
    code
    success
    message
    
  }
}
""";

const String resetPasswordByEmaill = r"""
mutation resetPasswordByEmail ($input:ResetPasswordInput!){
  resetPasswordByEmail(input:$input){
    data
    code
    success
    message
    
  }
}
""";

const String verifyForgetPasswordCodee = r"""
mutation verifyForgetPasswordCode($input:VerifyForgetPasswordCodeInput!){
  verifyForgetPasswordCode(input:$input){
    data
    code
    success
    message
  }
}
""";
