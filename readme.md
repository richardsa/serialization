# Project: Serialization and Working with Files

Serialization project completed for <a href="http://www.theodinproject.com/ruby-programming/file-i-o-and-serialization?ref=lc-pb">The Odin Project.</a>

## Warmup: Event Manager

In your Ruby days to come, you'll inevitably run into times when you'll be working with CSV files and imperfect data. 
Seriously... there is no such thing as a perfect dataset. Any time you find what looks like the perfect batch of data 
on something interesting, whether you're trying to plot airline flight delays on a map, tease out the nuggets from a 
master list of nonprofits, or scrape 10,000 emails to mercilessly SPAM with your latest get-rich-quick scheme, it will 
be full of mistakes, omissions, and misspellings. Working with and cleaning up data go hand in hand.

Your Task

    <a href="http://tutorials.jumpstartlab.com/projects/eventmanager.html">This tutorial from Jumpstart Lab</a> walks you through just that sort of operation. Give it a shot.

## Project: Hangman

1. Download the 5desk.txt dictionary file from <a href="http://scrapmaker.com/view/twelve-dicts/5desk.txt">http://scrapmaker.com/.</a>

2. When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.

3. You don't need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses she has before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.

4. Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.

5. Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects... you can serialize your game class too!

6. When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!
 