int n;
int pre[];

void setup(){
  //String t = "axoxxxxoxoxxoxxoxofzs";
  //String s = "xoxxoxo";
  String t = "111100001101110011101111";
  String s = "111";
  kmp(s,t);
}

void kmp(String s,String t){
  int n=s.length(), m=t.length();
  genera_sp(s);
  for(int i=0,j=0;i<m;){
    if(s.charAt(j) == t.charAt(i)){
      j++; i++;
      if(j == n){
        print("Substring encontrada en index " + (i-n) + "\n");
        j = pre[j-1];
      }
    }else if(j!=0){
       j = pre[j-1];
    }else{
      i++; 
    }     
  }
}

void genera_sp(String s){
  int n = s.length();
  pre = new int[n];
  pre[0]=0; 
  for(int i = 1, j=0; i<n; i++){
    while(j>0 && s.charAt(i) != s.charAt(j) ) j = pre[j-1];
    if(s.charAt(i) == s.charAt(j)) j++;
    pre[i] = j;
  }
}


/*
void kmp(String s,String t){
    int i=0,j=0,m=t.length(),n=s.length();
    genera_sp(s);
    while(i<m){
        if(s.charAt(j)==t.charAt(i)){
            i++; j++;
        }
        if(j==n){
            print("Substring encontrada en index " + (i-n) + "\n");
            j=pre[j-1];
        }
        if(j<n&&i<m&&s.charAt(j)!=t.charAt(i)){
            if(j!=0) j=pre[j-1];
            else i++;
        }
    }
}


void genera_sp(String s){
    int n=s.length(),i,j;
    pre = new int[n];
    for(i=1,j=0;i<n&&j<n;){
        if(s.charAt(i)==s.charAt(j)){
            pre[i]=j+1;
            j++; i++;
        }else{
            if(j!=0){
                j=pre[j-1];
            }else{
                pre[i]=0;
                i++;
            }
        }
    }
}*/
