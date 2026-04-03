class Perfectnumber{
    public static void main (String [] args){
        int num=1111;
        int temp=num;
        int n=1;
        int r=0;
        int sum=0;
        while(n>0){
            r=num%10;
            sum=sum+r;
            num=num/10;
            n++;
        }
        System.out.println(sum);
        if(sum==temp){
            System.out.println("perfect number");
        }
        else{
            System.out.println("not perfect number");
        }
    }
}
