//
//  main.swift
//  Lesson5_OOP
//
//  Created by Evgeniy Kozionov on 28.12.2020.
//

import Foundation
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */

protocol CarBrandPrn {
    var prnBrand : String {get}
    
}

enum HatchState {
    case open, close
}

enum TrunkState {
      case full, empty
}


class Car {
      let brand: String
      let yearOfProduction: Int
      init (brand: String, yearOfProduction: Int) {
          self.brand = brand
          self.yearOfProduction = yearOfProduction
      }
}

class sportCar : Car, CarBrandPrn {
    var prnBrand: String
    
      var hatch : HatchState
      init (brand : String, yearOfProduction : Int, hatch : HatchState) {
        self.hatch = hatch
        self.prnBrand = brand
        super.init(brand : brand, yearOfProduction: yearOfProduction)
}

      func hatchState() {
          if hatch == .open {
              print("\(brand). Год выпуска \(yearOfProduction). Люк открыт")
          } else {
              print("\(brand). Год выпуска \(yearOfProduction). Люк закрыт")
          }
      }

  }

  class truckCar : Car {
      var trunk : TrunkState
      init (brand: String, yearOfProduction: Int, trunk : TrunkState) {
          self.trunk  = trunk
          super.init(brand : brand, yearOfProduction : yearOfProduction)
      }

      func trankState() {
          if trunk == .full {
              print("\(brand). Год выпуска \(yearOfProduction). Багажник заполнен")
          } else {
              print ("\(brand). Год выпуска \(yearOfProduction).Багажник пустой")
          }
      }
  }

  let porshe = sportCar(brand: "Porshe", yearOfProduction: 2019, hatch: .open)
  let lada = sportCar(brand: "Лада", yearOfProduction: 1979, hatch: .close)

  let zil = truckCar(brand: "Зил", yearOfProduction: 1988, trunk: .full)
  let kamaz = truckCar(brand: "Камаз", yearOfProduction: 1955, trunk: .empty)
  porshe.hatchState()
  lada.hatchState()

  zil.trankState()
  kamaz.trankState()

extension sportCar : CustomStringConvertible {
    var description: String {
        return "Бренд моей машины \(brand), год выпуска \(yearOfProduction)"
    }
}


