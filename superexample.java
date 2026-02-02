package MethodandConstructor;
class emp{
	private String ename;
	private double esal;
	private char egrade;
	private int eno;
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public double getEsal() {
		return esal;
	}
	public void setEsal(double esal) {
		this.esal = esal;
	}
	public char getEgrade() {
		return egrade;
	}
	public void setEgrade(char egrade) {
		this.egrade = egrade;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
}

public class superexample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		emp obj=new emp();
		obj.setEno(101);
		obj.setEname("anil");
		obj.setEsal(23455.44);
		obj.setEgrade('A');
		System.out.println("eno= "+obj.getEno());
		System.out.println("ename= "+obj.getEname());
		System.out.println("esal= "+obj.getEsal());
		System.out.println("egrade= "+obj.getEgrade());

	}

}
