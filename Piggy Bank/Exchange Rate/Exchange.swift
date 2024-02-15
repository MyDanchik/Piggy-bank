import Foundation

struct ExchangeRate: Decodable {
    let abbreviation: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case abbreviation = "Cur_Abbreviation"
        case rate = "Cur_OfficialRate"
    }
}
