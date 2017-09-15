//Problem #1
var authorRatings: Dictionary<String, Float> = ["Mark Twain":8.9, "Nathaniel Hawthorne":5.1, "John Steinbeck":2.3, "C.S. Lewis":9.9, "Jon Krakaur":6.1]

var sumOfRatings: Float = 0.0
var averageRating: Float = 0.0

for(author, rating) in authorRatings{
	sumOfRatings += rating;
}

averageRating = sumOfRatings/Float(authorRatings.count)

print("\(averageRating)")



//Problem #2
if(averageRating<5.0){
	print("Low")	
}

else if(averageRating >= 5 && averageRating < 7 ){
	print("Moderate")
}

else if (averageRating >= 7 ){
	print("High")
}



//Problem 4
func verbalizeNumber(count: Int) -> String{
	
	//Problem #3
	var strOut : String
	switch count {
		case 0:
			strOut = "none"
		case 1...3:
			strOut = "a few"
		case 4...9:
			strOut = "several"
		case 10...99:
			strOut = "tens of"
		case 100...999:
			strOut = "hundreds of"
		case 1000...999999:
			strOut = "thousands of"
		case let x where x > 999999:
			strOut = "millions of"
		default:
			strOut = "error"
	}
	
	return "There are \(strOut) pandas"
}



//Problem 5
for var i in 0...100{
	print(verbalizeNumber(count: i))
	i*=10
}



//Problem 6
func verbalizeAndShoutNumber( num:Int ) -> String{
	let strOut = ("THERE ARE " + verbalizeNumber(count: num).uppercased() + " PANDAS!\n")
	return strOut
}



//Problem 7
func expressNumbersElegantly(max: Int, verbalizeFunction: (Int) -> String ) -> String{
	var strOut = ""
	for index in 1...max{
		strOut += "\(verbalizeFunction(index))\n"
	}
	
	return strOut
}

var verbalizeWrapper: (Int) -> String = verbalizeNumber

print(expressNumbersElegantly( max: 5, verbalizeFunction: verbalizeWrapper ))

verbalizeWrapper = verbalizeAndShoutNumber

print(expressNumbersElegantly( max: 5, verbalizeFunction: verbalizeWrapper ))



//Problem 8
func expressNumbersVeryElegantly(numOfPrints max: Int, stringBuilder verbalizeFunction: (Int) -> String ) -> String{
	var strOut = ""
	for index in 1...max{
		strOut += "\(verbalizeFunction(index))\n"
	}
	
	return strOut
}



//Problem 9
var famousLastWords = ["the cow jumped over the moon.", "three score and four years ago", "lets nuc 'em Joe!", "ah, there is just something about Swift"]


print("\(famousLastWords.map( { (s: String) -> String in return "\(s[s.startIndex])".uppercased() + "\(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex])" } ) )" )

			     
//Problem 10			     
func batman(n: Int) -> String {
    //this switch statement is pretty cool... The internet helped with that one.
    switch (n % 15 == 0, n % 15 == 1, n == 1) {
    case (true, false, false):
        return "Batman"
    case (false, true, false):
        return "!"
    case (true, true, false):
        return "Batman!"
    default:
        return "Na"
    }
}

for index in 1...100{
    print(batman(n: index))
}			     
			   
