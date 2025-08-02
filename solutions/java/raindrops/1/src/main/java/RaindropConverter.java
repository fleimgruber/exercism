class RaindropConverter {

    String convert(final int number) {
        String result = "";
        if (number % 3 == 0) {
            result += "Pling";
        }
        if (number % 5 == 0) {
            result += "Plang";
        }
        if (number % 7 == 0) {
            result += "Plong";
        }
        if (result == "") {
            return String.valueOf(number);
        } else {
            return result;
        }

    }

}
