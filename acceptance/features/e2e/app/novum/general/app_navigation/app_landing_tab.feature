# -*- coding: utf-8 -*-
@jira.QANOV-10565
Feature: App landing tab


  @jira.QANOV-268009 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.14.3 @mobile @o2uk @qa @smoke
  Scenario: A logged in postpay user can see the main tabs in order
    Until the start tab rollout is complete it can only be tested automatically in cert0
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "any" mobile lines
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

  @jira.QANOV-268010 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.14.3 @mobile @o2uk @qa @smoke
  Scenario: A logged in multimsisdn user with postpay and prepay accounts can see the main tabs in order
    Until the start tab rollout is complete it can only be tested automatically in cert0
    Given user has the "postpay;prepay" account types
      And user has "several" mobile lines
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.13
  @jira.link.parent_test_plan.QANOV-24141 @live @mobile @next @o2uk @sanity
  Scenario Outline: A logged in prepay user without any postpay lines can see the main tabs in order
    Given user has a "prepay" account type
      And user does not have a "postpay" account type
      And user has "<num_lines>" mobile lines
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

    Examples:
          | num_lines | ber | jira_id     |
          | several   |     | QANOV-21752 |
          | 1         | ber | QANOV-21754 |

  @jira.QANOV-21755 @android @automatic @cert2 @har @ios @jira.cv.11.13 @jira.link.detects.IOS-8216
  @jira.link.parent_test_plan.QANOV-256037 @live @mobile @moves @next @sanity @ber
  Scenario: A logged in telco user can see the main tabs in order
    Given user has a "telco" account type
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.gestiones_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.invoices_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed

  @jira.QANOV-21756 @android @impeded_legacy @ios @jira.cv.11.13 @mobile @moves @no_automatable @regression
  Scenario: A logged in legacy user can see the main tabs in order
    Given user has a "legado" account type
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065
  @jira.link.parent_test_plan.QANOV-319348 @jira.link.parent_test_plan.QANOV-360674 @mobile @old_app @smoke @vivobr
  Scenario Outline: A logged in <account_type> monoplan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    @automatic @live @next @qa
    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-249100 |

    @automatic @qa
    Examples:
          | account_type | ber | jira_id      |
          | convergente  | ber | QANOV-249102 |

    @manual
    Examples:
          | account_type | ber | jira_id      |
          | multivivo    |     | QANOV-249101 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A logged in <account_type> user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.beneficios]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type                  | ber | jira_id      |
          | beatrix                       | ber | QANOV-388320 |
          | convergente                   | ber | QANOV-388321 |
          | multivivo                     |     | QANOV-388322 |
          | jeri control;jeri postpay     |     | QANOV-388323 |
          | legacy control;legacy postpay |     | QANOV-388324 |
          | control_n                     |     | QANOV-388325 |

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A logged in <account_type> user can see the topup tab in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.topup_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-312674 |
          | jeri prepay   | QANOV-312675 |

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with different account types cannot see the topup tab in order
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has any "convergente;beatrix;multivivo;jeri control;control_n" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-312676 |
          | jeri prepay   | QANOV-312677 |

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A logged in <account_type> multiplan prepay can see the topup tab in order
    Given user has a "<account_type>" account type
      And user has "several" prepay plans
      And user does not have any "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.topup_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-312680 |
          | jeri prepay   | QANOV-312681 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065
  @jira.link.parent_test_plan.QANOV-319348 @jira.link.parent_test_plan.QANOV-360674 @live @mobile @next @old_app @qa
  @smoke @vivobr
  Scenario Outline: A logged in <account_type> multiplan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-249103 |
          | convergente  | ber | QANOV-249104 |
          | multivivo    |     | QANOV-249105 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A multiplan <account_type> logged in with beatrix mobile line in pre active status and without legacy control/postpay plan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has "several" plans
      And user does not have any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-356567 |
          | convergente  | ber | QANOV-356568 |
          | multivivo    |     | QANOV-356569 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @manual @mobile @regression @vivobr
  Scenario Outline: A multiplan <account_type> logged in with beatrix mobile line in pre active status and without legacy control/postpay plan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has "several" plans
      And user has any "convergente;beatrix;multivivo;jeri control;jeri postpay;legacy control;legacy postpay;control_n" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.beneficios]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-599200 |
          | convergente  |     | QANOV-599201 |
          | multivivo    |     | QANOV-599202 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A monoplan <account_type> logged in with beatrix mobile line in pre active status user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-449441 |
          | convergente  | QANOV-449442 |
          | multivivo    | QANOV-449443 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @manual @mobile @regression @vivobr
  Scenario Outline: A monoplan <account_type> logged in with beatrix mobile line in pre active status user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-599203 |
          | convergente  | QANOV-599204 |
          | multivivo    | QANOV-599205 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A multiplan <account_type> logged in with beatrix mobile line in pre active status and with legacy control/postpay plan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has "several" plans
      And user has any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Explore" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-356570 |
          | convergente  | QANOV-356571 |
          | multivivo    | QANOV-356572 |

  @jira.<jira_id> @<automation> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-319348 @mobile @old_app @qa @smoke @vivobr
  Scenario Outline: A logged in <account_type> monoplan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | cv   | account_type | ber | automation | parent_test_plan | jira_id      |
          | 14.0 | control_n    | ber | automatic  | QANOV-297826     | QANOV-298689 |
          | 14.0 | jeri control |     | manual     | QANOV-297826     | QANOV-298690 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario Outline: A logged in <account_type> monoplan user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | control_n    | ber | QANOV-599206 |
          | jeri control |     | QANOV-599207 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.0 @jira.link.parent_test_plan.QANOV-297826
  @jira.link.parent_test_plan.QANOV-319348 @mobile @old_app @regression @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with only prepay lines can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have any "convergente;multivivo;beatrix;legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    @automatic @live @next @qa
    Examples:
          | account_type | ber | jira_id      |
          | jeri control |     | QANOV-298694 |

    @manual
    Examples:
          | account_type | ber | jira_id      |
          | control_n    |     | QANOV-298695 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @mobile @manual @regression @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with only prepay lines can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has any "convergente;beatrix;multivivo;jeri control;jeri postpay;legacy control;legacy postpay;control_n" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.beneficios]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | jira_id      |
          | jeri control | QANOV-599208 |
          | control_n    | QANOV-599209 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.0 @jira.link.parent_test_plan.QANOV-297826
  @jira.link.parent_test_plan.QANOV-319348 @mobile @old_app @regression @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with different account types can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Explore" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    @automatic @live @next @qa
    Examples:
          | account_type  | ber | jira_id      |
          | legacy prepay | ber | QANOV-298696 |
          | jeri control  |     | QANOV-298699 |

    @automatic @qa
    Examples:
          | account_type | ber | jira_id      |
          | jeri prepay  | ber | QANOV-298697 |

    @manual
    Examples:
          | account_type | ber | jira_id      |
          | control_n    |     | QANOV-298700 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-241065 @jira.link.parent_test_plan.QANOV-319348 @mobile @old_app @smoke @vivobr
  Scenario Outline: A logged in <account_type> user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Explore" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | ber | parent_test_plan | jira_id      |
          | legacy control | ber |                  | QANOV-249115 |
          | legacy postpay |     |                  | QANOV-249116 |
          | jeri postpay   |     |                  | QANOV-274593 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @old_app @smoke
  @vivobr
  Scenario Outline: A logged in <account_type> cancelled user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has all plans in "cancelled" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user is in the "Account" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403098 |
          | beatrix      | QANOV-403099 |
          | multivivo    | QANOV-403100 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario Outline: A logged in <account_type> cancelled user can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has all plans in "cancelled" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-599211 |
          | beatrix      | QANOV-599212 |
          | multivivo    | QANOV-599213 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @old_app @smoke
  @vivobr
  Scenario Outline: A logged in <account_type> user with cancelled and no cancelled status can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has "several" plans
      And user has ">=1" plan with "cancelled" status
      And user has ">=1" plan with "no cancelled" status
      And user does not have a "siebel" plan
      And user does not have any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.valoriza_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.mais_tab]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403101 |
          | beatrix      | QANOV-403102 |
          | multivivo    | QANOV-403103 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario Outline: A logged in <account_type> user with cancelled and no cancelled status can see the main tabs in order
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has "several" plans
      And user has ">=1" plan with "cancelled" status
      And user has ">=1" plan with "no cancelled" status
      And user does not have a "siebel" plan
      And user does not have any "legacy postpay;legacy control;jeri postpay" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.beneficios]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-599214 |
          | beatrix      | QANOV-599215 |
          | multivivo    | QANOV-599216 |

  @jira.<jira_id> @<product> @android @automatic @ber @cert3 @ios @jira.cv.<cv> @jira.link.detects.<bug_id> @live @mobile
  @next @qa @sanity @har
  Scenario Outline: A logged in user can see the main tabs in order
    Given user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

    Examples:
          | product | cv   | bug_id   | jira_id      |
          | blaude  | 13.9 |          | QANOV-254768 |
          | o2de    | 14.2 | IOS-9086 | QANOV-254769 |

  @jira.QANOV-10629 @android @automatic @ber @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-108441
  @jira.link.parent_test_plan.QANOV-200803 @jira.link.relates_to.NOV-187374 @jira.link.relates_to.NOV-187378 @live @mobile
  @next @old_app @qa @smoke @vivobr
  Scenario: A multiplan user logs in: Start tab is opened
    Given user has "several" plans
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is logged out
     When logs in the application
     Then the "Start" page is displayed

  @jira.<jira_id> @android @ber @ios @jira.cv.14.0 @jira.link.parent_test_plan.QANOV-297826 @mobile @old_app @smoke
  @vivobr
  Scenario Outline: A user with <plans> plans and a <account_type> account type logs in: Explore tab is opened
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user is logged out
     When logs in the application
     Then the "Explore" page is displayed

    @automatic @qa
    Examples:
          | account_type   | plans   | jira_id      |
          | legacy control | several | QANOV-298704 |
          | legacy postpay | several | QANOV-298705 |
          | jeri postpay   | several | QANOV-298708 |

    @impeded_mock @manual
    Examples:
          | account_type   | plans | jira_id      |
          | legacy control | 1     | QANOV-298702 |
          | legacy postpay | 1     | QANOV-298703 |
          | jeri postpay   | 1     | QANOV-298693 |

  @jira.QANOV-388330 @android @har @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @smoke @vivobr
  Scenario: A user logs in: Start tab is opened
    Given user is logged out
     When logs in the application
     Then the "Start" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.0 @jira.link.parent_test_plan.QANOV-297826 @mobile @old_app @smoke
  @vivobr @har
  Scenario Outline: A <account_type> monoplan user logs in: Start tab is opened
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is logged out
     When logs in the application
     Then the "Start" page is displayed

    @automatic @qa
    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-298706 |
          | jeri prepay   | QANOV-298707 |
          | multivivo     | QANOV-298709 |
          | convergente   | QANOV-298710 |
          | control_n     | QANOV-298713 |

    @automatic @live @next @qa
    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-298711 |

    @manual
    Examples:
          | account_type | jira_id      |
          | jeri control | QANOV-298712 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @old_app @smoke
  @vivobr
  Scenario Outline: A <account_type> user logs in: Account is opened
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has all plans in "cancelled" status
      And user does not have a "siebel" plan
      And user is logged out
     When logs in the application
     Then the "Account" page is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403104 |
          | beatrix      | QANOV-403105 |
          | multivivo    | QANOV-403106 |

  @jira.QANOV-10630 @android @automatic @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.relates_to.NOV-187375 @live @mobile @next @old_app @qa @regression @vivobr
  Scenario: A user that just logged in can go to the Account tab
    Given user is logged out
     When logs in the application
      And the landing tab page is displayed
      And waits "10" seconds
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed

  @jira.QANOV-599217 @android @ios @jira.cv.24.3 @manual @mobile @regression @vivobr
  Scenario: A user that just logged in can go to the Assinaturas tab
    Given user is logged out
     When logs in the application
      And the landing tab page is displayed
      And waits "10" seconds
      And clicks on the "navigation_tab_bar.assinaturas_tab_novo_app" tab
     Then the "Assinatura" page is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.<relates_to> @mobile @old_app @vivobr
  Scenario Outline: Legacy user who is in Account after log in can access the account tabs
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is logged out
     When logs in the application
      And the landing tab page is displayed
      And waits "10" seconds
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "AccountV1" page is displayed
      And clicks on the "<selected_tab>" tab
     Then the "<page_name>" page is displayed

    @manual
    Examples:
          | test_priority | account_type   | selected_tab | page_name  | relates_to | cv   | parent_test_plan | jira_id     |
          | regression    | legacy control | services_tab | ServicesV1 | NOV-187377 | 11.7 | QANOV-21950      | QANOV-10634 |
          | smoke         | legacy postpay | services_tab | ServicesV1 | NOV-187376 | 11.7 | QANOV-21950      | QANOV-10631 |

    @impeded_legacy @no_automatable
    Examples:
          | test_priority | account_type   | selected_tab | page_name | relates_to | cv   | parent_test_plan | jira_id      |
          | smoke         | legacy control | bills_tab    | BillsV1   | NOV-187376 | 11.7 | QANOV-21950      | QANOV-10632  |
          | smoke         | legacy postpay | bills_tab    | BillsV1   | NOV-187376 | 11.7 | QANOV-21950      | QANOV-10633  |
          | smoke         | jeri postpay   | bills_tab    | BillsV1   | NOV-187376 | 13.6 | QANOV-226748     | QANOV-228888 |

  @jira.QANOV-10637 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-200803 @jira.link.relates_to.NOV-187378
  @jira.link.relates_to.NOV-187379 @manual @mobile @old_app @smoke @vivobr
  Scenario: A user can access the Account tab after restarting the app
    "The purpose of the test is the validate that the account starts being loaded just on app start,
    without having to navigate to account.
    The spinner might appear in iOS for account V1 users.This is the expected behaviour ACCOUNT-12764"
    Given user is logged in
      And terminates the app
     When launches the app
      And the landing tab page is displayed
      And waits "35" seconds
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "loading" icon is not displayed

  @jira.QANOV-599218 @android @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario: A user can access the assinatura tab after restarting the app
    Given user is logged in
      And terminates the app
     When launches the app
      And the landing tab page is displayed
      And waits "35" seconds
      And clicks on the "navigation_tab_bar.assinaturas_tab_novo_app" tab
     Then the "Assinatura" page is displayed
      And the "loading" icon is not displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-187380 @jira.link.relates_to.NOV-187381 @mobile @old_app @vivobr
  Scenario Outline: Legacy user who is in Account after restarting the app can access the account tabs
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user terminates the app
     When launches the app
      And the landing tab page is displayed
      And waits "10" seconds
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "AccountV1" page is displayed
      And clicks on the "<selected_tab>" tab
     Then the "<page_name>" page is displayed

    @manual
    Examples:
          | test_priority | account_type   | selected_tab | page_name  | cv   | parent_test_plan | jira_id     |
          | regression    | legacy control | services_tab | ServicesV1 | 11.7 |                  | QANOV-10638 |
          | smoke         | legacy postpay | services_tab | ServicesV1 | 11.7 |                  | QANOV-10641 |

    @impeded_legacy @no_automatable
    Examples:
          | test_priority | account_type   | selected_tab | page_name | cv   | parent_test_plan | jira_id      |
          | regression    | legacy control | bills        | BillsV1   | 11.7 |                  | QANOV-10639  |
          | regression    | legacy postpay | bills        | BillsV1   | 11.7 |                  | QANOV-10640  |
          | regression    | jeri postpay   | bills        | BillsV1   | 13.6 | QANOV-226748     | QANOV-228889 |

  @jira.QANOV-10644 @android @automatic @ios @jira.cv.11.7 @jira.link.relates_to.NOV-187382 @live @mobile @next @smoke
  @vivobr @har
  Scenario: A user with PIN enabled opens the app: Landing tab is opened
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And terminates the app
     When launches the app
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the landing tab page is displayed
      And user has "PIN" feature "disabled" in the application

  @jira.QANOV-10645 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-200803 @jira.link.relates_to.NOV-187382
  @mobile @no_automatable @smoke @vivobr
  Scenario: A user with PIN/Biometric enabled opens the app: Landing tab is opened
    Given user is logged in
      And user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And "Biometric access" feature is enabled in the app
      And user has the app in "killed" status
     When launches the app
      And the "App Pin Code" page is displayed
      And introduces FingePrint configured on the device
     Then the landing tab page is displayed

  @jira.<jira_id> @<client> @automation.hard @jira.cv.11.7 @jira.link.relates_to.NOV-191259 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A user logs in on a second line accessing profile from Explore
    Given user is logged in the application with "<10" lines
      And user is in the "Explore" page
     When clicks on the "navigation_top_bar.profile_icon" icon
      And clicks on the "user_selector" button
      And clicks on the "add_line" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
      And the "Profile" page is displayed
      And clicks on the "<profile_close_button>" button
     Then the landing tab page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.explore_tab" button

    Examples:
          | client  | profile_close_button            | jira_id     |
          | ios     | navigation_top_bar.close_button | QANOV-10647 |
          | android | navigation_top_bar.back_button  | QANOV-10648 |

  @jira.QANOV-599219 @android @automation.hard @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr @har
  Scenario: A user logs in on a second line accessing profile from Explore
    Given user is logged in the application with "<10" lines
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.menu_mais" icon
      And clicks on the "navigation_top_bar.profile_icon" icon
      And clicks on the "user_selector" button
      And clicks on the "add_line" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the landing tab page is displayed

  @jira.<jira_id> @<client> @automation.hard @jira.cv.11.7 @jira.link.relates_to.NOV-191260 @manual @mobile @old_app
  @regression @vivobr
  Scenario Outline: A user logs in on a second line accessing profile from a tab different from Explore
    Given user is logged in the application with "<10" lines
      And user is in the "Tab Mais" page
     When clicks on the "navigation_top_bar.profile_icon" icon
      And clicks on the "user_selector" button
      And clicks on the "add_line" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
      And the "Profile" page is displayed
      And clicks on the "<profile_close_button>" button
     Then the landing tab page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.explore_tab" button

    Examples:
          | client  | profile_close_button            | jira_id     |
          | ios     | navigation_top_bar.close_button | QANOV-10649 |
          | android | navigation_top_bar.back_button  | QANOV-10650 |

  @jira.QANOV-416771 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es logged in user can see the main tabs in order
    Given user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.invoices_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.explore_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.support_tab]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-476782 @manual @mobile @smoke @vivobr
  Scenario Outline: A logged in <account_type> user can see the topup tab in order
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.topup_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-494501 |
          | jeri prepay   | QANOV-494502 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-476782 @manual @mobile @regression
  @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with different account types cannot see the topup tab in order in Novo App
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has any "convergente;beatrix;multivivo;jeri control;jeri postpay;legacy control;legacy postpay;control_n" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.beneficios]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-494503 |
          | jeri prepay   | QANOV-494504 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-476782 @manual @mobile @regression
  @vivobr
  Scenario Outline: A logged in <account_type> multiplan user with only prepay account types cannot see the topup tab in order in Novo App
    Given user has a "<account_type>" account type
      And user has "several" prepay plans
      And user does not have any "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control" account types
      And user is in the "Start" page
     Then the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.pra_voce]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.assinaturas_tab_novo_app]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.loja]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.financas]" text is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-494505 |
          | jeri prepay   | QANOV-494506 |

  @jira.QANOV-556348 @android @har @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: A logged in user can see the main tabs in order
    This are the tabs at the moment of integrating the profile tab. Once the new app is completed the expected tabs are: Inicio, Facturas, Gestiones, Consumos, Perfil.
    Given user has a "telco" account type
      And user is logged out
     When logs in the application
     Then the "[CONF:landing_tab]" page is displayed
      And the "0" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.start_tab]" text is displayed
      And the "1" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.account_tab]" text is displayed
      And the "2" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.gestiones_tab]" text is displayed
      And the "3" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.invoices_tab]" text is displayed
      And the "4" index in the "navigation_tab_bar.textfield_list" list with "[LANG:pageelements.navigation_tab_bar.profile_tab]" text is displayed
