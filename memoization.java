public class SimpleMemo {
    // We create an array to store results. 
    // index 10 will store the result of fib(10).
    static long[] memo = new long[101]; 

    public static long fib(int n) {
        // Base cases
        if (n <= 1) return n;

        // 1. Check if we have already calculated this
        if (memo[n] != 0) {
            return memo[n];
        }

        // 2. Calculate and store the result in our memo array
        memo[n] = fib(n - 1) + fib(n - 2);

        return memo[n];
    }

    public static void main(String[] args) {
        int n = 50;
        System.out.println("Result: " + fib(n));
    }
}
