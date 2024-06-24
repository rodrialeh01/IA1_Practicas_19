package IA1S2024;
import robocode.*;
import java.awt.Color;
import robocode.HitRobotEvent;
import robocode.Robot;
import robocode.ScannedRobotEvent;

// API help : https://robocode.sourceforge.io/docs/robocode/robocode/Robot.html

/**
 * Practica3_19 - a robot by (your name here)
 */
public class Practica3_19 extends Robot
{
	/**
	 * run: Practica3_19's default behavior
	 */
	int turnDirection = 1;
	public void run() {
		// Initialization of the robot should be put here

		// After trying out your robot, try uncommenting the import at the top,
		// and the next line:

		// setColors(Color.red,Color.blue,Color.green); // body,gun,radar
		
		setBodyColor(Color.green);
		setGunColor(Color.gray);
		setRadarColor(Color.darkGray);

		// Robot main loop
		while(true) {
			// Replace the next 4 lines with any behavior you would like
			turnRight(5 * turnDirection);
			
		}
	}

	/**
	 * onScannedRobot: What to do when you see another robot
	 */
	public void onScannedRobot(ScannedRobotEvent e) {
		// Replace the next line with any behavior you would like
		if(e.getBearing() >= 0){
			turnDirection = 1;
		}else{
			turnDirection = -1;
		}		


		if(e.getDistance() < 200 && getEnergy() > 80){
			fire(3);
		}else if (getEnergy() > 50){
			fire(2);
		}else{
			fire(1);
		}		
		
		scan();
		/*
			if(getEnergy() > 80){
				fire(3);
			}else if (getEnergy() > 50){
				fire(2);
			}else{
				fire(1);
			}
		*/
	}

	/**
	 * onHitByBullet: What to do when you're hit by a bullet
	 */
	public void onHitByBullet(HitByBulletEvent e) {
		// Replace the next line with any behavior you would like
		turnRight(45);
		back(100);
	}
	
	/**
	 * onHitWall: What to do when you hit a wall
	 */
	public void onHitWall(HitWallEvent e) {
		// Replace the next line with any behavior you would like
		//back(20);
	}	
	
	public void onHitRobot(HitRobotEvent e) {
		back(50);
		ahead(100);
	}
}
