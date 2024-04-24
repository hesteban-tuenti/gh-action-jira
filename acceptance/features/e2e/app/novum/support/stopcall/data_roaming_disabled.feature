# -*- coding: utf-8 -*-
@jira.QANOV-1857
Feature: Data Roaming disabled

  Actions Before each Scenario:
    Given user is in a foreign network
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns on the mobile data


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65727 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app with mobile connectivity and with data roaming enabled cannot see the warning banner
    Given user has a "single" SIM device
      And has data roaming enabled
     When launches the app
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.5 | QANOV-1858 |
          | o2uk    | 11.9 | QANOV-1859 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1860 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65722 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app with mobile network connectivity in roaming and without data roaming enabled can see the warning banner displayed
    Given user has a "single" SIM device
      And user has a Telefonica SIM in the device
      And has no data roaming enabled
     When launches the app
     Then the "warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.roaming]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.5 | QANOV-1861 |
          | o2uk    | 11.9 | QANOV-1862 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1863 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91848 @mobile @no_automatable @regression
  Scenario Outline: The no connectivity warning disappears after tapping the banner and returning to the app in less than 15 seconds
    commented_tags="@depends_on.NOV-203266 @depends_on.NOV-203267 @depends_on.NOV-203268"
    Given user has a Telefonica SIM in the device
      And has no data roaming enabled
      And the "warning" warning is displayed
     When clicks on the "warning.button" button
      And waits "14" seconds or less
      And clicks on the native "back" button
     Then the app is opened
      And the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1864 |
          | o2uk    | 11.9 | QANOV-1865 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1866 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91847 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203266 @depends_on.NOV-203267 @depends_on.NOV-203268"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be more than 15 seconds"
    Given user has a Telefonica SIM in the device
      And user is in the "Account" page
      And has no data roaming enabled
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "15" seconds or more
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1868 |
          | o2uk    | 11.9 | QANOV-1869 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1870 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91844 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner does not appear again after waiting less than 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203266 @depends_on.NOV-203267 @depends_on.NOV-203268"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be less than 15 seconds"
    Given user is in the "Account" page
      And user has a Telefonica SIM in the device
      And has no data roaming enabled
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "14" seconds or less
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1871 |
          | o2uk    | 11.9 | QANOV-1872 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1873 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91842 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner is not shown again after waiting less than 15 seconds before closing and opening the app again
    commented_tags="@depends_on.NOV-203266 @depends_on.NOV-203267 @depends_on.NOV-203268"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds"
    Given user has a Telefonica SIM in the device
      And has no data roaming enabled
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "14" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1874 |
          | o2uk    | 11.9 | QANOV-1875 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1877 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91838 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203266 @depends_on.NOV-203267 @depends_on.NOV-203268"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds"
    Given user has a Telefonica SIM in the device
      And has no data roaming enabled
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "15" seconds
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1878 |
          | o2uk    | 11.9 | QANOV-1879 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1880 |
