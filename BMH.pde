int n,m;
int pre[] = new int[300];

void setup(){
  
  //xoxxoxo
  //axoxxxxoxoxxoxxoxofzs
  
  String t = "ababakakakakaba";
  String s = "aba";
  m=t.length();
  n=s.length();
  
  // PREPROCESAMIENTO
  for(int i=0;i<300;i++) pre[i]=n; // Asignar el max valor de desplazamiento a cada char
  for(int i=0;i<n;i++){  pre[(int)s.charAt(i)] = min(pre[(int)s.charAt(i)],i); }// tomamos la menor ocurrencia del char
  
  // BMH
  // Comparamos desde el final, y lo vamos recorriendo hacia la izquierda
  for(int i=n-1;i<m;){
    int k,j;
    for(j = 0 , k=n-1 ; j<n && k>=0 ;j++,k--){
      if( s.charAt(k) != t.charAt(i-j) ) break;
    }
    if(j==n){
      print("Substring encontada en el indice " + (i-n+1) + "\n");
      i++;   
    }else if(pre[(int)t.charAt(i-j)]==n){ // No existe el char en nuestra cadena
      i+=n;  // Salto del largo de la cadena
    }else{   // Si existe
      i += ( k-pre[t.charAt(i-j)] ); // Lo movemos tal que el char coincida con el primer char de la cadena pat
    }
  }
  // Esta raro este algoritmo
  // Complejidad O(m/n) Best O(n*M) Worst
}
