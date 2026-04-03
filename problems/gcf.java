class gdf{
    public static void main(String [] args){
        int num1=1;
        int num2=45;
        int n=1;
        if(num1!=num2){
            while(n!=0){
                n=num1%num2;
                if(n!=0){
                    num1=num2;
                    num2=n;
                }
            }
            System.out.println(num2);
        }else{
            System.out.println("error");
        }
    }
}
