import UIKit

let account = """
{
    "name": "Capital One",
    "balances": {
        "current": 37103.45,
        "available": 1024.55
    }
}
"""

//Step 1 - Create a model
struct Account: Decodable {
    var name: String
    var currentBalance: Double
    var availableBalance: Double
    
    enum CodingKeys: String, CodingKey {
        case name, balances
    }
    
    enum BalancesCodingKeys: String, CodingKey {
        case currentBalance = "current"
        case availableBalance = "available"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        let nestedContainer = try container.nestedContainer(keyedBy: BalancesCodingKeys.self, forKey: .balances)
        currentBalance = try nestedContainer.decode(Double.self, forKey: .currentBalance)
        availableBalance = try nestedContainer.decode(Double.self, forKey: .availableBalance)
    }
}

let jsonDecoder = JSONDecoder()

let accountData = Data(account.utf8)

do {
    let decodedAccount = try jsonDecoder.decode(Account.self, from: accountData)
    print("Account: \(decodedAccount.name) has a balance of \(decodedAccount.currentBalance)")
} catch {
    print(error.localizedDescription)
}
