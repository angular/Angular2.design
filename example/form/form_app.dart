class Credntials {
  String username;
  String password;
}

class App {
  Form loginForm = new Form('login_form')
      ..field('email', 'username', new EmailValidator())
         ..onError('email', 'Not a valid email')
      ..field('password', new PasswordStregthValidator());

  App() {
    
  }
      
  login() {
    var c = new Credntials();
    form.commit(c);
    xhr.submit(c);
  }
}