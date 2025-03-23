void main(){
String mesaj="Selam Olcay";
int dogumYili=1996;
double oran=1.15;
bool isLogin=true;

print(mesaj);
/*print("Doğum yılı :" + dogumYili); -> Hata: Tip Uyuşmazlığı*/
print("Doğum yılı :" + dogumYili.toString());

}