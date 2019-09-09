// Game class
public class Game {
	// Initiating the game's maze with a random maze selected from
	// the array of mazes declared in the start
	private String[] selectedMaze = mazes[(int)(Math.random() * mazes.length)];
	private Maze mazeBoard = new Maze(selectedMaze);

	// Initiating the players
	public List<Player> players = new ArrayList<Player>();

	// Timer that returns mm:ss time using frame refresh count
	public String timer() {
		int totalSeconds = frameRefreshCount / 30;
		int minutes = totalSeconds / 60;
		int seconds = totalSeconds % 60;

		String minuteString = (minutes < 10 ? "0" : "") + String.valueOf(minutes);
		String secondsString = (seconds < 10 ? "0" : "") + String.valueOf(seconds);
		String timeString = minuteString + ":" + secondsString;

		return timeString;
	}

	public void draw() {
		background(11, 76, 244); // Shade of blue

		mazeBoard.draw(); // Draw the maze
		mazeBoard.rotateInnerWall(); // Rotate the inner wall
		for (Player player : players) {
			player.draw(); // Draw the player
		}
	}

	Game(String mode) {
		int[][] colors = {
			{232, 210, 17},
			{255, 0, 0}
		};

		players.add(new Player(selectedMaze, colors[0]));

		if (mode.equals("multi")) {
			players.add(new Player(selectedMaze, colors[1]));
		}
	}
}
