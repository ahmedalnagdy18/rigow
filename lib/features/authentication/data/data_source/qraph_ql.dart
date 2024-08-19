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
