package br.com.cwi.pokemons.presentation.features.battle

import android.os.CountDownTimer
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.BattleLog
import br.com.cwi.pokemons.domain.entity.PokemonDetail
import br.com.cwi.pokemons.domain.entity.Pokemons
import br.com.cwi.pokemons.domain.repository.PokemonRepository
import br.com.cwi.pokemons.domain.repository.UnlockedPokemonRepository
import kotlinx.coroutines.launch
import kotlin.math.absoluteValue

const val HP_DEAD = 0
const val STATUS_ATACK = "attack"
const val STATUS_DEFENSE = "defense"
const val STATUS_HP = "hp"

class BattleViewModel(
    private val pokemonRepository: PokemonRepository,
    private val unlockedPokemonRepository: UnlockedPokemonRepository
) : ViewModel() {

    private val _pokemons = MutableLiveData<List<Pokemons>>()
    val pokemons: LiveData<List<Pokemons>> = _pokemons

    private val _pokemonFirstChoice = MutableLiveData<PokemonDetail>()
    val pokemonFirstChoice: LiveData<PokemonDetail> = _pokemonFirstChoice

    private val _pokemonSecondChoice = MutableLiveData<PokemonDetail>()
    val pokemonSecondChoice: LiveData<PokemonDetail> = _pokemonSecondChoice

    private lateinit var countDownTimer: CountDownTimer

    private var rond: Int = 1

    private val _battleLog = MutableLiveData<List<BattleLog>>()
    val battleLog: LiveData<List<BattleLog>> = _battleLog

    private val _battleResult = MutableLiveData<String>()
    val battleResult: LiveData<String> = _battleResult

    fun fetchPokemons() {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemons()
            val pokemons = setUpUnlockedPokemons(pokemonResponse)
            _pokemons.postValue(filterUnlockedPokemons(pokemons))
        }
    }

    fun setPokemonFirstChoice(pokemonDetail: PokemonDetail) {
        _pokemonFirstChoice.postValue(pokemonDetail)
    }


    private fun setUpUnlockedPokemons(pokemons: List<Pokemons>): List<Pokemons> {
        viewModelScope.launch {
            pokemons.forEach {
                it.unlocked = unlockedPokemonRepository.isUnlockedPokemon(it.name)
            }
        }
        return pokemons
    }

    private fun filterUnlockedPokemons(pokemons: List<Pokemons>): List<Pokemons> {
        return pokemons.filter { pokemon -> pokemon.unlocked && pokemon.name != pokemonFirstChoice.value?.name }
    }

    fun setPokemonSecondChoice(name: String) {
        viewModelScope.launch {
            val pokemonResponse = pokemonRepository.getPokemonDetail(name)
            _pokemonSecondChoice.postValue(pokemonResponse)
        }
    }

    fun resetPokemonBattle() {
        _pokemonSecondChoice.postValue(null)
        _battleResult.postValue(null)
        _battleLog.postValue(emptyList())
    }

    fun startBattle(pokemonFirst: PokemonDetail, pokemonSecond: PokemonDetail) {
        val pokemonFirstAtack =
            pokemonFirst.status.find { status -> status.name == STATUS_ATACK }!!.value

        val pokemonFirstDefense =
            pokemonFirst.status.find { status -> status.name == STATUS_DEFENSE }!!.value

        var pokemonFirstHP =
            pokemonFirst.status.find { status -> status.name == STATUS_HP }!!.value

        val pokemonSecondAtack =
            pokemonSecond.status.find { status -> status.name == STATUS_ATACK }!!.value

        val pokemonSeconDefense =
            pokemonSecond.status.find { status -> status.name == STATUS_DEFENSE }!!.value

        var pokemonSecondHP =
            pokemonSecond.status.find { status -> status.name == STATUS_HP }!!.value


        if (isDraw(
                pokemonFirstAtack,
                pokemonFirstDefense,
                pokemonSecondAtack,
                pokemonSeconDefense
            )
        ) {
            _battleResult.postValue("Draw")
        } else {
            countDownTimer = object : CountDownTimer(300000, 1000) {
                override fun onTick(millisUntilFinished: Long) {
                    var battleLogList: MutableList<BattleLog> = ArrayList()
                    if (rond % 2 > 0) {
                        val damage = pokemonSeconDefense - pokemonFirstAtack
                        pokemonSecondHP += if (damage < 0) damage else 0
                        battleLog.value?.let {
                            battleLogList.addAll(it)
                        }
                        battleLogList.add(
                            BattleLog(
                                pokemonFirst.name,
                                damage.absoluteValue,
                                pokemonSecond.name,
                                pokemonSecondHP
                            )
                        )
                    } else {
                        val damage = pokemonFirstDefense - pokemonSecondAtack
                        pokemonFirstHP += if (damage < 0) damage else 0
                        battleLog.value?.let {
                            battleLogList.addAll(it)
                        }
                        battleLogList.add(
                            BattleLog(
                                pokemonSecond.name,
                                damage.absoluteValue,
                                pokemonFirst.name,
                                pokemonFirstHP
                            )
                        )
                    }
                    _battleLog.postValue(battleLogList)
                    rond++
                    endBattle(pokemonFirstHP,pokemonFirst.name, pokemonSecondHP,pokemonSecond.name)
                }
                override fun onFinish() {}
            }
            countDownTimer.start()
        }
    }

    private fun isDraw(
        pokemonFirstAtack: Int,
        pokemonFirstDefense: Int,
        pokemonSecondAtack: Int,
        pokemonSeconDefense: Int
    ): Boolean {
        return (pokemonFirstAtack <= pokemonSeconDefense) && (pokemonSecondAtack <= pokemonFirstDefense)
    }

    private fun endBattle(pokemonFirstHP: Int, namePokemonFirst: String , pokemonSecondHP: Int, namePokemonSecond: String) {
        if (pokemonFirstHP <= HP_DEAD || pokemonSecondHP <= HP_DEAD) {
            countDownTimer.cancel()
            rond = 1
            val winner = if(pokemonFirstHP < HP_DEAD) namePokemonSecond else namePokemonFirst
            _battleResult.postValue("Winner: ${winner.uppercase()}")
        }
    }
}