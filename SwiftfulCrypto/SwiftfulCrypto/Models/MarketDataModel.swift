//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/4/24.
//

import Foundation

// JSON data:
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
 "data": {
 "active_cryptocurrencies": 11987,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 963,
 "total_market_cap": {
 "btc": 39967463.78054321,
 "eth": 773864195.4974678,
 "ltc": 26471610478.21047,
 "bch": 7355767420.812214,
 "bnb": 5460303013.403075,
 "eos": 2249671432878.192,
 "xrp": 2991550381496.5176,
 "xlm": 14375778420506.76,
 "link": 120473751270.07936,
 "dot": 224898995028.39365,
 "yfi": 228239179.43219733,
 "usd": 1732595635322.366,
 "aed": 6363390619630.235,
 "ars": 1404487953102603,
 "aud": 2575775429421.4443,
 "bdt": 190124756867394.16,
 "bhd": 653101924734.7648,
 "bmd": 1732595635322.366,
 "brl": 8517959921935.372,
 "cad": 2310418012298.0127,
 "chf": 1473376804534.8801,
 "clp": 1524597529301917.8,
 "cny": 12304287793587.094,
 "czk": 39001204214906.21,
 "dkk": 11798849797063.924,
 "eur": 1581837291306.063,
 "gbp": 1365323477738.0042,
 "gel": 4643356302663.935,
 "hkd": 13527839900869.207,
 "huf": 599161728254103.9,
 "idr": 26864130671068830,
 "ils": 6320548727355.592,
 "inr": 144225339214359.5,
 "jpy": 249934543816046.8,
 "krw": 2268856509930493.5,
 "kwd": 532787018626.711,
 "lkr": 559428817715677.25,
 "mmk": 3638100375127430.5,
 "mxn": 29443158470108.633,
 "myr": 8029714471901.5,
 "ngn": 1545198091405900.8,
 "nok": 17831917593628.67,
 "nzd": 2772738633840.526,
 "php": 96233557640114.47,
 "pkr": 488107492106381.6,
 "pln": 6878730400209.256,
 "rub": 158098490623135.28,
 "sar": 6497866029865.769,
 "sek": 17699107207798.668,
 "sgd": 2301146893053.402,
 "thb": 59738164910279.766,
 "try": 51589251323859.36,
 "twd": 53752048722836.95,
 "uah": 66053500257368.99,
 "vef": 173484800964.82874,
 "vnd": 42222392271515710,
 "zar": 32341576126144.195,
 "xdr": 1291246351349.7942,
 "xag": 75395648992.64449,
 "xau": 847187287.8035775,
 "bits": 39967463780543.21,
 "sats": 3996746378054321
 },
 "total_volume": {
 "btc": 3492135.0107930494,
 "eth": 67615955.45653546,
 "ltc": 2312942303.535341,
 "bch": 642706104.2080488,
 "bnb": 477090951.4635334,
 "eos": 196563795407.98886,
 "xrp": 261385057634.33023,
 "xlm": 1256075677088.4736,
 "link": 10526327289.664707,
 "dot": 19650425124.377285,
 "yfi": 19942271.886610575,
 "usd": 151384583992.59048,
 "aed": 555997730858.788,
 "ars": 122716356989715.53,
 "aud": 225056951484.6727,
 "bdt": 16612045325687.154,
 "bhd": 57064418936.00688,
 "bmd": 151384583992.59048,
 "brl": 744252030282.7747,
 "cad": 201871494138.70358,
 "chf": 128735482227.70695,
 "clp": 133210864684280.14,
 "cny": 1075080330910.9813,
 "czk": 3407708616433.813,
 "dkk": 1030917965914.9087,
 "eur": 138212157185.64337,
 "gbp": 119294382647.00937,
 "gel": 405710685100.1419,
 "hkd": 1181987518588.2126,
 "huf": 52351424144706.875,
 "idr": 2347238537978699,
 "ils": 552254444250.4008,
 "inr": 12601609130853.967,
 "jpy": 21837892333100.75,
 "krw": 198240080889273.75,
 "kwd": 46551970654.393585,
 "lkr": 48879783093530.27,
 "mmk": 317877005219097.56,
 "mxn": 2572579663457.365,
 "myr": 701591854513.6602,
 "ngn": 135010827387952.05,
 "nok": 1558053923066.3408,
 "nzd": 242266502377.53436,
 "php": 8408353797315.862,
 "pkr": 42648121771611.71,
 "pln": 601025258752.3767,
 "rub": 13813768051185.648,
 "sar": 567747445345.3718,
 "sek": 1546449689164.9724,
 "sgd": 201061435229.75916,
 "thb": 5219589071480.519,
 "try": 4507582260357.337,
 "twd": 4696555485170.731,
 "uah": 5771387999517.714,
 "vef": 15158138395.178104,
 "vnd": 3689158138740269,
 "zar": 2825827300788.556,
 "xdr": 112821934758.40596,
 "xag": 6587653070.867412,
 "xau": 74022520.03485699,
 "bits": 3492135010793.0493,
 "sats": 349213501079304.94
 },
 "market_cap_percentage": {
 "btc": 49.013529404210765,
 "eth": 15.5109142388268,
 "usdt": 5.343370569266734,
 "bnb": 2.8175562679833255,
 "sol": 2.4654497196223755,
 "xrp": 1.8095606140320402,
 "usdc": 1.4426632239138362,
 "steth": 1.192830246956464,
 "ada": 1.137328335582533,
 "avax": 0.7829646905486808
 },
 "market_cap_change_percentage_24h_usd": -3.17915781495926,
 "updated_at": 1704372195
 }
 }
 */

struct GlobalData: Codable {
  let data: MarketDataModel?
}

struct MarketDataModel: Codable {
  let totalMarketCap: [String: Double]
  let totalVolume: [String: Double]
  let marketCapPercentage: [String: Double]
  let marketCapChangePercentage24HUsd: Double
  
  enum CodingKeys: String, CodingKey {
    case totalMarketCap = "total_market_cap"
    case totalVolume = "total_volume"
    case marketCapPercentage = "market_cap_percentage"
    case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
  }
  
  var marketCap: String {
    if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
      return "$" + item.value.formattedWithAbbreviations()
    }
    
    return ""
  }
  
  var volume: String {
    if let item = totalVolume.first(where: { $0.key == "usd" }) {
      return "$" + item.value.formattedWithAbbreviations()
    }
    
    return ""
  }
  
  var btcDominance: String {
    if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
      return item.value.asPercentString()
    }
    
    return ""
  }
}
