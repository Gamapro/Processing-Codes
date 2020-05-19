
void setup(){
  
  String a = "conejo"; // Debe de ser 2, insertar una r y cambiar una  a por o
  String b = "corneja";
  
  //String a = "xyzs"; // Debe de ser 4 
  //String b = "a";   
  
  //String a = "hola"; // Debe de ser 0
  //String b = "hola";
  
  int m=a.length();
  int n=b.length();
  int dp[][] = new int[n+1][m+1];
  levenstein(dp,a,b);
  print_table(dp,n,m,b,a);
}

void levenstein(int[][] dp,String a, String b){
  int m=a.length();
  int n=b.length();
   for(int i=0;i<=n;i++){
    for(int j=0;j<=m;j++){
       dp[i][j] = 0;
       if(i==0 || j==0)dp[i][j] = max(i,j); // Si el tamaño de alguna palabra es 0 , la cantidad de operaciones sera insertar la otra palabra, por lo que costara el max(i,j)
    }
  }
  for(int i=1;i<=n;i++){ // Palabra a cambiar
    for(int j=1;j<=m;j++){   // Palabra comparando
       dp[i][j] = min(    // Si no costara el minimo de insertar, eleminar o cambiar
         dp[i-1][j-1] + (a.charAt(j-1) == b.charAt(i-1) ? 0 : 1), // Tomamos el costo de la cadena si ambos caracteres, y si son diferentes, sumamos 1, el costo de hacer un cambio  
         min(dp[i-1][j] + 1,  // REMOVER
         dp[i][j-1] + 1)      // INSERTAR
       );
    }
    print("\n");
  }  
  print("Distancia de Leveinsten de " + a + " a " + b + " es " + dp[n][m] + "\n");
}

void print_table(int[][] dp,int n, int m,String a, String b){
  print("    ");
  for(int j=0;j<m;j++)print(b.charAt(j)+" "); print('\n');
   for(int i=0;i<=n;i++){
     if(i>0)print(a.charAt(i-1)+" "); else print("  ");
    for(int j=0;j<=m;j++){
       print(dp[i][j]+ " ");
    }
    print("\n");
  }  
}
