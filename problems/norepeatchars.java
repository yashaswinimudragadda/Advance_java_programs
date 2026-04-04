class NoRepeat {
    public static void main(String[] args) {
        String str = "yashaswini";
        char[] name = str.toCharArray();
        int n = name.length;
        
        System.out.print("Non-repeating characters: ");

        for (int i = 0; i < n; i++) {
            boolean repeated = false;
            for (int j = 0; j < n; j++) {
                // Check if the character at i exists anywhere else (j)
                if (i != j && name[i] == name[j]) {
                    repeated = true;
                    break;
                }
            }
            // If we checked the whole string and 'repeated' is still false
            if (!repeated) {
                System.out.print(name[i] + " ");
            }
        }
    }
}
