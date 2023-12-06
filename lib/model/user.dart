class User{
  
  String id = '';
  String firstname = '';
  String lastname = '';
  String age = '';
  String phone = '';
  String email = '';
  String user = '';
  String password = '';
  String confirmPassword = '';


  getId(){
    return this.id;
  }
  setId(id){
    return this.id = id;
  }
  getFirstname(){
    return this.firstname;
  }
  setFirstname(firstname){
    return this.firstname = firstname;
  }
  getLastname(){
    return this.lastname;
  }
  setLastname(lastname){
    return this.lastname = lastname;
  }
  getAge(){
    return this.age;
  }
  setAge(age){
    return this.age = age;
  }
  getPhone(){
    return this.phone;
  }
  setPhone(phone){
    return this.phone = phone;
  }
  getEmail(){
    return this.email;
  }
  setEmail(email){
    return this.email = email;
  }
  getUser(){
    return this.user;
  }
  setUser(user){
    return this.user = user;
  }
  getPassword(){
    return this.password;
  }
  setPassword(password){
    return this.password = password;
  }
  getConfirmPassword(){
    return this.confirmPassword;
  }
  setConfirmPassword(confirmPassword){
    return this.confirmPassword = confirmPassword;
  }
}