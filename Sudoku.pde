int range=9;

int mat[][] = {
  {-1,-1,-1,1,-1,4,-1,5,8},
  {-1,-1,-1,3,2,5,6,-1,9},
  {-1,-1,-1,6,-1,-1,7,-1,1},
  {-1,-1,-1,4,-1,7,5,-1,6},
  {-1,-1,-1,-1,-1,2,3,-1,7},
  {-1,-1,-1,9,6,1,-1,2,4},
  {-1,-1,-1,7,1,-1,4,6,2},
  {-1,-1,-1,2,-1,6,9,-1,-1},
  {-1,-1,-1,5,-1,8,-1,7,3}
};

/*int mat[][] = {
  {9,6,-1,1,-1,4,-1,5,8},
  {-1,7,8,3,2,5,6,-1,9},
  {2,5,-1,6,-1,-1,7,-1,1},
  {8,-1,1,4,-1,7,5,-1,6},
  {-1,9,6,-1,-1,2,3,-1,7},
  {7,-1,5,9,6,1,-1,2,4},
  {5,-1,-1,7,1,-1,4,6,2},
  {3,1,7,2,-1,6,9,-1,-1},
  {-1,4,-1,5,-1,8,-1,7,3}
};*/

int chida[][] = new int[9][9];

boolean checa(int posx,int posy, int val){
  
  for(int i=0;i<range;i++){
     if(mat[i][posy]==val)return false;
  }
  
  for(int i=0;i<range;i++){
     if(mat[posx][i]==val)return false;
  }
  
  int deltax = posx/3; int deltay = posy/3;
   for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
         if(mat[i+deltax*3][j+deltay*3]==val)return false;
      }
    }
  
    return true;
}

void bt(int x, int y){
  //print(x + " " + y + "\n");
  if(x>=range){
    print("Solution found");
    for(int i=0;i<range;i++){
      for(int j=0;j<range;j++){
         chida[i][j] = mat[i][j]; 
      }
    }
    return;
  }
  if(mat[x][y]!=-1){
    y++; if(y>=range){ y=0; x++; }
    bt(x,y);
  }else{
    for(int val=1;val<=range;val++){
      if(checa(x,y,val)){
        //print("Entro\n");
          mat[x][y]=val;
          int x2=x,y2=y;
          y2++; if(y2>=range){ y2=0; x2++; }
          bt(x2,y2);
          mat[x][y]=-1;
      }
    }
  }
  return;
}

void setup(){
  size(900,900);
  bt(0,0);
}

void draw(){
  background(255);
  stroke(0);
  fill(255);
  
  strokeWeight(2);
  for(int i=0;i<range;i++){
    for(int j=0;j<range;j++){
       rect(100*i,100*j,range*100,range*100); 
    }
  }
  
  strokeWeight(10);
  for(int i=0;i<4;i++){
    line(i*300,0,i*300,height); 
  }
  for(int i=0;i<4;i++){
    line(0,i*300,width,i*300); 
  }
  
  textSize(40);
  textAlign(CENTER,CENTER);
  stroke(0);
  fill(0);
  for(int i=0;i<range;i++){
    for(int j=0;j<range;j++){
       if(mat[i][j]!=-1){ fill(0); text(mat[i][j],j*100+50,i*100+50); }
       else { fill(255,0,0); text(chida[i][j],j*100+50,i*100+50); }
    }
  }
}
