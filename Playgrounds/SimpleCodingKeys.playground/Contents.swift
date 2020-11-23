import UIKit

let person = """
{
    "name": "Josh",
    "age": 30,
    "full_name_of_person": "Josh Smith"
}
"""

//Step 1 - Create a model
struct Person: Codable {
    var name: String
    var age: Int
    var fullName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case fullName = "full_name_of_person"   //this string value should match EXACTLY with the corresponding key
    }
}

//Step 2 - Convert the string to data
let personData = Data(person.utf8)

//Step 3 - Create a JSONDecoder instance
let jsonDecoder = JSONDecoder()

//Step 4 - Use the jsonDecoder instance to decode the json into a Person object
do {
    let decodedPerson = try jsonDecoder.decode(Person.self, from: personData)
    print("Person -- \(decodedPerson.fullName) was decode and their age is: \(decodedPerson.age)")
} catch {
    print("Error: \(error.localizedDescription)")
}
