const String loginn = r"""
mutation login($input :EmailAndPasswordLoginInput!){
  emailAndPasswordLogin(input:$input){
     data{
       token
      firstName
      profilePicture
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

const String specialtiess = r"""
query specialties($paginate:PaginatorInput, $filter: SpecialtiesFilterInput){
  specialties(paginate:$paginate, filter:$filter){
    data{
      items{
        id
        name
        governmentPermitRequired
        faculties{
          id
          name
        }
      }
      pageInfo{
        page
        limit
        hasNext
        totalCount
      }
    }
    code
    success
    message
  }
}
""";

const String facultiess = r"""
query faculties($paginate:PaginatorInput, $filter: FacultiesFilterInput){
  faculties(paginate:$paginate, filter:$filter){
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

const String departmentss = r"""
query departments($paginate:PaginatorInput, $filter: DepartmentsFilterInput){
  departments(paginate:$paginate, filter:$filter){
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

const String createExpertRequestt = r"""
mutation createExpertRequest($input : CreateExpertRequest!){
  createExpertRequest(input:$input){
     data{
       token
      firstName
      lastName
      profilePicture
    }
    code
    success
    message
   
} 
}
""";

const String uploadFilee = r"""
mutation uploadFile($file:Upload!){
  uploadFile(file:$file,model:PROFILE_PICTURE){
    data
    code
     success
    message
  }
}
""";

const String socialRegisterr = r"""
mutation socialRegister($input :SocialRegisterInput!){
  socialRegister(input:$input){
   data{
    firstName
    id
    lastName
    token
    
  }
   code
   success
   message
} 
}
""";

const String myDataa = r"""
query me{
  me{
    data{
      firstName
      lastName
      username
      fullName
      phone
      gender
      role
      profilePicture
      hasCompletedRegistration
      token
      followersCount
      followingsCount
      birthDate
      readableBirthDate
      createdAt
      readableCreatedAt
      expertRequestStatus
      canPost
      isFollowed
      expert{
      bio
      socialLinks
        specialty{
          name
        }
    }
    }
    code
    success
    message
  }
}
""";

const String deleteAcc = r"""
mutation deleteAccount{
  deleteAccount{
    data
    code
    success
    message
  }
}
""";

const String logoutFromAcc = r"""
mutation logout($device: DeviceEnum!){
  logout(device:$device){
   data
   code
   success
   message
} 
}
""";

const String checkSocialProviderStatuss = r"""
query checkSocialProviderStatus($input:CheckSocialStatusInput!){
  checkSocialProviderStatus(input:$input){
    data{
      actionRequired
    user{
      token
    }
    }
    code
    success
    message
  }
}
""";

const String socialLoginn = r"""
mutation socialLogin($input: SocialLoginInput!){
  socialLogin(input:$input){
   data{
    id
    firstName
    profilePicture
    lastName
    token
  }
   code
   success
   message
} 
}
""";

const String socialMergee = r"""
mutation socialMerge($input: SocialMergeInput!){
  socialMerge(input:$input){
   data{
    id
    firstName
    profilePicture
    lastName
    token
  }
   code
   success
   message
} 
}
""";
