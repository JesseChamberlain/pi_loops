# pi_loops
A program for finding loops within pi. This app builds off of previous research by Dan Sikorski (https://www.angio.net/pi/piquery.html) and Dr. Christopher Duston (https://levitopher.wordpress.com/2014/07/29/loops-in-the-digits-of-pi/).

### Current Phase
Phase ONE

### Technology
* Ruby, 2.4.1
* Rails, 5.1.2
* React, 15.6.1
* Foundation, 5.4.5
* Jasmine & Enzyme Testing, 3.6.1
* Node, 7.9.0

## Phases
### Phase ONE
Translate the working algorithm, written in C, into a scalable web app.

Goals:
- Set up database for efficient loop search of 1-6 digit numbers at any position
- Recreate algorithm as a script to search for loops
- Load database with 1,000,000 digits of pi
- Confirm known loops

### Phase TWO
Implement front end design and visualization

Goals:
- Create visual component of website to show pi (1,000,000 digits)
- Create visual aid to show loops with colors

### Phase THREE
Scale & Retest

Goals:
- Set up database for efficient loop search of 1-13 digit numbers at any position
- Refactor algorithm for larger numbers
- Load database with 5 trillion digits of pi
- Load database with additional random numbers of same size
- Search for new loops and compare results of pi against random numbers

### Phase FOUR
Refactor front end design and visualization

Goals:
- Create new way to visualize pi and loops
- Create graphs and charts for Scaled results

### Phase FIVE
Test all known prime numbers with application
