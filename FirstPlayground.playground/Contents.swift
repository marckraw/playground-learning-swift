//type(of: myResult)

/*
 *
 * How to Handle Optionals
 *
 */
var optionalInt: Int?
var regularInt: Int

optionalInt = 100
regularInt = 200


// cheeck for nil
if(optionalInt != nil) {
    var unwrappedInt1 = optionalInt!
}

// thsi is optional binding
if let unwrappedInt2 = optionalInt {
    print(unwrappedInt2)
} else {
    // theres no value
}




/*
 *
 * Arrays
 *
 */

// variable array of Strings
var musicalModes = ["Ionian", "Dorian"]

// constant array of Int
let speedLimits = [50, 90, 100, 120, 140]


// whats at index 0
let initialMode = musicalModes[0]

// change the string at index 1
musicalModes[1] = "dupa"
musicalModes.append("Twoja stara")

// Type annotation for Array of Strings
var myStringArray: [String] = []

// Type annotation for Array of Int
var myIntArray: [Int] = []


/*
 *
 * Conditionals
 *
 */

var highSchool = 1000

// if/else
if highSchool > 1000 {
    print("it is bigger")
} else {
    print("it is not bigger")
}


// switch
let volcanoExplosivityIndex: Int = 3

switch volcanoExplosivityIndex {
case 1...2:
    print("0")
case 3...10:
    print("0")
default:
    break
}


print("\n")

// loops

//repeat {
//
//} while something < 100

//while something < 100 {
//
//}

let bunchOfWords = ["soemthing", "dupa", "whatever", "twoja stara"]

for word in bunchOfWords {
    print(word)
}

print("\n")

for number in 0...10 {
    print(number)
}

// Range operators
// 1...10
// 1..<10
// 1..>10

for number in stride(from: 0, through: 256, by: 16) {
    print(number)
}


/*
 *
 * Functions and Methods
 *
 */

func showMessage(number: Int, name: String) -> String { // parameters immutable by default, let's
    return "the function call worked. You passed number: \(number), and name: \(name)"
}

print(showMessage(number: 42, name: "Marcin"))

// ignoring returns value (tell compiler than you know what you do) - not only in functions
_ = showMessage(number: 20, name: "Marcin")


func showMessage2(_ message: String) {
    print("this is message: \(message)")
}

showMessage2("Some message")

// from is label for firstAmount (so is used for people to pass this to function as arguments, but inside body of the function we use firstAmount
func calculateDifference(from firstAmount: Int, to secondAmount: Int) -> Int {
    return firstAmount - secondAmount
}
calculateDifference(from: 20, to: 10)


func show(message: String) -> String {
    return "message \(message)"
}

show(message: "asdasd")




/*
 *
 * More Data types, enum
 *
 */

//enum MediaType {
//    case book, movie, music, game
//}

enum MediaType: String {
    case book = "ksiazka"
    case movie = "film"
    case music = "muzyka"
    case game = "gra"
}

var itemType: MediaType = .game
var something: MediaType
something = .music // === something = MediaType.music

switch itemType {
    case .movie:
        print(itemType.rawValue)
    case .music:
        print(itemType.rawValue)
    case .game:
        print(itemType.rawValue)
    case .book:
        print(itemType.rawValue)
}

// Enumerations: Associated values
enum AnotherMediaType {
    case movie(String)
    case music(Int)
    case book(String)
}

var firstItem: AnotherMediaType = .movie("Comedy")
var secondItem: AnotherMediaType = .music(120)

switch firstItem {
case .movie(let genre):
    print(genre)
case .music(let bpm):
    print(bpm)
case .book(let author):
    print(author)
        
}



/*
 *
 * More Data types, Struct value type (classes are reference type)
 *
 */


struct Movie {
    var title: String
    var director: String
    var releaseYear: Int
    var genre: String
    
    func structMethod() -> String{
        return "whatever"
    }
}

var first = Movie(title: "Star Wars", director: "Dunno", releaseYear: 2010, genre: "Sci-Fi")
var second = Movie(title: "Whatever", director: "Dunno", releaseYear: 2001, genre: "Horror")

second.director
second.releaseYear = 1991

print(first.structMethod())

 
/*
 *
 * More Data types, Dictionaries (like Map) - key values relation
 *
 */

// it is UNORDERED collection

var airlines = [
    "SWA": "Southwest Airlines",
    "BAW": "British Airways",
    "BHA": "Budha Air"
]

if let result = airlines["SWA"] {
    print(result)
}

// add or change
airlines["DVA"] = "Discovery Airlines"
airlines

// remove
airlines["BHA"] = nil
airlines

for (_, airline) in airlines { // (_, airline) is kind of destructuring airlines with tuple
    print(airline)
}

var periodicElements: [String: String]

var employees: [Int: String]


/*
 *
 * More Data types, Tuple - several elements gather together (value1, value2)
 *
 */

func randomFunction() -> (albumtitle: Int, length: Int) {
    let someVar1 = 1
    let someVar2 = 2

    let basicTuple = (someVar1, someVar2)
    
    return basicTuple
}

let (nextTitle, length) = randomFunction() // deconstructoring like in javascript


















/*
 *
 * Closures! - references type (struct are value type)
 *
 */


struct Book {
    var title: String
    var authorLastName: String
    var readingAge: Int
    var pageCount: Int
}

let book1 = Book.init(title: "Title 1", authorLastName: "Auhtor1", readingAge: 20, pageCount: 200)
let book2 = Book.init(title: "Title 2", authorLastName: "Auhtor2", readingAge: 12, pageCount: 2333)
let book3 = Book.init(title: "Title 3", authorLastName: "Auhtor3", readingAge: 40, pageCount: 900)

let allBooks = [book1, book3, book2]



let sortedBooks = allBooks.sorted { (b1, b2) -> Bool in
    return b1.pageCount > b2.pageCount
}

let sortedBooks2 = allBooks.sorted(by: { (b1, b2) -> Bool in
    return b1.pageCount > b2.pageCount
})

let sortedBooksShortest = allBooks.sorted { $0.pageCount > $1.pageCount }

print(sortedBooks)
print(sortedBooks2)
print(sortedBooksShortest)




/*
 *
 * Classes
 *
 */

class Appliance {
    // properties
    var manufacturer: String
    var model: String = ""
    var voltage: Int
    var capacity: Int?
    
    init() {
        self.manufacturer = "default manu"
        self.model = "default model"
        self.voltage = 120
    }
    
    init(withVoltage: Int) {
        self.manufacturer = "default manu"
        self.model = "default model"
        self.voltage = withVoltage
    }
    
    deinit {
        // perform clean up here..
    }
    
    func getDetails() -> String {
        return self.manufacturer
    }
}

var kettle = Appliance()
kettle.manufacturer = "asdasd"
kettle

var newStuff = Appliance(withVoltage: 23)
newStuff



// learn more on Pluralsight
