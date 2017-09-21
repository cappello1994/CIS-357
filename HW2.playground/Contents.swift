
//Problem #1
var authorRating: Dictionary<String, Float> = ["Mark Twain":8.9, "Nathaniel Hawthorne":5.1, "John Steinbeck":2.3, "C.S. Lewis":9.9, "Jon Krakaur":6.1]

var sumOfRatings = 0.0
for (author, rating)in authorRating{
    sumOfRatings += rating
    print(rating)
}