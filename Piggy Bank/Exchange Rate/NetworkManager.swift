import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchExchangeRates(completion: @escaping ([ExchangeRate]?) -> Void) {
        let url = "https://www.nbrb.by/api/exrates/rates?periodicity=0"
        
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
}




