//
//  PortfolioDataService.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/9/24.
//

import Foundation
import CoreData

final class PortfolioDataService {
  private let container: NSPersistentContainer
  private let containerName = "PortfolioContainer"
  private let entityName = "PortfolioEntity"
  @Published var savedEntities = [PortfolioEntity]()
  
  init() {
    self.container = NSPersistentContainer(name: containerName)
    self.container.loadPersistentStores { _, error in
      if let error {
        print("Error loading Core Data: \(error)")
      }
      self.getPortfolio()
    }
  }
  
  // MARK: PUBLIC
  
  func updatePortfolio(coin: CoinModel, amount: Double) {
    // coin이 이미 portfolio에 있는 지 확인
    if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
      if amount > 0 {
        update(entity: entity, amount: amount)
      } else {
        delete(entity: entity)
      }
    } else {
      add(coin: coin, amount: amount)
    }
  }
  
  // MARK: PRIVATE
  
  private func getPortfolio() {
    let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
    do {
      savedEntities = try container.viewContext.fetch(request)
    } catch {
      print("Error fetching Portfolio Entities: \(error)")
    }
  }
  
  private func add(coin: CoinModel, amount: Double) {
    let entity = PortfolioEntity(context: container.viewContext)
    entity.coinID = coin.id
    entity.amount = amount
    applyChanges()
  }
    
  private func update(entity: PortfolioEntity, amount: Double) {
    entity.amount = amount
    applyChanges()
  }
  
  private func delete(entity: PortfolioEntity) {
    container.viewContext.delete(entity)
    applyChanges()
  }
  
  private func save() {
    do {
      try container.viewContext.save()
    } catch {
      print("Error saving to Care Data: \(error)")
    }
  }
  
  private func applyChanges() {
    save()
    getPortfolio()
  }
}
