Feature: Authentication Fixture

  This script performs json data generation that contains authentication details to login to DH WebPanel

  Scenario Outline: Generates Auth Data for Login
    # useaut
    # qaaaut6
    # qaaaut4
    # natmer12
    # aljsal1
    # empuse
    # natman14
    # natman15
    Given I setup auth for webid "<webid>"

    Examples:
      | webid    |
      | natman15 |
# | natman14 |
# | qaaaut6  |
# | qaaaut4  |
# | natmer12 |
# | aljsal1  |
# | empuse   |
