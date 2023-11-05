void main(){
  //1 , 2 , 3

  for(var i = 1; i< 4; i++){
    print("Döngü 1 : $i");
  }

  // 10 ile 20 arasında 5 er artış

  for(var i = 10; i<21; i +=5){
    print("Döngü 2 : $i");
  }

  for(var y = 20; y>9; y -=5){
    print("Döngü 3 : $y");
  }

  var sayac = 1;

  while(sayac < 4){
    print("Döngü 4 : $sayac");
    sayac++;
  }

  // 1,2,3,4,5
  for(var i = 1; i<6; i +=1){
    if(i == 3){
      break;
    }
    print("Döngü 5 : $i");
  }

  for(var i = 1; i<6; i +=1){
    if(i == 3){
      continue;
    }
    print("Döngü 6 : $i");
  }


}