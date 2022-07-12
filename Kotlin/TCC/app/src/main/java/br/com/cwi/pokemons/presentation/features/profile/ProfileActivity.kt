package br.com.cwi.pokemons.presentation.features.profile

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.view.inputmethod.InputMethodManager
import android.widget.TextView
import android.widget.Toast
import br.com.cwi.pokemons.R
import br.com.cwi.pokemons.databinding.ActivityProfileBinding
import br.com.cwi.pokemons.domain.entity.Profile
import br.com.cwi.pokemons.presentation.base.BaseBottomNavigation
import br.com.cwi.pokemons.presentation.extension.visibleOrGone
import com.google.android.material.bottomnavigation.BottomNavigationView
import org.koin.androidx.viewmodel.ext.android.viewModel


const val REQUEST_CODE = 1000
const val IMAGE_CHOOSE = 1000;
const val PERMISSION_CODE = 1001;

class ProfileActivity : BaseBottomNavigation() {

    private lateinit var binding: ActivityProfileBinding

    override val currentTab: Int = R.id.profile_menu

    override fun getBottomNavigation(): BottomNavigationView = binding.bottomNavigation

    private val viewModel: ProfileViewModel by viewModel()

    private var editName: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpViewModel()
    }

    private fun setUpViewModel() {
        viewModel.profile.observe(this@ProfileActivity) { profile ->
            setUpProfileView(profile = profile)
        }
        viewModel.fetchProfile()
    }

    private fun setUpProfileView(profile: Profile) {
        binding.apply {
            tvFavoriteCount.text = profile.qtdFavorite.toString()
            tvUnlockedCount.text = profile.qtdUnlocked.toString()
            tvName.text = profile.name
            edName.setText(profile.name, TextView.BufferType.EDITABLE)
            visibilityEdit()
            ivEdit.apply {
                setOnClickListener {
                    editName = true
                    visibilityEdit()
                    edName.requestFocus()
                    edName.setSelection(edName.length())
                    val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
                    imm.showSoftInput(edName, InputMethodManager.SHOW_IMPLICIT)
                }
            }
            ivCheckbox.apply {
                setOnClickListener {
                    viewModel.setName(edName.text.toString())
                    editName = false
                    val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
                    imm.hideSoftInputFromWindow(edName.windowToken, 0)
                }
            }
            profile.image?.let {
                val mUri: Uri = Uri.parse(it)
                ivProfile.setImageURI(mUri)
            }
        }
        choseImage()
    }

    private fun visibilityEdit() {
        binding.edName.visibleOrGone(editName)
        binding.ivCheckbox.visibleOrGone(editName)
        binding.tvName.visibleOrGone(!editName)
        binding.ivEdit.visibleOrGone(!editName)
    }

    private fun choseImage() {
        binding.ivCamera.setOnClickListener {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED) {
                    val permissions = arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE)
                    requestPermissions(permissions, PERMISSION_CODE)
                } else {
                    chooseImageGallery();
                }
            } else {
                chooseImageGallery();
            }
        }
    }


    private fun chooseImageGallery() {
        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        startActivityForResult(intent, IMAGE_CHOOSE)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        when (requestCode) {
            PERMISSION_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    chooseImageGallery()
                } else {
                    Toast.makeText(this, "Permission denied", Toast.LENGTH_SHORT).show()
                }
            }
        }
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == REQUEST_CODE && resultCode == Activity.RESULT_OK) {
            viewModel.setImage(data?.data)
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}