class leapyear{
    public static void main(String [] args){
        int year=2001;
        if(year!=0 && year >0){
            if(year%400==0 || (year%4 == 0  && year%100 !=0) ){
                System.out.println("leap year");
            }
                System.out.println(" not leap year");
            
        }
    }
}
