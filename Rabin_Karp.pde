String aux;
String shp,sht;
int inc = 0;    

String text,pat;   // String texto y patron
int n,m;           // Tamaños del texto y patron respectivamente
int dig = 256;     // Numero de digitos
int hashT,hashP;   // Valor de aplicar la funcion hash en elString pat,text; respectivamente   
int mod = 997;     // Valor del modulo
int pows[];        // Arreglo donde almacenamos los valores de las potencias

void hashFunction(){
  // Calcular valores de pow
  pows = new int[max(n,m)];
  pows[0] = 1;
  for(int i=1;i<max(n,m);i++){
    pows[i] = ( pows[i-1]*dig ) % mod; 
  }
  
  // Calcular hash_func
  hashP=hashT=0;
  for(int i=0;i<m;i++){
    hashP = (hashP + pat.charAt(i) * pows[i]) % mod;
  }
  int hT[] = new int[n + 1]; 
  for(int i = 0; i < n; i++){ hT[i]=0; }
  for(int i = 0; i < n; i++){
    hT[i+1] = (hT[i] + text.charAt(i)*pows[i]) % mod;
  }
  
  // Checar Hash(t) == Hash(p)
  for(int i = m;i<=n;i++){
    hashT = (hT[i] + mod - hT[i-m]) % mod;
    if((hashP*pows[i-m])%mod == hashT){ 
      // Comenta las 3 lineas de abajo si te sientes con suerte ;v
      int index;
      for(index=0;index<m;index++){ if(pat.charAt(index)!=text.charAt(i-m+index))break; }
      if(index==m)
      println("Find in "+(i-m)); 
    }
  }
}

int calcVal(String s,int l,int r,int pato){
  int val = 0;
  //println(s + " " + l + " " + r);
  for(int i=l;i<r;i++){
    //  previo   valor de s[i]     valor de dig^i    modulo
    val = (val + ((int)s.charAt(i) * pows[i+pato])) % mod;
    //print(val + " ");
  }
  //println();
  return val;
}

String insertPat(int index){ 
  String aux2="";
  for(int i=0;i<text.length();i++){
    //println(index+pat.length()-1);
    if(i>=index&&i<=index+pat.length()-1)aux2+=pat.charAt(i-index);
    else aux2+=" ";
  }
  return aux2;
}

void setup(){
  background(0);
  size(1600,550); 
  //size(1000,550);
  //text = "111100001101110011101111";
  //pat = "111";
  text = "ababababaaaab";
  pat = "aba";
  //text = "May the force be with you";
  //pat = "force";
  //text = "C3-P0-4T-R2-D4-R2-D2";
  //pat = "R2-D2";
  //text="aaaaaaaaaaaaaaaaaa";
  //pat="aaa";
  
  n = text.length();
  m = pat.length();
  aux = text;
  aux = insertPat(0);
  textSize(50);
  hashFunction();
}

void draw(){
  background(0);
  
  textSize(50);
  textAlign(CENTER);
  text("POLYNOMIAL HASH :D",width/2,100);
  
  // PAT Y TEXT
  text("Text =",120,200);
  for(int i=0;i<n;i++){ text(text.charAt(i),300+i*50,200); }
  text(" Pat  =",120,300);
  for(int i=0;i<n;i++){ text(aux.charAt(i),300+i*50,300); }
  
  // BARRAS
  for(int i=0;i<n;i++){ text(aux.charAt(i)!=' '?'_':' ',300+i*50,215); }
  for(int i=0;i<n;i++){ text(aux.charAt(i)!=' '?'_':' ',300+i*50,315); }

  // HASH
  textSize(35);
  sht="Hash(T) = ( ";
  shp="Hash(P) = ( ";
  for(int i=inc;i<inc+m;i++){ sht+=text.charAt(i)+" * "+dig+"^"+(i)+(i-inc<m-1?" + ":""); }//,400+(i-inc)*220,400); }
  for(int i=0;i<m;i++){ shp+=pat.charAt(i)+" * "+dig+"^"+(i+inc)+(i<m-1?" + ":"");  } //,360+i*220,500); }
  sht+=" ) % 997 = " + calcVal(text,inc,inc+m,0); 
  shp+=" ) % 997 = " + calcVal(pat,0,m,inc);
  text(sht,width/2,400);
  text(shp,width/2,500);

  aux = insertPat(inc); 
  //delay(1000);
}

void keyPressed(){
    inc = (inc+1)%(n-m+1);
}
