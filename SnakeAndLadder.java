import java.util.Random;
class SnakeAndLadder {
    public static void main(String[] args) {
       startplaying(1);
    }

    public static void startplaying(int numOfPlayers) {

        int[] playersPositions = new int[numOfPlayers];

        // calling a function to set the starting position as 0.
        settingStartingPositions(playersPositions);

        // displaying players current position
        int rolledDie = rollTheDie();
	System.out.println(rolledDie);

    }

    public static void currentPositions(int[] playersPositions) {
        for (int i = 0; i < playersPositions.length; i++) {
            System.out.println("player" + (i + 1) + " current position is: " + playersPositions[i]);
        }
    }

    // function to set players starting position as zero.
    public static int[] settingStartingPositions(int[] playersPositions) {
        for (int i = 0; i < playersPositions.length; i++) {
            playersPositions[i] = 0;
        }
        return playersPositions;
    }
}

public static int rollTheDie(){
        Random r = new Random();
        return r.nextInt(6) + 1;
    }
