void main(){
  var sistemeGirmisMi=false;
  //sistemeGirmisMi="Olcay"; ->hatalı
  if(sistemeGirmisMi==true){
print("Anasayfaya gidildi");
  }
    else{
print("Login Sayfasına gidildi");
  }



int puan=65;
if(puan>=50){
  print("Geçti");
}
else if(puan>=40){
    print("Bütünleme");
}
else{
  print("Kaldı");
}

String not="A";
switch(not){
  case "A":{ print("Süper");}
  break;
  case "B":{ print("Orta");}
  break;
  case "C":{ print("Kötü");}
  break;
  default:{print("Bilinmiyor");}
  break;
}
}