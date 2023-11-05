void main(){
  int a = 40;
  int b = 50;

  int x = 90;
  int y = 80;

  print("a == b : ${a==b}");
  print("a != b : ${a!=b}"); // ! = not , true yu false / false u true yapar
  print("a > b : ${a>b}");
  print("a >= b : ${a>=b}");
  print("a < b : ${a<b}");
  print("a <= b : ${a<=b}");

  print("a > b || x > y : ${a > b || x > y}");
  // OR : false - false : false, diğer durumlarda true

  print("a > b && x > y : ${a > b && x > y}");
  // AND : true - true : true, diğer durumlarda false

}