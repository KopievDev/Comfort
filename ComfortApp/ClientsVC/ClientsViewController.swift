//
//  ClientsViewController.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class ClientsViewController: UIViewController {
    
    // MARK: - Properties
    private let cellId = "cell"
    private lazy var clientsTableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .plain)
        table.register(ClientCell.self, forCellReuseIdentifier: cellId)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    var clients = [Client]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Клиенты"
        view.addSubview(clientsTableView)
        getData()
    }

    func getData() {
        let firebase = Firebase() // Фреймворк для общения с сервером
        let parser = Parser() // Декодирует данные с сервера
        guard let data =  parser.decodeJSON(type: DataProvider.self, from: firebase.getData(from: "/clients")) else { return } // Декодируем данные и проверяем на nil
        clients = data.clients // Заполняем пустой массив контроллера декодированными объектами
    }

}

// MARK: - UITableViewDelegate
extension ClientsViewController: UITableViewDelegate {

}
// MARK: - UITableViewDataSource
extension ClientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return configure(cell: cell, at: indexPath)
    }
    
    func configure(cell: UITableViewCell, at indexPath: IndexPath) -> ClientCell {
        guard let newCell = cell as? ClientCell else { return ClientCell()}
        newCell.configureCell(client: clients[indexPath.row])
        return newCell
    }
    
    
}
