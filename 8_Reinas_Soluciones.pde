int[] pos = new int[8];
int[][] imp = new int[100][8];
int range,cont=0;

void print_arr(){
  print("cont ",cont," ");
  for(int i=0;i<8;i++){
      imp[cont][i]=pos[i];
      print(imp[cont][i]," ");
  }cont++;
  
  println();
}

boolean checa(int x,int y){
 for(int i=0;i<x;i++){
    if(pos[i]==y)return false;
    if(x+y==i+pos[i])return false;
    if(i-pos[i]==x-y)return false;
 }
 return true;
}

void bt(int x){
  if(x>=8){ print_arr(); 
    return; 
  }
  for(int y=0;y<8;y++){
    if(checa(x,y)){
      pos[x]=y;
      bt(x+1);   
    }
  }
  return;
}

void setup(){
   size(800,600);
   range=600/8;
   bt(0);
}

void show(int cual){
   for(int i=0;i<8;i++){
      for(int j=0;j<8;j++){
        noStroke();
        if((i+j)%2==1)fill(0);
        else fill(255);
        rect(i*range,j*range,range,range);
        if(imp[cual][i]==j){ fill(0,0,255); circle(i*range+(range/2),j*range+(range/2),40); }
      }
   }
   delay(500);
}

int a=0;

void draw(){
   background(255);
   show(a);
   fill(0);
   textSize(32);
   text("Cont: "+a,620,50);
   a=(a+1)%cont;
}
