import UIKit


struct Person: Codable {
    var name: String
    var age: Int
}

let person = Person(name: "Josh", age: 30)

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let encodePerson = try jsonEncoder.encode(person)
    let endcodeStringPerson = String(data: encodePerson, encoding: .utf8)!
    print(endcodeStringPerson)
} catch {
    print(error.localizedDescription)
}
