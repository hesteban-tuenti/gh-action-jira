# -*- coding: utf-8 -*-
@jira.QANOV-269739 @not_hardening
Feature: Card management - edit card


  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can access to the edit card page from a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
     Then the "Card Content" page is loaded
      And the form is already filled with the information of the card

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9714   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9715   |
          | vivobr  | rows                | 11.14  | QANOV-9716   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-285940 |
          | vivobr  | banner              | 14.3   | QANOV-376327 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376328 |
          | vivobr  | data_cards          | 14.3   | QANOV-376329 |
          | vivobr  | display_cards       | 14.3   | QANOV-376330 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499694 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499695 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499696 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499697 |
          | o2uk    | featured_content    | 11.14  | QANOV-9718   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9719   |
          | o2uk    | rows                | 11.14  | QANOV-9720   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-285941 |
          | o2uk    | banner              | 14.3   | QANOV-376331 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376332 |
          | o2uk    | data_cards          | 14.3   | QANOV-376333 |
          | o2uk    | display_cards       | 14.3   | QANOV-376334 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499698 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499699 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499700 |
          | moves   | featured_content    | 11.14  | QANOV-9722   |
          | moves   | vertical_cards      | 11.14  | QANOV-9723   |
          | moves   | rows                | 11.14  | QANOV-9724   |
          | moves   | highlighted_cards   | 11.14  | QANOV-285942 |
          | moves   | data_cards          | 14.3   | QANOV-328050 |
          | moves   | display_cards       | 14.3   | QANOV-328049 |
          | moves   | banner              | 14.3   | QANOV-376335 |
          | moves   | banner_hero         | 14.3   | QANOV-376336 |
          | moves   | poster_cards        | 14.8   | QANOV-499701 |
          | moves   | naked_cards         | 14.8   | QANOV-499702 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499703 |
          | blaude  | featured_content    | 11.14  | QANOV-285943 |
          | blaude  | vertical_cards      | 11.14  | QANOV-285944 |
          | blaude  | rows                | 11.14  | QANOV-285945 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-285946 |
          | blaude  | banner              | 14.3   | QANOV-376339 |
          | blaude  | banner_hero         | 14.3   | QANOV-376340 |
          | blaude  | data_cards          | 14.3   | QANOV-376341 |
          | blaude  | display_cards       | 14.3   | QANOV-376342 |
          | blaude  | poster_cards        | 14.8   | QANOV-499704 |
          | blaude  | naked_cards         | 14.8   | QANOV-499705 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499706 |
          | o2de    | featured_content    | 14.3   | QANOV-376343 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376344 |
          | o2de    | rows                | 14.3   | QANOV-376345 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376346 |
          | o2de    | banner              | 14.3   | QANOV-376347 |
          | o2de    | banner_hero         | 14.3   | QANOV-376348 |
          | o2de    | data_cards          | 14.3   | QANOV-376349 |
          | o2de    | display_cards       | 14.3   | QANOV-376350 |
          | o2de    | poster_cards        | 14.8   | QANOV-499707 |
          | o2de    | naked_cards         | 14.8   | QANOV-499708 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499709 |
          | o2es    | featured_content    | Future | QANOV-376351 |
          | o2es    | vertical_cards      | Future | QANOV-376352 |
          | o2es    | rows                | Future | QANOV-376353 |
          | o2es    | highlighted_cards   | Future | QANOV-376354 |
          | o2es    | banner              | Future | QANOV-376355 |
          | o2es    | banner_hero         | Future | QANOV-376356 |
          | o2es    | data_cards          | Future | QANOV-376357 |
          | o2es    | display_cards       | Future | QANOV-376358 |
          | o2es    | poster_cards        | Future | QANOV-499710 |
          | o2es    | naked_cards         | Future | QANOV-499711 |
          | o2es    | naked_small_cards   | Future | QANOV-499712 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user will see the cancel popup when cancelling the edit of a card from a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "cancel_button" button
     Then the "cancel_edit_popup" element is displayed
      And the text of the element "popup_title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "popup_text" is equal to "If you leave now your changes won't be changed"
      And the text of the element "popup_cancel" is equal to "No, go back"
      And the text of the element "popup_confirm" is equal to "Yes, leave"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-9726   |
          | o2uk    | 11.14  | QANOV-9730   |
          | moves   | 11.14  | QANOV-9734   |
          | blaude  | 11.14  | QANOV-285950 |
          | o2de    | 14.3   | QANOV-376375 |
          | o2es    | Future | QANOV-376383 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user who cancels the popup will remain in the edit card page
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "any" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "cancel_button" button
      And I click on the "popup_cancel" button
     Then the "Card Content" page is loaded

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-531732 |
          | o2uk    | 11.14  | QANOV-531733 |
          | moves   | 11.14  | QANOV-531735 |
          | blaude  | 11.14  | QANOV-531736 |
          | o2de    | 14.3   | QANOV-531738 |
          | o2es    | Future | QANOV-531739 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user who confirms the cancels the popup will go to the edit module page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "cancel_button" button
      And I click on the "popup_confirm" button
     Then the "Edit Module" page is loaded

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-531740 |
          | o2uk    | 11.14  | QANOV-531742 |
          | moves   | 11.14  | QANOV-531744 |
          | blaude  | 11.14  | QANOV-531746 |
          | o2de    | 14.3   | QANOV-531747 |
          | o2es    | Future | QANOV-531748 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can edit a field in card within a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Card Edition Test"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And the text of the element "card_title_input" is equal to "Card Edition Test"

    @sanity
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9738   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9741   |
          | vivobr  | rows                | 11.14  | QANOV-9744   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-285957 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376392 |
          | vivobr  | data_cards          | 14.3   | QANOV-376393 |
          | vivobr  | display_cards       | 14.3   | QANOV-376394 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499732 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499733 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499734 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499735 |
          | o2uk    | featured_content    | 11.14  | QANOV-9739   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9742   |
          | o2uk    | rows                | 11.14  | QANOV-9745   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-285958 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376396 |
          | o2uk    | data_cards          | 14.3   | QANOV-376397 |
          | o2uk    | display_cards       | 14.3   | QANOV-376398 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499736 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499737 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499738 |
          | moves   | featured_content    | 11.14  | QANOV-9740   |
          | moves   | vertical_cards      | 11.14  | QANOV-9743   |
          | moves   | rows                | 11.14  | QANOV-9746   |
          | moves   | highlighted_cards   | 11.14  | QANOV-285959 |
          | moves   | banner_hero         | 14.3   | QANOV-376400 |
          | moves   | data_cards          | 14.3   | QANOV-376401 |
          | moves   | display_cards       | 14.3   | QANOV-376402 |
          | moves   | poster_cards        | 14.8   | QANOV-499739 |
          | moves   | naked_cards         | 14.8   | QANOV-499740 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499741 |
          | blaude  | featured_content    | 11.14  | QANOV-285954 |
          | blaude  | vertical_cards      | 11.14  | QANOV-285955 |
          | blaude  | rows                | 11.14  | QANOV-285956 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-285960 |
          | blaude  | banner_hero         | 14.3   | QANOV-376404 |
          | blaude  | data_cards          | 14.3   | QANOV-376405 |
          | blaude  | display_cards       | 14.3   | QANOV-376406 |
          | blaude  | poster_cards        | 14.8   | QANOV-499742 |
          | blaude  | naked_cards         | 14.8   | QANOV-499743 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499744 |
          | o2de    | featured_content    | 14.3   | QANOV-376407 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376408 |
          | o2de    | rows                | 14.3   | QANOV-376409 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376410 |
          | o2de    | banner_hero         | 14.3   | QANOV-376412 |
          | o2de    | data_cards          | 14.3   | QANOV-376413 |
          | o2de    | display_cards       | 14.3   | QANOV-376414 |
          | o2de    | poster_cards        | 14.8   | QANOV-499745 |
          | o2de    | naked_cards         | 14.8   | QANOV-499746 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499747 |
          | o2es    | featured_content    | Future | QANOV-376415 |

    @regression
    Examples:
          | product | module_type       | cv     | jira_id      |
          | o2es    | vertical_cards    | Future | QANOV-376416 |
          | o2es    | rows              | Future | QANOV-376417 |
          | o2es    | highlighted_cards | Future | QANOV-376418 |
          | o2es    | banner_hero       | Future | QANOV-376420 |
          | o2es    | data_cards        | Future | QANOV-376421 |
          | o2es    | display_cards     | Future | QANOV-376422 |
          | o2es    | poster_cards      | Future | QANOV-499748 |
          | o2es    | naked_cards       | Future | QANOV-499749 |
          | o2es    | naked_small_cards | Future | QANOV-499750 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can cancel remove a card from a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And stores the text value from the "card_name" field of "cards_list" list with "0" index
      And I click on the "remove_card" button
      And the "confirmation_popup" element is displayed
      And I click on the "cancel_button" button
     Then the "confirmation_popup" element is not displayed
      And the "0" index in the "cards_list" list has the "card_name" field with "[CONTEXT:card_name]" text
      And the card on the "<module_type>" module is displayed

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9786   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9787   |
          | vivobr  | rows                | 11.14  | QANOV-9788   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-285961 |
          | vivobr  | banner              | 14.3   | QANOV-376423 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376424 |
          | vivobr  | data_cards          | 14.3   | QANOV-376425 |
          | vivobr  | display_cards       | 14.3   | QANOV-376426 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499751 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499752 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499753 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499754 |
          | o2uk    | featured_content    | 11.14  | QANOV-9790   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9791   |
          | o2uk    | rows                | 11.14  | QANOV-9792   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-285962 |
          | o2uk    | banner              | 14.3   | QANOV-376427 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376428 |
          | o2uk    | data_cards          | 14.3   | QANOV-376429 |
          | o2uk    | display_cards       | 14.3   | QANOV-376430 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499755 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499756 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499757 |
          | moves   | featured_content    | 11.14  | QANOV-9794   |
          | moves   | vertical_cards      | 11.14  | QANOV-9795   |
          | moves   | rows                | 11.14  | QANOV-9796   |
          | moves   | highlighted_cards   | 11.14  | QANOV-285963 |
          | moves   | banner              | 14.3   | QANOV-376431 |
          | moves   | banner_hero         | 14.3   | QANOV-376432 |
          | moves   | data_cards          | 14.3   | QANOV-328243 |
          | moves   | display_cards       | 14.3   | QANOV-328242 |
          | moves   | poster_cards        | 14.8   | QANOV-499758 |
          | moves   | naked_cards         | 14.8   | QANOV-499759 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499760 |
          | blaude  | featured_content    | 11.14  | QANOV-285964 |
          | blaude  | vertical_cards      | 11.14  | QANOV-285965 |
          | blaude  | rows                | 11.14  | QANOV-285966 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-285967 |
          | blaude  | banner              | 14.3   | QANOV-376435 |
          | blaude  | banner_hero         | 14.3   | QANOV-376436 |
          | blaude  | data_cards          | 14.3   | QANOV-376437 |
          | blaude  | display_cards       | 14.3   | QANOV-376438 |
          | blaude  | poster_cards        | 14.8   | QANOV-499761 |
          | blaude  | naked_cards         | 14.8   | QANOV-499762 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499763 |
          | o2de    | featured_content    | 14.3   | QANOV-376439 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376440 |
          | o2de    | rows                | 14.3   | QANOV-376441 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376442 |
          | o2de    | banner              | 14.3   | QANOV-376443 |
          | o2de    | banner_hero         | 14.3   | QANOV-376444 |
          | o2de    | data_cards          | 14.3   | QANOV-376445 |
          | o2de    | display_cards       | 14.3   | QANOV-376446 |
          | o2de    | poster_cards        | 14.8   | QANOV-499764 |
          | o2de    | naked_cards         | 14.8   | QANOV-499765 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499766 |
          | o2es    | featured_content    | Future | QANOV-376447 |
          | o2es    | vertical_cards      | Future | QANOV-376448 |
          | o2es    | rows                | Future | QANOV-376449 |
          | o2es    | highlighted_cards   | Future | QANOV-376450 |
          | o2es    | banner              | Future | QANOV-376451 |
          | o2es    | banner_hero         | Future | QANOV-376452 |
          | o2es    | data_cards          | Future | QANOV-376453 |
          | o2es    | display_cards       | Future | QANOV-376454 |
          | o2es    | poster_cards        | Future | QANOV-499767 |
          | o2es    | naked_cards         | Future | QANOV-499768 |
          | o2es    | naked_small_cards   | Future | QANOV-499769 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can remove a card from a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "remove_card" button
      And the "confirmation_popup" element is displayed
      And I click on the "ok_button" button
     Then the "Modules Repository" page is loaded

    @smoke
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9798   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9799   |
          | vivobr  | rows                | 11.14  | QANOV-9800   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-285968 |
          | vivobr  | banner              | 14.3   | QANOV-376455 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376456 |
          | vivobr  | data_cards          | 14.3   | QANOV-376457 |
          | vivobr  | display_cards       | 14.3   | QANOV-376458 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499770 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499771 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499772 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499773 |
          | o2uk    | featured_content    | 11.14  | QANOV-9802   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9803   |
          | o2uk    | rows                | 11.14  | QANOV-9804   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-285969 |
          | o2uk    | banner              | 14.3   | QANOV-376459 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376460 |
          | o2uk    | data_cards          | 14.3   | QANOV-376461 |
          | o2uk    | display_cards       | 14.3   | QANOV-376462 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499774 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499775 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499776 |
          | moves   | featured_content    | 11.14  | QANOV-9806   |
          | moves   | vertical_cards      | 11.14  | QANOV-9807   |
          | moves   | rows                | 11.14  | QANOV-9808   |
          | moves   | highlighted_cards   | 11.14  | QANOV-285970 |
          | moves   | banner_hero cards   | 14.3   | QANOV-328247 |
          | moves   | banner              | 14.3   | QANOV-376463 |
          | moves   | banner_hero         | 14.3   | QANOV-376464 |
          | moves   | data_cards          | 14.3   | QANOV-376465 |
          | moves   | display_cards       | 14.3   | QANOV-376466 |
          | moves   | poster_cards        | 14.8   | QANOV-499777 |
          | moves   | naked_cards         | 14.8   | QANOV-499778 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499779 |
          | blaude  | featured_content    | 11.14  | QANOV-285971 |
          | blaude  | vertical_cards      | 11.14  | QANOV-285972 |
          | blaude  | rows                | 11.14  | QANOV-285973 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-285974 |
          | blaude  | banner              | 14.3   | QANOV-376467 |
          | blaude  | banner_hero         | 14.3   | QANOV-376468 |
          | blaude  | data_cards          | 14.3   | QANOV-376469 |
          | blaude  | display_cards       | 14.3   | QANOV-376470 |
          | blaude  | poster_cards        | 14.8   | QANOV-499780 |
          | blaude  | naked_cards         | 14.8   | QANOV-499781 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499782 |
          | o2de    | featured_content    | 14.3   | QANOV-376471 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376472 |
          | o2de    | rows                | 14.3   | QANOV-376473 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376474 |
          | o2de    | banner              | 14.3   | QANOV-376475 |
          | o2de    | banner_hero         | 14.3   | QANOV-376476 |
          | o2de    | data_cards          | 14.3   | QANOV-376477 |
          | o2de    | display_cards       | 14.3   | QANOV-376478 |
          | o2de    | poster_cards        | 14.8   | QANOV-499783 |
          | o2de    | naked_cards         | 14.8   | QANOV-499784 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499785 |
          | o2es    | featured_content    | Future | QANOV-376479 |

    @regression
    Examples:
          | product | module_type       | cv     | jira_id      |
          | o2es    | vertical_cards    | Future | QANOV-376480 |
          | o2es    | rows              | Future | QANOV-376481 |
          | o2es    | highlighted_cards | Future | QANOV-376482 |
          | o2es    | banner            | Future | QANOV-376483 |
          | o2es    | banner_hero       | Future | QANOV-376484 |
          | o2es    | data_cards        | Future | QANOV-376485 |
          | o2es    | display_cards     | Future | QANOV-376486 |
          | o2es    | poster_cards      | Future | QANOV-499786 |
          | o2es    | naked_cards       | Future | QANOV-499787 |
          | o2es    | naked_small_cards | Future | QANOV-499788 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can move a card within the cards list in a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I drag a card to another position
      And I click on the "save" button
      And the "Modules Repository" page is loaded
      And I click on the "<edit_module>" button
     Then the "Edit Module" page is loaded
      And the new card order in the "<module_type>" module is displayed

    @smoke
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9831   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9832   |
          | vivobr  | rows                | 11.14  | QANOV-9833   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-285975 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376488 |
          | vivobr  | data_cards          | 14.3   | QANOV-376489 |
          | vivobr  | display_cards       | 14.3   | QANOV-376490 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499789 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499790 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499791 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499792 |
          | o2uk    | featured_content    | 11.14  | QANOV-9834   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9835   |
          | o2uk    | rows                | 11.14  | QANOV-9836   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-285976 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376492 |
          | o2uk    | data_cards          | 14.3   | QANOV-376493 |
          | o2uk    | display_cards       | 14.3   | QANOV-376494 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499793 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499794 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499795 |
          | moves   | featured_content    | 11.14  | QANOV-9837   |
          | moves   | vertical_cards      | 11.14  | QANOV-9838   |
          | moves   | rows                | 11.14  | QANOV-9839   |
          | moves   | highlighted_cards   | 11.14  | QANOV-285977 |
          | moves   | banner_hero         | 14.3   | QANOV-376496 |
          | moves   | data_cards          | 14.3   | QANOV-376497 |
          | moves   | display_cards       | 14.3   | QANOV-376498 |
          | moves   | poster_cards        | 14.8   | QANOV-499796 |
          | moves   | naked_cards         | 14.8   | QANOV-499797 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499798 |
          | blaude  | featured_content    | 11.14  | QANOV-285978 |
          | blaude  | vertical_cards      | 11.14  | QANOV-285979 |
          | blaude  | rows                | 11.14  | QANOV-285980 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-285981 |
          | blaude  | banner_hero         | 14.3   | QANOV-376500 |
          | blaude  | data_cards          | 14.3   | QANOV-376501 |
          | blaude  | display_cards       | 14.3   | QANOV-376502 |
          | blaude  | poster_cards        | 14.8   | QANOV-499799 |
          | blaude  | naked_cards         | 14.8   | QANOV-499800 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499801 |
          | o2de    | featured_content    | 14.3   | QANOV-376503 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376504 |
          | o2de    | rows                | 14.3   | QANOV-376505 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376506 |
          | o2de    | banner_hero         | 14.3   | QANOV-376508 |
          | o2de    | data_cards          | 14.3   | QANOV-376509 |
          | o2de    | display_cards       | 14.3   | QANOV-376510 |
          | o2de    | poster_cards        | 14.8   | QANOV-499802 |
          | o2de    | naked_cards         | 14.8   | QANOV-499803 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499804 |
          | o2es    | featured_content    | Future | QANOV-376511 |

    @regression
    Examples:
          | product | module_type       | cv     | jira_id      |
          | o2es    | vertical_cards    | Future | QANOV-376512 |
          | o2es    | rows              | Future | QANOV-376513 |
          | o2es    | highlighted_cards | Future | QANOV-376514 |
          | o2es    | banner_hero       | Future | QANOV-376516 |
          | o2es    | data_cards        | Future | QANOV-376517 |
          | o2es    | display_cards     | Future | QANOV-376518 |
          | o2es    | poster_cards      | Future | QANOV-499805 |
          | o2es    | naked_cards       | Future | QANOV-499806 |
          | o2es    | naked_small_cards | Future | QANOV-499807 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can edit a card and upload a bumper in a featured content module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    The bumper must be 1080p resolution and have a maximum length of 15 seconds.
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "bumper_checkbox" button
      And I click on the "add_bumper_button" element
      And the "upload_bumper_popup" element is displayed
      And I fill in the "bumper_title" field with "qa_bumper_test"
      And I click on the "upload_file_button" button
      And I select a bumper from the computer files
      And I click on the "upload_button" button
      And I click on the "add_button" button
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the card is updated with the new bumper

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-22201  |
          | o2uk    | 11.14  | QANOV-22203  |
          | moves   | 11.14  | QANOV-22205  |
          | blaude  | 11.14  | QANOV-285982 |
          | o2de    | 14.3   | QANOV-376519 |
          | o2es    | Future | QANOV-376520 |

  @jira.<jira_id> @jira.cv.12.1 @manual @moves @regression @web
  Scenario Outline: A user can select a verticales category on a featured content card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the item with "<category>" text from "account_radio_list" elements list
      And I click on the "save" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
     Then the "account_category_checkbox" checkbox is enabled

    Examples:
          | category              | account_checkbox_list | jira_id     |
          | Comunicaciones y ocio | communications_radio  | QANOV-59892 |
          | Seguridad             | security_radio        | QANOV-59893 |
          | Salud                 | health_radio          | QANOV-59894 |
          | Finanzas y seguros    | finance_radio         | QANOV-59895 |
          | Equipamientos         | equipment_radio       | QANOV-59896 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can see the explore HOME category for a card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    This applies for all cards, for simplification purpose the scenario is only defined for featured content."
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
     Then the "home_checkbox" checkbox with "<home>" text is displayed

    Examples:
          | product | home         | cv     | jira_id      |
          | vivobr  | Destaque     | 12.2   | QANOV-67224  |
          | o2uk    | Most Popular | 12.2   | QANOV-67225  |
          | moves   | Destacados   | 12.2   | QANOV-67226  |
          | blaude  | TBD          | 12.2   | QANOV-285983 |
          | o2de    | TBD          | 14.3   | QANOV-376521 |
          | o2es    | TBD          | Future | QANOV-376522 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can select more than one explore category for a <module_type> card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    This applies for all cards, for simplification purpose the scenario is only defined for featured content."
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<edit_button>" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "devices_category_checkbox" button
      And I click on the "home_category_checkbox" button
      And I click on the "save_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
     Then the "devices_category_checkbox" checkbox is enabled
      And the "home_category_checkbox" checkbox is enabled

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-67227  |
          | vivobr  | vertical_cards      | 14.3   | QANOV-376523 |
          | vivobr  | rows                | 14.3   | QANOV-376524 |
          | vivobr  | highlighted_cards   | 14.3   | QANOV-376525 |
          | vivobr  | banner              | 14.3   | QANOV-376526 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376527 |
          | vivobr  | data_cards          | 14.3   | QANOV-376528 |
          | vivobr  | display_cards       | 14.3   | QANOV-376529 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499808 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499809 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499810 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499811 |
          | o2uk    | featured_content    | 11.14  | QANOV-67228  |
          | o2uk    | vertical_cards      | 14.3   | QANOV-376530 |
          | o2uk    | rows                | 14.3   | QANOV-376531 |
          | o2uk    | highlighted_cards   | 14.3   | QANOV-376532 |
          | o2uk    | banner              | 14.3   | QANOV-376533 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376534 |
          | o2uk    | data_cards          | 14.3   | QANOV-376535 |
          | o2uk    | display_cards       | 14.3   | QANOV-376536 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499812 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499813 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499814 |
          | moves   | featured_content    | 11.14  | QANOV-67229  |
          | moves   | vertical_cards      | 14.3   | QANOV-376537 |
          | moves   | rows                | 14.3   | QANOV-376538 |
          | moves   | highlighted_cards   | 14.3   | QANOV-376539 |
          | moves   | banner              | 14.3   | QANOV-376540 |
          | moves   | banner_hero         | 14.3   | QANOV-376541 |
          | moves   | data_cards          | 14.3   | QANOV-376542 |
          | moves   | display_cards       | 14.3   | QANOV-376543 |
          | moves   | poster_cards        | 14.8   | QANOV-499815 |
          | moves   | naked_cards         | 14.8   | QANOV-499816 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499817 |
          | blaude  | featured_content    | 11.14  | QANOV-285984 |
          | blaude  | vertical_cards      | 14.3   | QANOV-376544 |
          | blaude  | rows                | 14.3   | QANOV-376545 |
          | blaude  | highlighted_cards   | 14.3   | QANOV-376546 |
          | blaude  | banner              | 14.3   | QANOV-376547 |
          | blaude  | banner_hero         | 14.3   | QANOV-376548 |
          | blaude  | data_cards          | 14.3   | QANOV-376549 |
          | blaude  | display_cards       | 14.3   | QANOV-376550 |
          | blaude  | poster_cards        | 14.8   | QANOV-499818 |
          | blaude  | naked_cards         | 14.8   | QANOV-499819 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499820 |
          | o2de    | featured_content    | 14.3   | QANOV-376551 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376552 |
          | o2de    | rows                | 14.3   | QANOV-376553 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376554 |
          | o2de    | banner              | 14.3   | QANOV-376555 |
          | o2de    | banner_hero         | 14.3   | QANOV-376556 |
          | o2de    | data_cards          | 14.3   | QANOV-376557 |
          | o2de    | display_cards       | 14.3   | QANOV-376558 |
          | o2de    | poster_cards        | 14.8   | QANOV-499821 |
          | o2de    | naked_cards         | 14.8   | QANOV-499822 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499823 |
          | o2es    | featured_content    | Future | QANOV-376559 |
          | o2es    | vertical_cards      | Future | QANOV-376560 |
          | o2es    | rows                | Future | QANOV-376561 |
          | o2es    | highlighted_cards   | Future | QANOV-376562 |
          | o2es    | banner              | Future | QANOV-376563 |
          | o2es    | banner_hero         | Future | QANOV-376564 |
          | o2es    | data_cards          | Future | QANOV-376565 |
          | o2es    | display_cards       | Future | QANOV-376566 |
          | o2es    | poster_cards        | Future | QANOV-499824 |
          | o2es    | naked_cards         | Future | QANOV-499825 |
          | o2es    | naked_small_cards   | Future | QANOV-499826 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the microsegments associated to a card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    This applies for all cards, for simplification purpose the scenario is only defined for featured content."
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
     Then the microsegments of a card are displayed in each card with microsegments
      And no microsegments are displayed for a card with no microsegments

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 12.2   | QANOV-78421  |
          | o2uk    | 12.2   | QANOV-78422  |
          | moves   | 12.2   | QANOV-78423  |
          | blaude  | 12.2   | QANOV-285985 |
          | o2de    | 14.3   | QANOV-376567 |
          | o2es    | Future | QANOV-376568 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can see the CTA configuration fields in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
     Then the "card_cta_text_input" inputtext with the "Text for your CTA" placeholder is displayed
      And the "card_cta_url_input" inputtext with the "CTA URL" placeholder is displayed
      And the "card_cta_link_checkbox" element is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.2   | QANOV-269740 |
          | o2uk    | 14.2   | QANOV-269741 |
          | moves   | 14.2   | QANOV-269742 |
          | blaude  | 14.2   | QANOV-285986 |
          | o2de    | 14.3   | QANOV-376569 |
          | o2es    | Future | QANOV-376570 |

  @jira.<jira_id> @<product> @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-290921 @manual @smoke @web
  Scenario Outline: An editor can see the voucher code checkbox within the CTA configuration fields in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
     Then the "card_cta_text_input" inputtext with the "Text for your CTA" placeholder is displayed
      And the "card_cta_url_input" inputtext with the "CTA URL" placeholder is displayed
      And the "card_cta_link_checkbox" element is displayed
      And the "card_cta_voucher_checkbox" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-371924 |
          | o2uk    | QANOV-291330 |
          | moves   | QANOV-371925 |
          | blaude  | QANOV-371926 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can configure a CTA in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
      And I fill in the "card_cta_text_input" field with "qa test CTA text"
      And I fill in the "card_cta_url_input" field with "https://www.google.com"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And the "card_cta_checkbox" checkbox is checked

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.2   | QANOV-269743 |
          | o2uk    | 14.2   | QANOV-269744 |
          | moves   | 14.2   | QANOV-269745 |
          | blaude  | 14.2   | QANOV-285987 |
          | o2de    | 14.3   | QANOV-376571 |
          | o2es    | Future | QANOV-376572 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can configure a CTA with a Link in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
      And I fill in the "card_cta_text_input" field with "qa test CTA text"
      And I fill in the "card_cta_url_input" field with "https://www.google.com"
      And I click on the "card_cta_link_checkbox" button
      And I fill in the "card_cta_link_text_input" field with "qa test CTA link text"
      And I fill in the "card_cta_link_url_input" field with "https://www.google.com"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And the "card_cta_checkbox" checkbox is checked
      And the "card_cta_link_checkbox" checkbox is checked

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.2   | QANOV-269746 |
          | o2uk    | 14.2   | QANOV-269747 |
          | moves   | 14.2   | QANOV-269748 |
          | blaude  | 14.2   | QANOV-285988 |
          | o2de    | 14.3   | QANOV-376573 |
          | o2es    | Future | QANOV-376574 |

  @jira.<jira_id> @<product> @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-290921 @manual @regression @web
  Scenario Outline: An editor can configure a CTA with a Voucher code in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
      And I fill in the "card_cta_text_input" field with "qa test CTA text"
      And I fill in the "card_cta_url_input" field with "https://www.google.com"
      And I click on the "card_cta_voucher_checkbox" button
      And I fill in the "card_cta_voucher_input" field with "VOUCHER123"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And the "card_cta_checkbox" checkbox is checked
      And the "card_cta_link_checkbox" checkbox is checked

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-371927 |
          | o2uk    | QANOV-371928 |
          | moves   | QANOV-371929 |
          | blaude  | QANOV-371930 |

  @jira.<jira_id> @<product> @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-290921 @manual @regression @web
  Scenario Outline: An editor can configure a CTA with a Link and a Voucher code in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_cta_checkbox" button
      And I fill in the "card_cta_text_input" field with "qa test CTA text"
      And I fill in the "card_cta_url_input" field with "https://www.google.com"
      And I click on the "card_cta_link_checkbox" button
      And I fill in the "card_cta_link_text_input" field with "qa test CTA link text"
      And I fill in the "card_cta_link_url_input" field with "https://www.google.com"
      And I click on the "card_cta_voucher_checkbox" button
      And I fill in the "card_cta_voucher_input" field with "VOUCHER123"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And the "card_cta_checkbox" checkbox is checked
      And the "card_cta_link_checkbox" checkbox is checked

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-371931 |
          | o2uk    | QANOV-269750 |
          | moves   | QANOV-371932 |
          | blaude  | QANOV-371933 |
          | blaude  | QANOV-371933 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: An editor can not enable CTA and card tappeable options in a featured content card
    Given a "featured content" module has been created in CMS
      And the "featured content" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "card_tapeable_checkbox" button
      And I click on the "card_cta_checkbox" button
     Then the "card_tapeable_checkbox" checkbox is not checked

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.2   | QANOV-269752 |
          | o2uk    | 14.2   | QANOV-269753 |
          | moves   | 14.2   | QANOV-269754 |
          | blaude  | 14.2   | QANOV-285990 |
          | o2de    | 14.3   | QANOV-376575 |
          | o2es    | Future | QANOV-376576 |

  @jira.<jira_id> @<product> @automation.hard @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression
  @web
  Scenario Outline: A user can see a warning on a card when a product id is <status> in a <module_type> module
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains at least "1" card with product in "<status>" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
     Then any element in the "cards_list" list has the "card_product_status" textfield with the "<status>" text

    Examples:
          | product | module_type      | status   | jira_id      |
          | vivobr  | featured_content | Inactive | QANOV-523486 |
          | vivobr  | featured_content | Deleted  | QANOV-523487 |
          | vivobr  | featured_content | Expired  | QANOV-523488 |
          | vivobr  | vertical_cards   | Inactive | QANOV-523489 |
          | vivobr  | vertical_cards   | Deleted  | QANOV-523490 |
          | vivobr  | vertical_cards   | Expired  | QANOV-523491 |
          | vivobr  | display_cards    | Inactive | QANOV-523492 |
          | vivobr  | display_cards    | Deleted  | QANOV-523493 |
          | vivobr  | display_cards    | Expired  | QANOV-523494 |
          | vivobr  | poster_cards     | Inactive | QANOV-523495 |
          | vivobr  | poster_cards     | Deleted  | QANOV-523496 |
          | vivobr  | poster_cards     | Expired  | QANOV-523497 |
          | vivobr  | naked_cards      | Inactive | QANOV-523498 |
          | vivobr  | naked_cards      | Deleted  | QANOV-523499 |
          | vivobr  | naked_cards      | Expired  | QANOV-523500 |
          | o2uk    | featured_content | Inactive | QANOV-523501 |
          | o2uk    | featured_content | Deleted  | QANOV-523502 |
          | o2uk    | featured_content | Expired  | QANOV-523503 |
          | o2uk    | vertical_cards   | Inactive | QANOV-523504 |
          | o2uk    | vertical_cards   | Deleted  | QANOV-523505 |
          | o2uk    | vertical_cards   | Expired  | QANOV-523506 |
          | o2uk    | display_cards    | Inactive | QANOV-523507 |
          | o2uk    | display_cards    | Deleted  | QANOV-523508 |
          | o2uk    | display_cards    | Expired  | QANOV-523509 |
          | o2uk    | poster_cards     | Inactive | QANOV-523510 |
          | o2uk    | poster_cards     | Deleted  | QANOV-523511 |
          | o2uk    | poster_cards     | Expired  | QANOV-523512 |
          | o2uk    | naked_cards      | Inactive | QANOV-523513 |
          | o2uk    | naked_cards      | Deleted  | QANOV-523514 |
          | o2uk    | naked_cards      | Expired  | QANOV-523515 |
          | moves   | featured_content | Inactive | QANOV-523516 |
          | moves   | featured_content | Deleted  | QANOV-523517 |
          | moves   | featured_content | Expired  | QANOV-523518 |
          | moves   | vertical_cards   | Inactive | QANOV-523519 |
          | moves   | vertical_cards   | Deleted  | QANOV-523520 |
          | moves   | vertical_cards   | Expired  | QANOV-523521 |
          | moves   | display_cards    | Inactive | QANOV-523522 |
          | moves   | display_cards    | Deleted  | QANOV-523523 |
          | moves   | display_cards    | Expired  | QANOV-523524 |
          | moves   | poster_cards     | Inactive | QANOV-523525 |
          | moves   | poster_cards     | Deleted  | QANOV-523526 |
          | moves   | poster_cards     | Expired  | QANOV-523527 |
          | moves   | naked_cards      | Inactive | QANOV-523528 |
          | moves   | naked_cards      | Deleted  | QANOV-523529 |
          | moves   | naked_cards      | Expired  | QANOV-523530 |
          | blaude  | featured_content | Inactive | QANOV-523531 |
          | blaude  | featured_content | Deleted  | QANOV-523532 |
          | blaude  | featured_content | Expired  | QANOV-523533 |
          | blaude  | vertical_cards   | Inactive | QANOV-523534 |
          | blaude  | vertical_cards   | Deleted  | QANOV-523535 |
          | blaude  | vertical_cards   | Expired  | QANOV-523536 |
          | blaude  | display_cards    | Inactive | QANOV-523537 |
          | blaude  | display_cards    | Deleted  | QANOV-523538 |
          | blaude  | display_cards    | Expired  | QANOV-523539 |
          | blaude  | poster_cards     | Inactive | QANOV-523540 |
          | blaude  | poster_cards     | Deleted  | QANOV-523541 |
          | blaude  | poster_cards     | Expired  | QANOV-523542 |
          | blaude  | naked_cards      | Inactive | QANOV-523543 |
          | blaude  | naked_cards      | Deleted  | QANOV-523544 |
          | blaude  | naked_cards      | Expired  | QANOV-523545 |
          | o2de    | featured_content | Inactive | QANOV-523546 |
          | o2de    | featured_content | Deleted  | QANOV-523547 |
          | o2de    | featured_content | Expired  | QANOV-523548 |
          | o2de    | vertical_cards   | Inactive | QANOV-523549 |
          | o2de    | vertical_cards   | Deleted  | QANOV-523550 |
          | o2de    | vertical_cards   | Expired  | QANOV-523551 |
          | o2de    | display_cards    | Inactive | QANOV-523552 |
          | o2de    | display_cards    | Deleted  | QANOV-523553 |
          | o2de    | display_cards    | Expired  | QANOV-523554 |
          | o2de    | poster_cards     | Inactive | QANOV-523555 |
          | o2de    | poster_cards     | Deleted  | QANOV-523556 |
          | o2de    | poster_cards     | Expired  | QANOV-523557 |
          | o2de    | naked_cards      | Inactive | QANOV-523558 |
          | o2de    | naked_cards      | Deleted  | QANOV-523559 |
          | o2de    | naked_cards      | Expired  | QANOV-523560 |
          | o2es    | featured_content | Inactive | QANOV-523561 |
          | o2es    | featured_content | Deleted  | QANOV-523562 |
          | o2es    | featured_content | Expired  | QANOV-523563 |
          | o2es    | vertical_cards   | Inactive | QANOV-523564 |
          | o2es    | vertical_cards   | Deleted  | QANOV-523565 |
          | o2es    | vertical_cards   | Expired  | QANOV-523566 |
          | o2es    | display_cards    | Inactive | QANOV-523567 |
          | o2es    | display_cards    | Deleted  | QANOV-523568 |
          | o2es    | display_cards    | Expired  | QANOV-523569 |
          | o2es    | poster_cards     | Inactive | QANOV-523570 |
          | o2es    | poster_cards     | Deleted  | QANOV-523571 |
          | o2es    | poster_cards     | Expired  | QANOV-523572 |
          | o2es    | naked_cards      | Inactive | QANOV-523573 |
          | o2es    | naked_cards      | Deleted  | QANOV-523574 |
          | o2es    | naked_cards      | Expired  | QANOV-523575 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can edit a card in banner module and change the link
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "card_url_input" field with "https://www.google.com"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And the text of the element "card_url_input" is equal to "https://www.google.com"

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548960 |
          | o2uk    | QANOV-548961 |
          | moves   | QANOV-548962 |
          | blaude  | QANOV-548963 |
          | o2de    | QANOV-548964 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548965 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user will see the save card popup after finishing editing a card in a module
    Given a "any" module contains at least "1" card with product in "any" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Card Edition Test"
      And I click on the "save_button" button
     Then the "save_card__popup" element is displayed
      And the text of the element "popup_title" is equal to "Save card"
      And the text of the element "popup_text" is equal to "You can choose to save the card now, so it will published immediately or save it as a draft, and you can publish it whenever you want"
      And the text of the element "popup_save_draft_button" is equal to "Save as draft"
      And the text of the element "popup_save_publish_button" is equal to "Save and publish"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531783 |
          | o2uk    | QANOV-531784 |
          | moves   | QANOV-531785 |
          | blaude  | QANOV-531786 |
          | o2de    | QANOV-531787 |
          | o2es    | QANOV-531788 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can save the card as a draft after finishing editing a card in a module
    Given a "any" module contains at least "1" card with product in "any" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Card Edition Test"
      And I click on the "save_button" button
      And the "save_popup" element is displayed
      And I click on the "save_draft_button" button
     Then the "Edit Module" page is loaded
      And the "crouton_message" textfield with "Card modified" text is displayed
      And the element in "0" position in the "cards_edit_list" list has the "status" textfield with the "Pending publication" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531789 |
          | o2uk    | QANOV-531790 |
          | moves   | QANOV-531791 |
          | blaude  | QANOV-531792 |
          | o2de    | QANOV-531793 |
          | o2es    | QANOV-531794 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can publish the card after finishing editing a card in a module
    Given a "any" module contains at least "1" card with product in "any" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Card Edition Test"
      And I click on the "save_button" button
      And I click on the "save_publish_button" button
     Then the "Edit Module" page is loaded
      And the "crouton_message" textfield with "Card modified and published" text is displayed
      And the element in "0" position in the "cards_edit_list" list has the "status" textfield with the "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531795 |
          | o2uk    | QANOV-531796 |
          | moves   | QANOV-531797 |
          | blaude  | QANOV-531798 |
          | o2de    | QANOV-531799 |
          | o2es    | QANOV-531800 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user will see the publish confirmation popup when publishing a card saved as draft in a module
    Given a "any" module contains at least "1" card with product in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And I click on the "edit_card" button of the element with "Pending publication" value in the "status" field of the "cards_edit_list" web list
      And I click on the "publish_button" button
     Then the "publish_card_popup" element is displayed
      And the text of the element "popup_title" is equal to "Publish card"
      And the text of the element "popup_text" is equal to "If this card is also used in other modules and you publish it, it will be modified and published in the other modules as well."
      And the text of the element "popup_cancel" is equal to "Cancel"
      And the text of the element "popup_publish" is equal to "Publish"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531801 |
          | o2uk    | QANOV-531802 |
          | moves   | QANOV-531803 |
          | blaude  | QANOV-531804 |
          | o2de    | QANOV-531805 |
          | o2es    | QANOV-531806 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user who confirms the publish popup will see the card published in the module
    Given a "[CONTEXT:module_type]" module contains at least "1" card with product in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "cards_edit_list" list
      And I click on the "[CONTEXT:card_list_index]" element in the "cards_edit_list" list
      And I click on the "publish_button" button
      And I click on the "popup_publish" button
     Then the "Edit Module" page is loaded
      And the "crouton_message" textfield with "Card published" text is displayed
      And the element in "[CONTEXT:card_index]" position in the "cards_edit_list" list has the "status" textfield with the "Published" text'

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531807 |
          | o2uk    | QANOV-531808 |
          | moves   | QANOV-531809 |
          | blaude  | QANOV-531810 |
          | o2de    | QANOV-531811 |
          | o2es    | QANOV-531812 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user who cancels the publish popup will see the card in draft status in the module
    Given a "[CONTEXT:module_type]" module contains at least "1" card with product in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]_button" button
      And the "Edit Module" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "cards_edit_list" list
      And I click on the "[CONTEXT:card_list_index]" element in the "cards_edit_list" list
      And I click on the "publish_button" button
      And I click on the "popup_cancel" button
     Then the "Edit Module" page is loaded
      And the element in "[CONTEXT:card_index]" position in the "cards_edit_list" list has the "status" textfield with the "Pending publication" text'

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531813 |
          | o2uk    | QANOV-531814 |
          | moves   | QANOV-531815 |
          | blaude  | QANOV-531816 |
          | o2de    | QANOV-531817 |
          | o2es    | QANOV-531818 |
