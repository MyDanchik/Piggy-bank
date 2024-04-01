import UIKit

final class ConverterViewModel {
    
    private let networkManager = NetworkManager.instance
    
    var exchangeRates: [ExchangeRate] = []
    
    func fetchConverterRates(completion: @escaping ([ExchangeRate]?) -> Void) {
        networkManager.fetchExchangeRates { [weak self] rates in
            if let rates = rates {
                let filteredRates = rates.filter {
                    $0.abbreviation == "USD" ||
                    $0.abbreviation == "EUR" ||
                    $0.abbreviation == "RUB" ||
                    $0.abbreviation == "PLN" ||
                    $0.abbreviation == "CNY"
                }
                self?.exchangeRates = filteredRates
                completion(filteredRates)
            } else {
                completion(nil)
                print("Failed to fetch exchange rates")
            }
        }
    }
    
    func convertCurrency(from sourceCurrency: String, to targetCurrency: String, amount: Double) -> Double? {
        guard let sourceRate = exchangeRates.first(where: { $0.abbreviation == sourceCurrency }),
              targetCurrency == "BYN" else {
            return nil
        }
        
        return amount * (sourceRate.rate / sourceRate.scale)
    }
}

