import UIKit

let person = """
{
    "name": "Josh",
    "age": 30,
    "full_name": "Josh Smith"
}
"""

//1 - Create a model
struct Person: Codable {
    var name: String
    var age: Int
    var fullName: String
}

//2 - Convert the string to data
let personData = Data(person.utf8)

//3 - Create a JSONDecoder instance
let jsonDecoder = JSONDecoder()

//4 - set the keyDecodingStrategy to convertFromSnakeCase on the jsonDecoder instance
jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

//5 - Use the jsonDecoder instance to decode the json into a Person object
do {
    let decodedPerson = try jsonDecoder.decode(Person.self, from: personData)
    print("Person -- \(decodedPerson.name) was decode and their age is: \(decodedPerson.age)")
} catch {
    print("Error: \(error.localizedDescription)")
}

