# Bricks and Board Code Challenge

## Launching This Project

This challenge is available as a Jupyter Notebook. Jupyter is a tool that lets you mix documentation, code, and output in a super convenient interface.

As long as you have docker, you can follow these simple steps to get it running. Open a command line and `cd` yourself into this project folder. Then:

**Build the Docker container and call it `bricks-and-board`:**

`docker build -t bricks-and-board .`

**Run the Docker container you just built, exposing Jupyter on port `8888`:**

`docker run --rm -it -p 8888:8888 -v $(pwd):/bricks -w /bricks bricks-and-board`

**Watch the command output for this section:**

```plaintext
Jupyter Server 2.8.0 is running at:
[I 2024-06-07 16:31:24.188 ServerApp] http://8b743bd5feb3:8888/lab?token=SOME_TOKEN
[I 2024-06-07 16:31:24.188 ServerApp]     http://127.0.0.1:8888/lab?token=SOME_TOKEN
[I 2024-06-07 16:31:24.188 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```

Just click your _second_ link (with 127.0.0.1) in the URL, and you're off to the races.

Open up `Challenge.ipynb` in that interface, click into the code block, and click the "Play" icon to run. Want some
help writing Python? Click "CodeWhisperer" along the bottom of the window, and it will allow you to log into Amazon Q,
an AI coding assistant similar to Github Copilot. Creating an account is free.

All set? On to the challenge.

## The Problem

I am in an open field with an endless supply of bricks. My hobby is stacking bricks up in equally-spaced columns of random heights.

I choose the number of columns randomly. It could be 10, or 27, or 63,972,152. I'm a patient guy and I like columns of bricks.

Each time, when I'm done, I lay a wooden board on top of the columns of bricks. I have access to a huge variety of board lengths, so I always choose one that starts exactly above the top of the first column, and stretches to exactly above the top of the last column, regardless of its angle.

It doesn't always touch the tops of those columns, of course. I chose the column heights randomly. Maybe on some occasions it rests on those, but in other cases it comes to rest on bricks anywhere in between them. It all depends on the height of the columns and where gravity dictates the board will sit. But in any case, these bricks are rough enough that the board never slides off, even at severe slopes.

Your job is to figure out, given the number of bricks in each column, the slope and y-intercept of my board.

Columns of bricks are provided in an array, where the array index is "x" and the value is "y".

## Forget The High School Line Formula Stuff?

Me too. Here's a quick refresher:

A straight line is defined by the formula y = mx + b:

* **x:** the column number, starting from 0
* **y:** the height of the board, in bricks, at that column
* **m:** the slope of the board, or "rise over run": take two points the board is touching, x1,y1 and x2,y2, and the slope is (y2 - y1) / (x2 - x1).
* **b:** y-intercept: how high the board is from the ground, in bricks, at column 0

> _Important Note:_ For simplicity, let's ignore the fact that any angled board will have a slightly varying height over the width of a stack of bricks. The board's height (y) when it's touching a brick is equal to the number of bricks beneath it.

## Here's an example

`[2, 14, 8, 94, 300, 210, 200, 99, 14, 12]`

Laying a board on top of this, it comes to rest on x=4 y=300, and x=6 y=200. ("Not 300 and 210?!" Some of you are thinking? Nope, if it rested on 210, the slope would be too severe that it would fall BELOW the top of the 200 stack. For real, check the math. This problem isn't as simple as it sounds.)

Slope is rise (y2 - y1) divided by run (x2 - x1). So: (200 - 300) / (6 - 4) = -50.

y-intercept can then be found by plugging the slope into the y=mx+b line equation for either of those resting points above. I'll pick x=6 y=200:

```
200 = -50 * 6 + b
200 = -300 + b
b = 200 - -300
b = 500
```

So with those stacks, slope is **-50** and y-intercept is **500**.

Write me a function that outputs those two variables given any input array. No gravity-defying boards!
