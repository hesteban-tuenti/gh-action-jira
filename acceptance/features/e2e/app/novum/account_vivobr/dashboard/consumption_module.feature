# -*- coding: utf-8 -*-
@jira.QANOV-127447
Feature: Consumption Module


  @jira.<jira_id> @<impeded> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-66882 @mobile @no_automatable @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can access to the "Detalhes do consumo de minha internet" screen
    commented_tags="@depends_on.NOV-30"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "consumption" tab
      And the "ConsumptionV1" page is displayed
      And clicks on the "details_of_my_internet_consumption" link
     Then the "Details Of My Internet Consumption" internal webview is displayed
      And the "Consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "ConsumptionV1" page is displayed

    Examples:
          | account_type   | depends_on | impeded        | parent_test_plan | cv   | jira_id      |
          | legacy control | QANOV-2542 | impeded_legacy | QANOV-21950      | 10.5 | QANOV-2652   |
          | legacy postpay | QANOV-2543 | impeded_legacy | QANOV-21950      | 10.5 | QANOV-2655   |
          | jeri postpay   | QANOV-2543 |                | QANOV-226748     | 13.6 | QANOV-228674 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-164088 @jira.link.relates_to.NOV-174540 @mobile
  @vivobr @old_app
  Scenario Outline: A <account_type> user can see the mobile consumption module
    internal_checkpoint="Only data roundels will be displayed.
    There are two possible data types: 'Internet pra usar como quiser' (mandatory) and
    'Internet pra usar só em alguns apps' (optional)"
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<page>" page for the "mobile" product
      And user is in the "<current_screen>" page
     Then the "mobile_allowances.list" carousel is displayed
      And the "data_roundel" allowance roundel is displayed
      And the "allowances_roundel_name" textfield with "Internet pra usar como quiser" text is displayed

    @automatic @qa @smoke @webapp
    Examples:
          | cv   | account_type | page   | current_screen        | parent_test_plan | depends_on  | ber | jira_id      |
          | 12.0 | convergente  | mobile | Mobile Line Dashboard | QANOV-21791      | QANOV-22282 | ber | QANOV-340106 |

    @automatic @live @next @qa @sanity @webapp
    Examples:
          | cv    | account_type | page      | current_screen        | parent_test_plan | depends_on | ber | jira_id    |
          | 11.12 | beatrix      | dashboard | Account               | QANOV-21949      | QANOV-2450 | ber | QANOV-2458 |
          | 11.12 | multivivo    | mobile    | Mobile Line Dashboard | QANOV-21949      | QANOV-2455 |     | QANOV-2460 |

    @manual @smoke
    Examples:
          | cv   | account_type | page      | current_screen | parent_test_plan | depends_on | ber | jira_id      |
          | 13.5 | jeri control | dashboard | Account        | QANOV-200803     |            |     | QANOV-202362 |
          | 13.5 | control_n    | dashboard | Account        | QANOV-200803     |            |     | QANOV-202363 |

  @jira.QANOV-133807 @android @ber @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-133821
  @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @smoke @vivobr @old_app
  Scenario: A prepay with vivo_pre_turbo user can see the mobile consumption module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "vivo_pre_turbo" data bundles
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is displayed
      And the "data_roundel" allowance roundel is displayed
      And the "allowances_roundel_name" textfield with "Internet pra usar como quiser" text is displayed

  @jira.QANOV-214337 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-133821
  @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @smoke @vivobr @old_app
  Scenario: A prepay with vivo_pre_diario user can see the mobile consumption module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "vivo_pre_diario" data bundles
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is displayed
      And the "data_roundel" allowance roundel is displayed
      And the "allowances_roundel_name" textfield with "Internet pra usar como quiser" text is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.<relates_to> @mobile @regression @vivobr
  Scenario Outline: A <account_type> user with a mobile line plan can see the details of a data consumption roundel
    internal_checkpoint="if the roundel has an expiration date not related to the renewal
    cycle it will not be shown
    the renewal date format could be different: Expira no final de dd mmm yy or Renova em d/mm,
    this depends that the server provide."
    User in QA: qavivo-02, qavivo-03, qavivo-04
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
      And waits until the "data_roundel" element is visible
     Then the "data_roundel" allowance roundel is displayed
      And the "data_roundel.roundel_text" textfield with the "Já usei\n\d+(,\d\d?)? (MB|GB|KB)\nde \d+(,\d\d?)? (MB|GB|KB)" format is displayed
      And the "allowances_roundel_name" textfield that contains the "Internet pra usar" text is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_screen        | parent_test_plan | relates_to | depends_on  | ber | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | QANOV-21791      | NOV-174540 | QANOV-22282 |     | QANOV-340107 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_screen        | parent_test_plan | relates_to | depends_on | ber | jira_id      |
          | 11.12 | beatrix      | Account               | QANOV-21949      | NOV-164124 | QANOV-2458 | ber | QANOV-340108 |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | NOV-164124 | QANOV-2460 |     | QANOV-340109 |

    @manual
    Examples:
          | cv   | account_type | current_screen | parent_test_plan | relates_to | depends_on | ber | jira_id      |
          | 13.5 | jeri control | Account        | QANOV-200803     |            |            |     | QANOV-202364 |
          | 13.5 | control_n    | Account        | QANOV-200803     |            |            |     | QANOV-202365 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-133807
  @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A prepay user with a <plan_allowance> allowance can see the details of a data consumption roundel
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "<plan_allowance>" data bundles
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "data_roundel" allowance roundel is displayed
      And the "data_remaining_allowance" textfield with the "Já usei\n\d+(,\d\d)? (MB|GB|KB)\nde \d+(,\d\d)? (MB|GB|KB)" format is displayed
      And the "allowances_roundel_name" textfield that contains the "Internet pra usar" text is displayed

    Examples:
          | plan_allowance  | jira_id      | ber |
          | vivo_pre_diario | QANOV-133808 | ber |
          | vivo_pre_turbo  | QANOV-214339 |     |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-151919 @manual @mobile @regression @vivobr
  Scenario Outline: User can switch among the comsumption roundels
    Beatrix user (Live): CPF 09583301663
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has ">1" number of allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     When swipes the "mobile_allowances" carousel in "right" direction
     Then the "roundel_2" allowance roundel is displayed

    Examples:
          | cv    | account_type | current_screen        | parent_test_plan | depends_on  | jira_id      |
          | 11.12 | beatrix      | Account               | QANOV-21949      | QANOV-2450  | QANOV-2544   |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | QANOV-2455  | QANOV-2547   |
          | 12.0  | convergente  | Mobile Line Dashboard | QANOV-21791      | QANOV-22282 | QANOV-2545   |
          | 13.5  | jeri control | Account               | QANOV-200803     |             | QANOV-202366 |
          | 13.5  | control_n    | Account               | QANOV-200803     |             | QANOV-202367 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-91849 @manual @mobile @regression @vivobr
  Scenario Outline: User who has consumed 100% of his/her allowance will see the roundel in a specific color
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     Then the "data" allowance roundel is displayed in "purple" color

    Examples:
          | cv    | account_type  | current_screen        | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix       | Account               | QANOV-21949      | QANOV-2458   | QANOV-2549   |
          | 11.12 | multivivo     | Mobile Line Dashboard | QANOV-21949      | QANOV-2460   | QANOV-2557   |
          | 12.0  | convergente   | Mobile Line Dashboard | QANOV-21791      | QANOV-22282  | QANOV-2552   |
          | 14.5  | legacy prepay | Account               | QANOV-132105     | QANOV-133807 | QANOV-133810 |
          | 14.5  | jeri prepay   | Account               | QANOV-132105     | QANOV-133807 | QANOV-273004 |
          | 13.5  | jeri control  | Account               | QANOV-200803     |              | QANOV-202368 |
          | 13.5  | control_n     | Account               | QANOV-200803     |              | QANOV-202369 |

  @jira.<jira_id> @<ber> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.<relates_to> @manual @mobile @regression @vivobr
  Scenario Outline: User who has consumed 80% of his/her allowance or less, can see the roundel in purple
    User in QA: qavivo-01, qavivo-02, qavivo-03
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "<=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     Then the "data_roundel_colour" allowance roundel is displayed in "purple" color

    Examples:
          | cv    | account_type  | current_screen        | parent_test_plan | relates_to | depends_on   | ber | jira_id      |
          | 11.12 | multivivo     | Mobile Line Dashboard | QANOV-21949      | NOV-64076  | QANOV-2460   |     | QANOV-2570   |
          | 12.0  | convergente   | Mobile Line Dashboard | QANOV-21791      | NOV-64350  | QANOV-22282  |     | QANOV-2565   |
          | 11.12 | beatrix       | Account               | QANOV-21949      | NOV-64076  | QANOV-2458   | ber | QANOV-2560   |
          | 14.5  | legacy prepay | Account               | QANOV-132105     |            | QANOV-133807 |     | QANOV-133811 |
          | 14.5  | jeri prepay   | Account               | QANOV-132105     |            | QANOV-133807 |     | QANOV-273006 |
          | 13.5  | jeri control  | Account               | QANOV-200803     |            |              |     | QANOV-202370 |
          | 13.5  | control_n     | Account               | QANOV-200803     |            |              |     | QANOV-202371 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.depends_on.QANOV-22282
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.<relates_to> @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User who has consumed more than 80% of his/her allowance but less than 100%, can see the roundel in purple
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     Then the "data_roundel_colour" allowance roundel is displayed in "purple" color

    Examples:
          | cv    | account_type  | current_screen        | parent_test_plan | relates_to | depends_on   | jira_id      |
          | 11.12 | beatrix       | Account               | QANOV-21949      | NOV-64075  | QANOV-2458   | QANOV-2575   |
          | 11.12 | multivivo     | Mobile Line Dashboard | QANOV-21949      | NOV-64075  | QANOV-2460   | QANOV-2583   |
          | 12.0  | convergente   | Mobile Line Dashboard | QANOV-21791      | NOV-64349  | QANOV-22282  | QANOV-2578   |
          | 14.5  | legacy prepay | Account               | QANOV-132105     |            | QANOV-133807 | QANOV-133816 |
          | 14.5  | jeri prepay   | Account               | QANOV-132105     |            | QANOV-133807 | QANOV-273007 |
          | 13.5  | jeri control  | Account               | QANOV-200803     |            |              | QANOV-202372 |
          | 13.5  | control_n     | Account               | QANOV-200803     |            |              | QANOV-202373 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-120531 @mobile @regression @vivobr
  Scenario Outline: A user who has an unlimited allowance with consumption will see the allowance roundel in purple color
    Beatrix (Live): 09583301663, 04450245938, 02620563992, 38388655884
    User in QA: qavivo-05
    Given user has a "<account_type>" account type
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
      And waits until the "data_roundel" element is visible
     Then the "data_roundel_colour" allowance roundel is displayed in "purple" color
      And the "data_roundel.roundel_text" textfield with the "Já usei\n\d+(,\d(\d)?)? (MB|GB|KB)\nde ilimitado" format is displayed

    @automatic @qa @webapp
    Examples:
          | cv    | account_type | current_screen        | parent_test_plan | depends_on  | jira_id    |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | QANOV-2460  | QANOV-2615 |
          | 12.0  | convergente  | Mobile Line Dashboard | QANOV-21791      | QANOV-22282 | QANOV-2610 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_screen | parent_test_plan | depends_on | jira_id    |
          | 11.12 | beatrix      | Account        | QANOV-21949      | QANOV-2458 | QANOV-2606 |

    @manual
    Examples:
          | cv   | account_type  | current_screen | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | Account        | QANOV-132105     | QANOV-133807 | QANOV-133818 |
          | 14.5 | jeri prepay   | Account        | QANOV-132105     | QANOV-133807 | QANOV-273008 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174872 @manual @mobile @regression @vivobr
  Scenario Outline: A user without the 'internet pra usar em apps exclusivos' allowance in a mobile line product won't see the roundel
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     Then the "mobile_allowances" carousel is displayed
      And the "apps_use" allowance roundel is not displayed

    Examples:
          | cv    | account_type | current_screen        | parent_test_plan | depends_on  | jira_id      |
          | 11.12 | beatrix      | Account               | QANOV-21949      | QANOV-2458  | QANOV-2628   |
          | 12.0  | convergente  | Mobile Line Dashboard | QANOV-21791      | QANOV-22282 | QANOV-2632   |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | QANOV-2460  | QANOV-2636   |
          | 13.5  | jeri control | Account               | QANOV-200803     |             | QANOV-202376 |
          | 13.5  | control_n    | Account               | QANOV-200803     |             | QANOV-202377 |
          | 14.5  | prepay       | Account               | QANOV-132105     |             | QANOV-287478 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.VIVO-3299
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with the 'internet pra usar em apps exclusivos' allowance in a mobile line product will see the roundel
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "<current_screen>" page
     Then the "mobile_allowances" carousel is displayed
      And the "apps_use" roundel is displayed

    Examples:
          | cv    | account_type | current_screen        | parent_test_plan | depends_on  | jira_id      |
          | 11.12 | beatrix      | Account               | QANOV-21949      | QANOV-2458  | QANOV-287479 |
          | 12.0  | convergente  | Mobile Line Dashboard | QANOV-21791      | QANOV-22282 | QANOV-287480 |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | QANOV-2460  | QANOV-287481 |
          | 13.5  | jeri control | Account               | QANOV-200803     |             | QANOV-287482 |
          | 13.5  | control_n    | Account               | QANOV-200803     |             | QANOV-287483 |
          | 14.5  | prepay       | Account               | QANOV-132105     |             | QANOV-287484 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile
  @regression @vivobr @old_app
  Scenario Outline: <account_type> user with beatrix mobile line in pre active status can see all roundels with 0 consumption
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "data_roundel" allowance roundel is displayed
      And the "data_remaining_allowance" textfield with the "Já usei 0 (MB|GB|KB)\nde \d+(,\d\d?)? (MB|GB|KB)" format is displayed
      And the "allowances_roundel_name" textfield that contains the "Internet pra usar" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-356561 |
          | convergente  | QANOV-356562 |
          | multivivo    | QANOV-356563 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @sanity @vivobr
  Scenario Outline: <account_type> user will see mobile_allowances section in Assinatura tab
    Given user has any "<account_type>" account types
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield is displayed

    Examples:
          | account_type           | ber | parent_test_plan | jira_id      |
          | beatrix                | ber | QANOV-359861     | QANOV-377283 |
          | control_n;jeri control |     | QANOV-423279     | QANOV-377284 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @sanity @vivobr
  Scenario Outline: <account_type> user will see mobile_allowances section in plan details page
    Legacy convergente:
    - TV, Banda Larga or Landline with origin system ATIS
    - Legacy TV DTH with origin system NSIA or TV/Internet with origin system SIA.
    - Landline FWT.
    Given user has any "<account_type>" account types
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed

    Examples:
          | account_type                               | ber | jira_id      |
          | legacy control;legacy postpay;jeri postpay | ber | QANOV-525499 |
          | vivo easy                                  |     | QANOV-525500 |
          | legacy convergente                         |     | QANOV-525501 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @sanity @vivobr
  Scenario Outline: <account_type> user will see mobile_allowances section in Assinatura tab
    Given user has any "<account_type>" account types
      And user has purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield is displayed
      And the "plans.mobile_allowances.info" textfield with "Você tem mais internet pra outros consumos" text is displayed

    Examples:
          | account_type           | ber | parent_test_plan | jira_id      |
          | beatrix                | ber | QANOV-359861     | QANOV-420523 |
          | control_n;jeri control |     | QANOV-423279     | QANOV-420524 |

  @jira.QANOV-377287 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @sanity @vivobr
  Scenario: multivivo user will see mobile_allowances section in Assinatura tab
    Given user has a "multivivo" account type
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.lines" textfield with the "Celular • \d+ linhas" format is displayed
      And the "plans.mobile_allowances.avatar_group" icon is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield is displayed

  @jira.QANOV-377288 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: full convergente user will see mobile_allowances section in Assinatura tab
    Given user has a "convergente" account type
      And user has "1" mobile lines in plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield is displayed
      And the "plans.fixo_product" section is displayed

  @jira.QANOV-420526 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  Scenario: multivivo convergente user will see mobile_allowances section in Assinatura tab
    Given user has a "convergente" account type
      And user has "several" mobile lines in plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.lines" textfield with the "Celular • \d+ linhas" format is displayed
      And the "plans.mobile_allowances.avatar_group" icon is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield is displayed
      And the "plans.fixo_product" section is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario Outline: Prepay with <data_package> deactivate user can see mobile_allowances section in Assinatura tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user does not have activated "<data_package>" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances.info" textfield with "Ao usar internet, SMS ou ligar, o Pré Diário será ativado" text is displayed

    Examples:
          | data_package    | jira_id      |
          | vivo_pre_turbo  | QANOV-377289 |
          | vivo_pre_diario | QANOV-420527 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario Outline: Prepay user with <data_package> and "apps_use" data bundles can see mobile_allowances section in Assinatura tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "<data_package>" data bundles
      And user has purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield is displayed
      And the "plans.mobile_allowances.subtitle" textfield with "Internet pra usar como quiser" text is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed
      And the "plans.mobile_allowances.info" textfield with "Você tem mais internet pra outros consumos" text is displayed

    Examples:
          | data_package    | ber | jira_id      |
          | vivo_pre_turbo  | ber | QANOV-420528 |
          | vivo_pre_diario |     | QANOV-420529 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario Outline: Prepay user with <data_package> and without "apps_use" data bundles can see mobile_allowances section in Assinatura tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "<data_package>" data bundles
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed
      And the "plans.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | data_package    | ber | jira_id      |
          | vivo_pre_turbo  | ber | QANOV-377290 |
          | vivo_pre_diario |     | QANOV-420530 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @sanity @vivobr
  Scenario Outline: <account_type> user who has limited allowance with consumption will see consumption module in Assinatura tab
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plans.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | account_type              | ber | parent_test_plan          | jira_id      |
          | beatrix                   | ber | QANOV-359861              | QANOV-377291 |
          | multivivo                 |     | QANOV-359861:QANOV-568388 | QANOV-377292 |
          | convergente               |     | QANOV-359861              | QANOV-377293 |
          | control_n;jeri control    |     | QANOV-423279              | QANOV-377294 |
          | legacy prepay;jeri prepay |     | QANOV-359861:QANOV-423279 | QANOV-420531 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  @vivobr
  Scenario Outline: <account_type> user who has limited allowance with all data consumed will see consumption module in Assinatura tab
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plans.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | account_type              | parent_test_plan          | jira_id      |
          | beatrix                   | QANOV-359861              | QANOV-377296 |
          | multivivo                 | QANOV-359861:QANOV-568388 | QANOV-377297 |
          | convergente               | QANOV-359861              | QANOV-377298 |
          | control_n;jeri control    | QANOV-423279              | QANOV-377299 |
          | legacy prepay;jeri prepay | QANOV-359861:QANOV-423279 | QANOV-420532 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user who has an unlimited allowance with consumption will see consumption module in Assinatura tab
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plans.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plans.mobile_allowances.data_remaining" textfield with "Ilimitada" text is displayed

    Examples:
          | account_type              | parent_test_plan | ber | jira_id      |
          | beatrix                   |                  |     | QANOV-377302 |
          | multivivo                 | QANOV-568388     |     | QANOV-377303 |
          | convergente               |                  | ber | QANOV-377304 |
          | control_n;jeri control    |                  |     | QANOV-377305 |
          | legacy prepay;jeri prepay |                  |     | QANOV-420533 |

  @jira.QANOV-377307 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @sanity @vivobr
  Scenario: User can access to meatball menu screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n;vivo easy;legacy convergente" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans.meatball_menu" button
     Then the "Meatball Menu" page is displayed
      And the "meatball_menu_entrypoint_list" list is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @somke @vivobr
  Scenario Outline: <account_type> user will see mobile_allowances section in Assinatura tab
    Legacy convergente:
    - TV, Banda Larga or Landline with origin system ATIS
    - Legacy TV DTH with origin system NSIA or TV/Internet with origin system SIA.
    - Landline FWT.
    Given user has any "<account_type>" account types
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan" section is displayed
      And the "plan.vivinho" icon is displayed
      And the "plan.title" textfield is displayed
      And the "plan.subtitle" textfield is displayed

    Examples:
          | account_type                               | ber | jira_id      |
          | legacy control;legacy postpay;jeri postpay | ber | QANOV-525502 |
          | vivo easy                                  |     | QANOV-525503 |
          | legacy convergente                         |     | QANOV-525504 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario Outline: Prepay user with <data_package> and without "any" data bundles can see mobile_allowances section in Plan details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "<data_package>" data bundles
      And user has not purchased "any" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plan.mobile_allowances.progression_bar" progression bar is displayed
      And the "plan.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | data_package    | ber | jira_id      |
          | vivo_pre_turbo  | ber | QANOV-450745 |
          | vivo_pre_diario |     | QANOV-450746 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario Outline: Prepay user with <data_package> and with "any" data bundles can see mobile_allowances section in Plan details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "<data_package>" data bundles
      And user has purchased "any" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And each element in the "plan.mobile_allowances" list has the "title" field
      And each element in the "plan.mobile_allowances" list has the "progression_bar" field
      And each element in the "plan.mobile_allowances" list has the "data_remaining" field with "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format

    Examples:
          | data_package    | ber | jira_id      |
          | vivo_pre_turbo  | ber | QANOV-450747 |
          | vivo_pre_diario |     | QANOV-450748 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @sanity @vivobr
  Scenario Outline: <account_type> user who has limited allowance with consumption will see consumption module in Plan details page
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plan.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plan.mobile_allowances.data_remaining" textfield with the "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | account_type           | ber | parent_test_plan          | jira_id      |
          | beatrix                | ber | QANOV-437472              | QANOV-450749 |
          | multivivo              |     | QANOV-437472:QANOV-568388 | QANOV-450750 |
          | convergente            |     | QANOV-437472              | QANOV-450751 |
          | control_n;jeri control |     | QANOV-423279              | QANOV-450752 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  @vivobr
  Scenario Outline: <account_type> user who has limited allowance with all data consumed will see consumption module in Plan details page
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.mobile_allowances.title" textfield with "Compre mais internet pra continuar navegando" text is displayed
      And the "plan.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plan.mobile_allowances.data_remaining" textfield with the "0 (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format is displayed

    Examples:
          | account_type           | parent_test_plan          | jira_id      |
          | beatrix                | QANOV-437472              | QANOV-450754 |
          | multivivo              | QANOV-437472:QANOV-568388 | QANOV-450755 |
          | convergente            | QANOV-437472              | QANOV-450756 |
          | control_n;jeri control | QANOV-423279              | QANOV-450757 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user who has an unlimited allowance with consumption will see consumption module in Plan details page
    Given user has any "<account_type>" account types
      And user has a "mobile_line" product
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.mobile_allowances.title" textfield with "Internet pra usar como quiser" text is displayed
      And the "plan.mobile_allowances.progression_bar" progression bar is displayed in "purple" color
      And the "plan.mobile_allowances.data_remaining" textfield with "Ilimitada" text is displayed

    Examples:
          | account_type           | parent_test_plan | ber | jira_id      |
          | beatrix                |                  |     | QANOV-450759 |
          | multivivo              | QANOV-568388     |     | QANOV-450760 |
          | convergente            |                  | ber | QANOV-450761 |
          | control_n;jeri control |                  |     | QANOV-450762 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472
  @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with "several" mobile lines in plan and data sharing user will see mobile_allowances section in Plan details page
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has data sharing
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.lines.admin_icon" icon is displayed
      And the "plan.lines.admin_name" textfield with the "Você (Titular)" format is displayed
      And the "plan.lines.admin_chevron_icon" icon is displayed
      And each element in the "plan.lines.dependant" list has the "icon" field
      And each element in the "plan.lines.dependant" list has the "name" field
      And each element in the "plan.lines.dependant" list has the "icon_chevron" field
      And the "plan.information" textfield with "A sua internet está sendo compartilhada com linhas dependentes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | multivivo    |     | QANOV-450764 |
          | convergente  | ber | QANOV-450765 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472
  @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with "several" mobile lines in plan and data distributed will see mobile_allowances section in Plan details page
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has data distributed
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And the "plan.lines.admin_icon" icon is displayed
      And the "plan.lines.admin_name" textfield with the "\d+ (Titular)" format is displayed
      And the "plan.lines.admin_chevron_icon" icon is displayed
      And each element in the "plan.lines.dependant" list has the "icon" field
      And each element in the "plan.lines.dependant" list has the "name" field
      And each element in the "plan.lines.dependant" list has the "icon_chevron" field
      And the "plan.information" textfield with "Você distribuiu sua internet com linhas dependentes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | multivivo    |     | QANOV-450766 |
          | convergente  | ber | QANOV-450767 |

  @jira.QANOV-570346 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  Scenario: User can access to consumption webview when taps on multivivo lines
    Given user has a "multivivo;convergente" account type
      And user has "several" mobile lines in plan
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on any element in the "plan.lines" list
     Then the internal webview is displayed
      And the "Detalhes da assinatura" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke @vivobr
  Scenario Outline: <account_type> user with "any" data bundles can see mobile_allowances section in Plan details page
    Given user has any "<account_type>" account types
      And user has purchased "any" data bundles
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan.mobile_allowances" section is displayed
      And each element in the "plan.mobile_allowances" list has the "title" field
      And each element in the "plan.mobile_allowances" list has the "progression_bar" field
      And each element in the "plan.mobile_allowances" list has the "data_remaining" field with "\d+(,\d\d)? (MB|GB|KB) usados de \d+(,\d\d)? (MB|GB|KB)" format

    Examples:
          | account_type           | ber | parent_test_plan          | jira_id      |
          | beatrix                |     | QANOV-437472              | QANOV-450768 |
          | multivivo              |     | QANOV-437472:QANOV-568388 | QANOV-450769 |
          | convergente            | ber | QANOV-437472              | QANOV-450770 |
          | control_n;jeri control |     | QANOV-423279              | QANOV-450771 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual
  @mobile @vivobr
  Scenario Outline: <account_type> user will see a plan card in Assinatura tab during a maintenance window
    Given user has any "<account_type>" account types
      And there is a maintenance window
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

    Examples:
          | account_type                               | ber | priority | jira_id      |
          | beatrix                                    | ber | sanity   | QANOV-517415 |
          | control_n;jeri control                     |     | smoke    | QANOV-517416 |
          | legacy control;legacy postpay;jeri postpay |     | smoke    | QANOV-517417 |
          | multivivo                                  |     | smoke    | QANOV-517418 |

  @jira.QANOV-517419 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: full convergente user will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has "1" mobile lines in plan
      And there is a maintenance window
      And the "fixo" information is available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

  @jira.QANOV-517420 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: multivivo convergente user will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has "several" mobile lines in plan
      And there is a maintenance window
      And the "fixo" information is available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

  @jira.QANOV-517421 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile
  @regression @vivobr
  Scenario: full convergente user without the "fixo" information available will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has "1" mobile lines in plan
      And there is a maintenance window
      And the "fixo" information is not available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

  @jira.QANOV-517422 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @regression
  @vivobr
  Scenario: multivivo convergente user without the "fixo" information available will see a plan card in Assinatura tab during a maintenance window
    Given user has a "convergente" account type
      And user has "several" mobile lines in plan
      And there is a maintenance window
      And the "fixo" information is not available
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.fixo_product" section is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed

  @jira.QANOV-517423 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: Prepay user will see a plan card in Assinatura tab during a maintenance window
    Given user has any "legacy prepay;jeri prepay" account types
      And there is a maintenance window
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is not displayed
      And the "plans.custom_text" textfield is displayed
      And the "plans.footer_link" link is displayed
