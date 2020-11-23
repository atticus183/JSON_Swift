import UIKit

struct Person: Codable {
    var name: String
    var age: Int
    var birthDate: Date
}

//iso8601 date format
let person = """
{
    "name": "Josh",
    "age": 30,
    "birthDate": "1990-12-15T00:00:00Z",
}
"""

let jsonDecoder = JSONDecoder()
jsonDecoder.dateDecodingStrategy = .iso8601 //1990-12-15T00:00:00Z

let personData = Data(person.utf8)

do {
    let decodedPerson = try jsonDecoder.decode(Person.self, from: personData)
    print("Person -- \(decodedPerson.name) was decode and their birthdate is: \(decodedPerson.birthDate)")
} catch {
    print("Error: \(error.localizedDescription)")
}


//---------------------------

//secondsSince1970 date format
let person2 = """
{
    "name": "Josh",
    "age": 30,
    "birthDate": 661219200,
}
"""

let jsonDecoder2 = JSONDecoder()
jsonDecoder2.dateDecodingStrategy = .secondsSince1970  //661219200  --> Note - must be an INT

let personData2 = Data(person2.utf8)

do {
    let decodedPerson = try jsonDecoder2.decode(Person.self, from: personData2)
    print("Person -- \(decodedPerson.name) was decode and their birthdate is: \(decodedPerson.birthDate)")
} catch {
    print("Error: \(error.localizedDescription)")
}

//---------------------------

//Custom date format
let person3 = """
{
    "name": "Josh",
    "age": 30,
    "birthDate": "1990/12/15",
}
"""

let jsonDecoder3 = JSONDecoder()

let dateFomatter = DateFormatter()
dateFomatter.dateFormat = "yyyy/MM/dd"  //1990/12/15

jsonDecoder3.dateDecodingStrategy = .formatted(dateFomatter)

let personData3 = Data(person3.utf8)

do {
    let decodedPerson = try jsonDecoder3.decode(Person.self, from: personData3)
    print("Person -- \(decodedPerson.name) was decode and their birthdate is: \(decodedPerson.birthDate)")
} catch {
    print("Error: \(error.localizedDescription)")
}
