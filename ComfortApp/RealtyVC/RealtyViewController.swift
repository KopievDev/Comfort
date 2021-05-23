//
//  ViewController.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.04.2021.
//

import UIKit

class RealtyViewController: UIViewController {
    
    // MARK: - Свойства
    private let cellId = "cell" // Идентификатор ячейки
    private lazy var realtyTableView: UITableView = { // Объект таблицы
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(RealtyTableViewCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    var realtysData = [Realty]() // Массив с объектами Недвижимости
    
    
    // MARK: - Закгрузка экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp() // Настройка интерфейса
        getData() // Получение данных с сервера
    }

    // MARK: - Helpers
    func setUp() {
        navigationItem.title = "Недвижимость"
        view.addSubview(realtyTableView) // Добавление таблицы на представление контроллера
    }
    
    func getData() {
        let firebase = Firebase() // Фреймворк для общения с сервером
        let parser = Parser() // Декодирует данные с сервера
        guard let data =  parser.decodeJSON(type: DataProvider.self, from: firebase.getData(from: "/realtys")) else { return } // Декодируем данные и проверяем на nil
        realtysData = data.realtys // Заполняем пустой массив контроллера декодированными объектами
    }
    
    func showRealty(from index: IndexPath) {
        let descVC = DescriptionViewController()
        descVC.configure(realty: realtysData[index.row])
        navigationController?.present(descVC, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension RealtyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // Обработка касаний по ячейке
        showRealty(from: indexPath)
    }
    
}
// MARK: - UITableViewDataSource
extension RealtyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // Метод возвращает кол-во ячеек
        return realtysData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // Заполняет ячейку данными
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return configure(cell: cell, at: indexPath)
    }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath) -> RealtyTableViewCell { // Конфигурирует ячейку
        guard let newCell = cell as? RealtyTableViewCell else { return RealtyTableViewCell()}
        newCell.configureCell(realty: realtysData[indexPath.row])
        return newCell
    }
    
    
}
