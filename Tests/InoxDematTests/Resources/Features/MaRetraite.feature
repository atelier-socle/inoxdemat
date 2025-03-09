Feature: Disponibilité des documents Ma Retraite

  Background:
    Given le code produit est 96904

  Scenario Outline: Les documents ne doivent pas être disponibles aux dates limites
    Given le nom du document est <name>
    And le fichier pdf est <pdf>
    And la date est <date>
    Then récupération du document
    And le document ne doit pas être disponible

    Examples:
      | name                                                     | pdf                            | date       |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2024-10 Fiche Info MA RETRAITE | 17-10-2024 |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2024-10 Fiche Info MA RETRAITE | 14-04-2025 |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2025-02 Fiche Info MA RETRAITE | 13-04-2025 |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2025-02 Fiche Info MA RETRAITE | 01-01-2099 |


  Scenario Outline: Les documents doivent être disponibles aux dates limites
    Given le nom du document est <name>
    And le fichier pdf est <pdf>
    And la date est <date>
    Then récupération du document
    And le document doit être disponible
    And le code produit doit être <codeUV>
    And le nom du produit doit être <productName>
    And le statut du document doit être <mandatoryOrOptional>
    And le type de document doit être <type>
    And la sélection du document doit être <selectedOrNot>
    And l'état du document doit être non lu
    And le document doit avoir <pages> pages
    And le docId de prod doit être <docID>
    And le nom du document de la GED doit être <GEDDocName>

    Examples:
      | name                                                     | pdf                            | date       | codeUV | productName | mandatoryOrOptional | type   | selectedOrNot | pages | docID                                  | GEDDocName                                |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2024-10 Fiche Info MA RETRAITE | 18-10-2024 | 96904  | MA RETRAITE | obligatoire         | Autres | sélectionné   | 4     | {B6134457-1229-4309-8192-8FF53722B231} | 975504-FICHE_INFORMATIONS_MA_RETRAITE.pdf |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2024-10 Fiche Info MA RETRAITE | 13-04-2025 | 96904  | MA RETRAITE | obligatoire         | Autres | sélectionné   | 4     | {B6134457-1229-4309-8192-8FF53722B231} | 975504-FICHE_INFORMATIONS_MA_RETRAITE.pdf |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2025-02 Fiche Info MA RETRAITE | 14-04-2025 | 96904  | MA RETRAITE | obligatoire         | Autres | sélectionné   | 4     | {0C3C8AF7-6002-431C-B79B-084D16474920} | 975504-FICHE_INFORMATIONS_MA_RETRAITE.pdf |
      | Fiche Clients - Caractéristiques principales MA RETRAITE | 2025-02 Fiche Info MA RETRAITE | 31-12-2098 | 96904  | MA RETRAITE | obligatoire         | Autres | sélectionné   | 4     | {0C3C8AF7-6002-431C-B79B-084D16474920} | 975504-FICHE_INFORMATIONS_MA_RETRAITE.pdf |
