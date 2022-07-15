package br.com.cwi.pokemons.presentation.features.profile

import android.graphics.Bitmap
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.cwi.pokemons.domain.entity.Profile
import br.com.cwi.pokemons.domain.repository.ProfileRepository
import br.com.cwi.pokemons.presentation.extension.toStringBase64
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

    fun setName(name: String) {
        if (profile.value?.id == null) {
            profile.value?.let {
                it.id = ID_DEFAULT
                it.name = name
                viewModelScope.launch {
                    profileRepository.addProfile(it)
                }
            }
        } else {
            profile.value?.let {
                it.name = name
                viewModelScope.launch {
                    profileRepository.updateProfile(it)
                }
            }
        }
        fetchProfile()
    }

    fun setImage(bitmap: Bitmap) {
        if (profile.value?.id == null) {
            profile.value?.let { profile ->
                profile.id = ID_DEFAULT
                profile.image = bitmap.toStringBase64()
                viewModelScope.launch {
                    profileRepository.addProfile(profile)
                }
            }
        } else {
            profile.value?.let { profile ->
                profile.image = bitmap.toString()
                viewModelScope.launch {
                    profileRepository.updateProfile(profile)
                }
            }
        }
        fetchProfile()
    }
}