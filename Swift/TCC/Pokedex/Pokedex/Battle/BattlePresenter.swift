import Foundation
import UIKit

internal class BattlePresenter: NSObject {

    internal weak var view: BattleViewProtocol?
    internal var repository: BattleRepositoryInputProtocol
    internal var coordinator: BattleCoordinatorProtocol
    
    private var firstOpponent: PokemonDetail
    private var secondOpponent: PokemonDetail
    
    private var firstOpponentStatus: PokemonBattleStatus
    private var secondOpponentStatus: PokemonBattleStatus
    private var round: Int = 1
    private var statusBattle: BattleStatus = .inGame {
        didSet{
            view?.resultBattle(result: statusBattle)
        }
    }
    private var battleLog: [BattleLog] = []
    
    private var timer: Timer?
    
    
    internal init(repository: BattleRepositoryInputProtocol,
                  coordinator: BattleCoordinatorProtocol, firstOpponent: PokemonDetail, secondOpponent: PokemonDetail) {
        self.firstOpponent = firstOpponent
        self.secondOpponent = secondOpponent
        self.repository = repository
        self.coordinator = coordinator
        self.firstOpponentStatus = PokemonBattleStatus(pokemonDetail: firstOpponent)
        self.secondOpponentStatus = PokemonBattleStatus(pokemonDetail: secondOpponent)
    }
}

// MARK: - Presenter Protocol
extension BattlePresenter: BattlePresenterProtocol {
    func viewDidLoad() {
        view?.setupFirstOpponent(pokemon: firstOpponent)
        view?.setupSecondOpponent(pokemon: secondOpponent)
        startBattle()
    }

}
// MARK: - Repository Output
extension BattlePresenter: BattleRepositoryOutputProtocol {
    
}

extension BattlePresenter {
    private func isDraw(wit first: PokemonBattleStatus, and second: PokemonBattleStatus) -> Bool{
        return first.attack < second.defense && second.attack < first.defense
    }
    
    private func startBattle(){
        if isDraw(wit: firstOpponentStatus, and: secondOpponentStatus){
            self.statusBattle = .draw
        }
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nextRound), userInfo: nil, repeats: true)
    }
    
    @objc func nextRound(){
        switch self.statusBattle {
            case .inGame:
                if round % 2 == 0 {
                    execRound(attack: &secondOpponentStatus, defense: &firstOpponentStatus, firstOpponent: false)
                } else {
                    execRound(attack: &firstOpponentStatus, defense: &secondOpponentStatus, firstOpponent: true)
                }
                round = round + 1
            default:
                break
        }
    }
    
    func execRound(attack: inout PokemonBattleStatus, defense: inout PokemonBattleStatus, firstOpponent: Bool){
        var damage = 0
        if (attack.attack - defense.defense) > 0 {
            damage = attack.attack - defense.defense
        }
        defense.hp = defense.hp - damage
        let newLog = BattleLog(nameAttack: attack.name, damegeCause: damage, nameDefense: defense.name, hpDefense: defense.hp)
        
        battleLog.append(newLog)
        
        if defense.hp <= 0 {
            statusBattle = .winner(name: attack.name)
            timer?.invalidate()
        }
        
        attBattleLogTable(firstOpponent: firstOpponent)
    }
    
    private func attBattleLogTable(firstOpponent: Bool){
        DispatchQueue.main.async {
            if firstOpponent {
                self.view?.insertRowFirstOpponenet(index: self.battleLog.count-1)
            } else {
                self.view?.insertRowSecondOpponenet(index: self.battleLog.count-1)
            }
        }
    }
}

extension BattlePresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension BattlePresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        battleLog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BattleLogCell.reuseIdentifier, for: indexPath)!
        
        let log = battleLog[indexPath.row]
        
        cell.setup(with: log)
        
        return cell
    }
    
}

struct PokemonBattleStatus {
    let name: String
    var hp: Int = 0
    let attack: Int
    let defense: Int
    
    init(pokemonDetail: PokemonDetail){
        self.name = pokemonDetail.name
        guard let hp = pokemonDetail.status.first(where: { status in
            status.stats.name == "hp"
        }) else {
            self.attack = 0
            self.defense = 0
            return
        }
        self.hp = hp.value
        
        guard let attack = pokemonDetail.status.first(where: { status in
            status.stats.name == "attack"
        }) else {
            self.attack = 0
            self.defense = 0
            return
        }
        self.attack = attack.value
        
        guard let defense = pokemonDetail.status.first(where: { status in
            status.stats.name == "defense"
        }) else {
            self.defense = 0
            return
        }
        self.defense = defense.value
    }
}

struct BattleLog {
    let nameAttack: String
    let damegeCause: Int
    let nameDefense: String
    let hpDefense: Int
}

enum BattleStatus {
    case inGame
    case winner(name: String)
    case draw
    
    var toText: String {
        switch self {
        case .winner(let name):
            return "Winner: \(name)"
        default:
            return "\(self)"
        }
    }
    
    var color: UIColor {
        switch self {
        case .winner:
            return .green
        case .draw:
            return .white
        case .inGame:
            return .yellow
        }
    }
}
