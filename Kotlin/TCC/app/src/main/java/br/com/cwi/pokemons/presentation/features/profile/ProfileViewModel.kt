package br.com.cwi.pokemons.presentation.features.profile

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.Profile
import br.com.cwi.pokemons.domain.repository.ProfileRepository
import kotlinx.coroutines.launch

const val ID_DEFAULT = 1

class ProfileViewModel(
    private val profileRepository: ProfileRepository
) : ViewModel() {

    private val _profile = MutableLiveData<Profile>()
    val profile: LiveData<Profile> = _profile

    fun fetchProfile() {
        viewModelScope.launch {
            _profile.postValue(profileRepository.getProfileById(ID_DEFAULT))
        }
    }
}