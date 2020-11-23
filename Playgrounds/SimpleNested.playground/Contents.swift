import UIKit

let person = """
{
    "name": "Josh",
    "age": 30,
    "birthplace": {
        "latitude": 37.3326,
        "longitude": 122.0055
    }
}
"""

//Step 1 - Create a model
struct Person: Codable {
    var name: String
    var age: Int
    var birthplace: Birthplace
    
    struct Birthplace: Codable {
        var latitude: Double
        var longitude: Double
    }
}

//Step 2 - Convert the string to data
let personData = Data(person.utf8)

//Step 3 - Create a JSONDecoder instance
let jsonDecoder = JSONDecoder()

//Step 4 - Use the jsonDecoder instance to decode the json into a Person object
do {
    let decodedPerson = try jsonDecoder.decode(Person.self, from: personData)
    print("Person -- \(decodedPerson.name) was decode and their age is: \(decodedPerson.age).  Birthplace: \(decodedPerson.birthplace.latitude)")
} catch {
    print("Error: \(error.localizedDescription)")
}

