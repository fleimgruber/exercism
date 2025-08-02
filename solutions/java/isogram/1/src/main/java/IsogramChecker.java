import java.util.Arrays;

class IsogramChecker {

    boolean isIsogram(String phrase) {
        if (phrase.isEmpty()){
            return true;
        }
        phrase = phrase.toLowerCase();
        int phrase_length = phrase.length();
        char[] chars = phrase.toCharArray();
        Arrays.sort(chars);

        for (int i = 0; i < phrase_length - 1; i++){
            char current = chars[i];
            if (current == '-' || current == ' '){
                continue;
            }
            if (chars[i] == chars[i+1]){
                return false;
            } else {
            }
        }
        return true;
    }

}
