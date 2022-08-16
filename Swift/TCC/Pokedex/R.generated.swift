//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `Card-blue`.
    static let cardBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "Card-blue")
    /// Color `Star`.
    static let star = Rswift.ColorResource(bundle: R.hostingBundle, name: "Star")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Card-blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cardBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cardBlue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Star", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func star(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.star, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Card-blue", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func cardBlue(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.cardBlue.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Star", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func star(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.star.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 31 images.
  struct image {
    /// Image `cave`.
    static let cave = Rswift.ImageResource(bundle: R.hostingBundle, name: "cave")
    /// Image `forest`.
    static let forest = Rswift.ImageResource(bundle: R.hostingBundle, name: "forest")
    /// Image `grassland_2`.
    static let grassland_2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "grassland_2")
    /// Image `grassland`.
    static let grassland = Rswift.ImageResource(bundle: R.hostingBundle, name: "grassland")
    /// Image `ic_battle`.
    static let ic_battle = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_battle")
    /// Image `ic_bug_type`.
    static let ic_bug_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_bug_type")
    /// Image `ic_dragon_type`.
    static let ic_dragon_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_dragon_type")
    /// Image `ic_electric_type`.
    static let ic_electric_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_electric_type")
    /// Image `ic_fairy_type`.
    static let ic_fairy_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_fairy_type")
    /// Image `ic_fighting_type`.
    static let ic_fighting_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_fighting_type")
    /// Image `ic_fire_type`.
    static let ic_fire_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_fire_type")
    /// Image `ic_flying_type`.
    static let ic_flying_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_flying_type")
    /// Image `ic_ghost_type`.
    static let ic_ghost_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_ghost_type")
    /// Image `ic_grass_type`.
    static let ic_grass_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_grass_type")
    /// Image `ic_ground_type`.
    static let ic_ground_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_ground_type")
    /// Image `ic_ice_type`.
    static let ic_ice_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_ice_type")
    /// Image `ic_normal_type`.
    static let ic_normal_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_normal_type")
    /// Image `ic_poison_type`.
    static let ic_poison_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_poison_type")
    /// Image `ic_psychic_type`.
    static let ic_psychic_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_psychic_type")
    /// Image `ic_rock_type`.
    static let ic_rock_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_rock_type")
    /// Image `ic_steel_type`.
    static let ic_steel_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_steel_type")
    /// Image `ic_water_type`.
    static let ic_water_type = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_water_type")
    /// Image `mountain`.
    static let mountain = Rswift.ImageResource(bundle: R.hostingBundle, name: "mountain")
    /// Image `pokebola`.
    static let pokebola = Rswift.ImageResource(bundle: R.hostingBundle, name: "pokebola")
    /// Image `pokedex`.
    static let pokedex = Rswift.ImageResource(bundle: R.hostingBundle, name: "pokedex")
    /// Image `pokemon_background`.
    static let pokemon_background = Rswift.ImageResource(bundle: R.hostingBundle, name: "pokemon_background")
    /// Image `pokemon_logo`.
    static let pokemon_logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "pokemon_logo")
    /// Image `rough_terrain`.
    static let rough_terrain = Rswift.ImageResource(bundle: R.hostingBundle, name: "rough_terrain")
    /// Image `sea`.
    static let sea = Rswift.ImageResource(bundle: R.hostingBundle, name: "sea")
    /// Image `urban`.
    static let urban = Rswift.ImageResource(bundle: R.hostingBundle, name: "urban")
    /// Image `waters_edge`.
    static let waters_edge = Rswift.ImageResource(bundle: R.hostingBundle, name: "waters_edge")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "cave", bundle: ..., traitCollection: ...)`
    static func cave(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.cave, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "forest", bundle: ..., traitCollection: ...)`
    static func forest(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.forest, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "grassland", bundle: ..., traitCollection: ...)`
    static func grassland(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.grassland, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "grassland_2", bundle: ..., traitCollection: ...)`
    static func grassland_2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.grassland_2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_battle", bundle: ..., traitCollection: ...)`
    static func ic_battle(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_battle, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_bug_type", bundle: ..., traitCollection: ...)`
    static func ic_bug_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_bug_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_dragon_type", bundle: ..., traitCollection: ...)`
    static func ic_dragon_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_dragon_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_electric_type", bundle: ..., traitCollection: ...)`
    static func ic_electric_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_electric_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_fairy_type", bundle: ..., traitCollection: ...)`
    static func ic_fairy_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_fairy_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_fighting_type", bundle: ..., traitCollection: ...)`
    static func ic_fighting_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_fighting_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_fire_type", bundle: ..., traitCollection: ...)`
    static func ic_fire_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_fire_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_flying_type", bundle: ..., traitCollection: ...)`
    static func ic_flying_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_flying_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_ghost_type", bundle: ..., traitCollection: ...)`
    static func ic_ghost_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_ghost_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_grass_type", bundle: ..., traitCollection: ...)`
    static func ic_grass_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_grass_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_ground_type", bundle: ..., traitCollection: ...)`
    static func ic_ground_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_ground_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_ice_type", bundle: ..., traitCollection: ...)`
    static func ic_ice_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_ice_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_normal_type", bundle: ..., traitCollection: ...)`
    static func ic_normal_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_normal_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_poison_type", bundle: ..., traitCollection: ...)`
    static func ic_poison_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_poison_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_psychic_type", bundle: ..., traitCollection: ...)`
    static func ic_psychic_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_psychic_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_rock_type", bundle: ..., traitCollection: ...)`
    static func ic_rock_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_rock_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_steel_type", bundle: ..., traitCollection: ...)`
    static func ic_steel_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_steel_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ic_water_type", bundle: ..., traitCollection: ...)`
    static func ic_water_type(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_water_type, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "mountain", bundle: ..., traitCollection: ...)`
    static func mountain(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mountain, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pokebola", bundle: ..., traitCollection: ...)`
    static func pokebola(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pokebola, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pokedex", bundle: ..., traitCollection: ...)`
    static func pokedex(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pokedex, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pokemon_background", bundle: ..., traitCollection: ...)`
    static func pokemon_background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pokemon_background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pokemon_logo", bundle: ..., traitCollection: ...)`
    static func pokemon_logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pokemon_logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "rough_terrain", bundle: ..., traitCollection: ...)`
    static func rough_terrain(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.rough_terrain, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sea", bundle: ..., traitCollection: ...)`
    static func sea(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sea, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "urban", bundle: ..., traitCollection: ...)`
    static func urban(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.urban, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "waters_edge", bundle: ..., traitCollection: ...)`
    static func waters_edge(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.waters_edge, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 9 localization keys.
    struct localizable {
      /// Value: %s: Damage %s, %s: live %s
      static let battleLogRow = Rswift.StringResource(key: "battle.log.row", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: ???
      static let unloackedPokemonName = Rswift.StringResource(key: "unloacked.pokemon.name", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Battle
      static let battleTitle = Rswift.StringResource(key: "battle.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Battle log:
      static let battleLogTitle = Rswift.StringResource(key: "battle.log.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Choose Opponent:
      static let battleChooseOpponnent = Rswift.StringResource(key: "battle.choose.opponnent", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Favorites
      static let favoritePokemons = Rswift.StringResource(key: "favorite.pokemons", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: First choice:
      static let battleTitleFirstOpponent = Rswift.StringResource(key: "battle.title.first.opponent", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Select Opponent
      static let battleChoiceTitle = Rswift.StringResource(key: "battle.choice.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Unloacked
      static let unloackedPokemons = Rswift.StringResource(key: "unloacked.pokemons", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: %s: Damage %s, %s: live %s
      static func battleLogRow(_ value1: UnsafePointer<CChar>, _ value2: UnsafePointer<CChar>, _ value3: UnsafePointer<CChar>, _ value4: UnsafePointer<CChar>, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("battle.log.row", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1, value2, value3, value4)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.log.row"
        }

        let format = NSLocalizedString("battle.log.row", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1, value2, value3, value4)
      }

      /// Value: ???
      static func unloackedPokemonName(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unloacked.pokemon.name", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unloacked.pokemon.name"
        }

        return NSLocalizedString("unloacked.pokemon.name", bundle: bundle, comment: "")
      }

      /// Value: Battle
      static func battleTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("battle.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.title"
        }

        return NSLocalizedString("battle.title", bundle: bundle, comment: "")
      }

      /// Value: Battle log:
      static func battleLogTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("battle.log.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.log.title"
        }

        return NSLocalizedString("battle.log.title", bundle: bundle, comment: "")
      }

      /// Value: Choose Opponent:
      static func battleChooseOpponnent(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("battle.choose.opponnent", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.choose.opponnent"
        }

        return NSLocalizedString("battle.choose.opponnent", bundle: bundle, comment: "")
      }

      /// Value: Favorites
      static func favoritePokemons(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("favorite.pokemons", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "favorite.pokemons"
        }

        return NSLocalizedString("favorite.pokemons", bundle: bundle, comment: "")
      }

      /// Value: First choice:
      static func battleTitleFirstOpponent(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("battle.title.first.opponent", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.title.first.opponent"
        }

        return NSLocalizedString("battle.title.first.opponent", bundle: bundle, comment: "")
      }

      /// Value: Select Opponent
      static func battleChoiceTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("battle.choice.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "battle.choice.title"
        }

        return NSLocalizedString("battle.choice.title", bundle: bundle, comment: "")
      }

      /// Value: Unloacked
      static func unloackedPokemons(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("unloacked.pokemons", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "unloacked.pokemons"
        }

        return NSLocalizedString("unloacked.pokemons", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
