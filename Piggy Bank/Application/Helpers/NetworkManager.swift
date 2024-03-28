import Alamofire
import Foundation

final class NetworkManager: NSCopying {
    
    static let instance = NetworkManager()
    private let url = "https://www.nbrb.by/api/exrates/rates?periodicity=0"
    
    private init() {}
    
    func fetchExchangeRates(completion: @escaping ([ExchangeRate]?) -> Void) {
        AF.request(url).responseDecodable(of: [ExchangeRate].self) { response in
            switch response.result {
            case .success(let rates):
                completion(rates)
            case .failure(let error):
                print("Error fetching exchange rates: \(error)")
                completion(nil)
            }
        }
    }
    func copy(with zone: NSZone? = nil) -> Any {
        return NetworkManager.instance
    }
}




