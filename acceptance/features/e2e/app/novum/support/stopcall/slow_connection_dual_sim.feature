# -*- coding: utf-8 -*-
@jira.QANOV-1956
Feature: Slow connection - Dual-SIM

  Actions Before each Scenario:
    Given user has a "dual" SIM device


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65728 @mobile @no_automatable @regression
  Scenario Outline: A user who open the app with data connectivity having a SIM of Telefonica brand a SIM of a different brand in the device does not see the warning banner displayed
    Given user has the app in "killed" status
      And user has data connectivity
      And user has the Telefonica brand SIM in "<OB_slot>" slot in the device
      And user has the non-Telefonica brand SIM in "<no_OB_slot>" slot in the device
     When launches the app
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | OB_slot | no_OB_slot | jira_id    |
          | vivobr  | 10.5 | 1       | 2          | QANOV-1957 |
          | vivobr  | 10.5 | 2       | 1          | QANOV-1958 |
          | o2uk    | 11.9 | 1       | 2          | QANOV-1959 |
          | o2uk    | 11.9 | 2       | 1          | QANOV-1960 |
          | moves   | 11.9 | 1       | 2          | QANOV-1961 |
          | moves   | 11.9 | 2       | 1          | QANOV-1963 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65725 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app with data connectivity and with the Telefonica brand SIM in the device cannot see the warning banner displayed
    Given user has the app in "killed" status
      And user has the Telefonica brand SIM in "<slot>" slot in the device
      And user has data connectivity
     When launches the app
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | slot | jira_id    |
          | vivobr  | 10.5 | 1    | QANOV-1964 |
          | vivobr  | 10.5 | 2    | QANOV-1965 |
          | o2uk    | 11.9 | 1    | QANOV-1966 |
          | o2uk    | 11.9 | 2    | QANOV-1967 |
          | moves   | 11.9 | 1    | QANOV-1968 |
          | moves   | 11.9 | 2    | QANOV-1969 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65720 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app without connectivity and with only one no-telefonica brand SIM in the device can see the warning banner displayed
    Given user has the app in "killed" status
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has not a Telefonica brand SIM in the device
      And user has the non-Telefonica brand SIM in "<slot>" slot in the device
     When launches the app
     Then the "warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.no_sim]" text is displayed

    Examples:
          | product | cv   | slot | jira_id    |
          | vivobr  | 10.5 | 1    | QANOV-1971 |
          | vivobr  | 10.5 | 2    | QANOV-1973 |
          | o2uk    | 11.9 | 1    | QANOV-1975 |
          | o2uk    | 11.9 | 2    | QANOV-1977 |
          | moves   | 11.9 | 1    | QANOV-1980 |
          | moves   | 11.9 | 2    | QANOV-1982 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53787 @mobile @no_automatable @regression
  Scenario Outline: A user with connectivity <= 3G with one SIM of a different operator in the secondary slot of the device cannot see a warning banner
    Given user has a SIM different of "<operator>" operator in the secondary slot of the device
      And user has data connectivity less or equal to 3G
      And user has the app in "<status>" status
     When user has the app in "foreground" status
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | operator | status     | jira_id    |
          | vivobr  | 10.4 | vivobr   | background | QANOV-1984 |
          | vivobr  | 10.4 | vivobr   | killed     | QANOV-1985 |
          | o2uk    | 11.9 | o2uk     | background | QANOV-1986 |
          | o2uk    | 11.9 | o2uk     | killed     | QANOV-1987 |
          | moves   | 11.9 | moves    | background | QANOV-1988 |
          | moves   | 11.9 | moves    | killed     | QANOV-1990 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53786 @mobile @no_automatable @regression
  Scenario Outline: A user with connectivity > 3G won't see a warning banner
    Given user turns off the Wi-Fi
      And user has data connectivity higher than 3G
      And user has the app in "<status>" status
     When user has the app in "foreground" status
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | status     | jira_id    |
          | vivobr  | 10.4 | background | QANOV-1991 |
          | vivobr  | 10.4 | killed     | QANOV-1992 |
          | o2uk    | 11.9 | background | QANOV-1993 |
          | o2uk    | 11.9 | killed     | QANOV-1994 |
          | moves   | 11.9 | background | QANOV-1995 |
          | moves   | 11.9 | killed     | QANOV-1997 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53785 @mobile @no_automatable @regression
  Scenario Outline: A user with connectivity <= 3G with one Telefonica SIM in the secondary slot of the device can see a warning banner
    internal_checkpoint="NOTE: in order to simulate that a week has passed we can change the date in the device:
    Settings --> Date and time --> Disable Automatic Date and Time and Set the date to a week after the current date"
    Given user has the Telefonica brand SIM in "2" slot in the device
      And user turns off the Wi-Fi
      And user has data connectivity less or equal to 3G
      And the warning message was shown more than a week ago
      And user has the app in "<status>" status
     When user has the app in "foreground" status
     Then the "warning" warning in "gray" color is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.slow_connection]" text is displayed

    Examples:
          | product | cv   | status     | jira_id    |
          | vivobr  | 10.4 | background | QANOV-1998 |
          | vivobr  | 10.4 | killed     | QANOV-1999 |
          | moves   | 11.9 | background | QANOV-2002 |
          | moves   | 11.9 | killed     | QANOV-2003 |

    @impeded_mock
    Examples:
          | product | cv   | status     | jira_id    |
          | o2uk    | 11.9 | background | QANOV-2000 |
          | o2uk    | 11.9 | killed     | QANOV-2001 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53789 @mobile @no_automatable @regression
  Scenario Outline: A user with connectivity <= 3G with one Telefonica SIM in the primary slot of the device can't see a warning banner
    Given user has the Telefonica brand SIM in "1" slot in the device
      And user turns off the Wi-Fi
      And user has data connectivity less or equal to 3G
      And user has the app in "<status>" status
     When user has the app in "foreground" status
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | status     | jira_id    |
          | vivobr  | 10.4 | background | QANOV-2004 |
          | vivobr  | 10.4 | killed     | QANOV-2006 |
          | moves   | 11.9 | background | QANOV-2009 |
          | moves   | 11.9 | killed     | QANOV-2010 |

    @impeded_mock
    Examples:
          | product | cv   | status     | jira_id    |
          | o2uk    | 11.9 | background | QANOV-2007 |
          | o2uk    | 11.9 | killed     | QANOV-2008 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-68695 @mobile @no_automatable @regression
  Scenario Outline: A user with connectivity <=3G with one Telefonica SIM in the secondary slot of the device can not see a warning banner if it was displayed previously
    Given user has the Telefonica brand SIM in "2" slot in the device
      And user turns off the Wi-Fi
      And user has data connectivity less or equal to 3G
      And the warning message was shown less than a week ago
      And user has the app in "<status>" status
     When user has the app in "foreground" status
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | status     | jira_id    |
          | vivobr  | 10.4 | background | QANOV-2011 |
          | vivobr  | 10.4 | killed     | QANOV-2012 |
          | moves   | 11.9 | background | QANOV-2016 |
          | moves   | 11.9 | killed     | QANOV-2017 |

    @impeded_mock
    Examples:
          | product | cv   | status     | jira_id    |
          | o2uk    | 11.9 | background | QANOV-2013 |
          | o2uk    | 11.9 | killed     | QANOV-2014 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-54306 @mobile @no_automatable @regression
  Scenario Outline: The slow connectivity banner disappears after 10 seconds of inactivity
    commented_tags="@depends_on.NOV-203341 @depends_on.NOV-203338 @depends_on.NOV-203347 @depends_on.NOV-203342
    /@depends_on.NOV-203339 @depends_on.NOV-203348 @depends_on.NOV-203343 @depends_on.NOV-203340 @depends_on.NOV-203349"
    Given user has the Telefonica brand SIM in "2" slot in the device
      And user turns off the Wi-Fi
      And user has data connectivity less or equal to 3G
      And the  "warning" warning is displayed
     When waits "10" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-2018 |
          | moves   | 11.9 | QANOV-2021 |

    @impeded_mock
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 11.9 | QANOV-2019 |
