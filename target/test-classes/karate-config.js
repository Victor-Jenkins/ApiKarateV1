function fn() {

  var config = {
   baseURL : 'https://petstore.swagger.io/v2',
   resourcesPath : '../resources/'
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
 }