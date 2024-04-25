# -*- coding: utf-8 -*-
@jira.QANOV-269775 @not_hardening
Feature: Card management - Validations


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can not create a new card in a <module_type> if mandatory fields are not filled
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Mandatory fields for featured content card, vertical card and row card:
    media, pretitle, title, description, action_url, categories, tracking tag, tracking name description.
    For the banner: media, action_url, categories, tracking tag, tracking name description
    For display card: title, image, action_url, categories, tracking tag, tracking name description
    For data card: title, text for your link, link_url, categories, tracking tag, tracking name description
    For banner hero: title, image, text for your CTA, cta_url, categories, tracking tag, tracking name description
    For highlighted cards: title, description, image, cta_url, categories, tracking tag, tracking name description"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Edit Card" page is loaded
      And I do not fill all the mandatory items of the "<module_type>" form
      And I click on the "save" button
     Then the "error" textfield with the "This field is required" text is displayed under the mandatory field

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9678   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9679   |
          | vivobr  | rows                | 11.14  | QANOV-9680   |
          | vivobr  | banner              | 11.14  | QANOV-9681   |
          | vivobr  | display_cards       | 14.3   | QANOV-376588 |
          | vivobr  | data_cards          | 14.3   | QANOV-376589 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376590 |
          | vivobr  | highlighted_cards   | 14.3   | QANOV-376591 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499273 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499274 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499275 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499276 |
          | o2uk    | featured_content    | 11.14  | QANOV-9682   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9683   |
          | o2uk    | rows                | 11.14  | QANOV-9684   |
          | o2uk    | banner              | 11.14  | QANOV-9685   |
          | o2uk    | display_cards       | 14.3   | QANOV-376592 |
          | o2uk    | data_cards          | 14.3   | QANOV-376593 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376594 |
          | o2uk    | highlighted_cards   | 14.3   | QANOV-376595 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499277 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499278 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499279 |
          | moves   | featured_content    | 11.14  | QANOV-9686   |
          | moves   | vertical_cards      | 11.14  | QANOV-9687   |
          | moves   | rows                | 11.14  | QANOV-9688   |
          | moves   | banner              | 11.14  | QANOV-9689   |
          | moves   | display_cards       | 14.3   | QANOV-376596 |
          | moves   | data_cards          | 14.3   | QANOV-376597 |
          | moves   | banner_hero         | 14.3   | QANOV-376598 |
          | moves   | highlighted_cards   | 14.3   | QANOV-376599 |
          | moves   | poster_cards        | 14.8   | QANOV-499280 |
          | moves   | naked_cards         | 14.8   | QANOV-499281 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499282 |
          | blaude  | featured_content    | 14.3   | QANOV-376600 |
          | blaude  | vertical_cards      | 14.3   | QANOV-376601 |
          | blaude  | rows                | 14.3   | QANOV-376602 |
          | blaude  | banner              | 14.3   | QANOV-376603 |
          | blaude  | highlighted_cards   | 14.3   | QANOV-376604 |
          | blaude  | display_cards       | 14.3   | QANOV-376605 |
          | blaude  | data_cards          | 14.3   | QANOV-376606 |
          | blaude  | banner_hero         | 14.3   | QANOV-376607 |
          | blaude  | poster_cards        | 14.8   | QANOV-499283 |
          | blaude  | naked_cards         | 14.8   | QANOV-499284 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499285 |
          | o2de    | featured_content    | 14.3   | QANOV-376608 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376609 |
          | o2de    | rows                | 14.3   | QANOV-376610 |
          | o2de    | banner              | 14.3   | QANOV-376611 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376612 |
          | o2de    | display_cards       | 14.3   | QANOV-376613 |
          | o2de    | data_cards          | 14.3   | QANOV-376614 |
          | o2de    | banner_hero         | 14.3   | QANOV-376615 |
          | o2de    | poster_cards        | 14.8   | QANOV-499286 |
          | o2de    | naked_cards         | 14.8   | QANOV-499287 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499288 |
          | o2es    | featured_content    | Future | QANOV-376616 |
          | o2es    | vertical_cards      | Future | QANOV-376617 |
          | o2es    | rows                | Future | QANOV-376618 |
          | o2es    | banner              | Future | QANOV-376619 |
          | o2es    | display_cards       | Future | QANOV-376620 |
          | o2es    | data_cards          | Future | QANOV-376621 |
          | o2es    | banner_hero         | Future | QANOV-376622 |
          | o2es    | highlighted_cards   | Future | QANOV-376623 |
          | o2es    | poster_cards        | Future | QANOV-499289 |
          | o2es    | naked_cards         | Future | QANOV-499290 |
          | o2es    | naked_small_cards   | Future | QANOV-499291 |

  @jira.<jira_id> @<product> @jira.cv<cv> @manual @regression @web
  Scenario Outline: A user can not create a new card in a <module_type> if there is a validation error
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Actions Card" page is loaded
      And I fill in the "action_url" field with "htts://tuenti.com"
      And I click on the "next_button" button
     Then the "error" textfield with the "Invalid URL, please check that the URL is HTTPS" text is displayed under the "action_url_input" field

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9690   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9693   |
          | vivobr  | rows                | 11.14  | QANOV-9694   |
          | vivobr  | banner              | 11.14  | QANOV-9697   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-286023 |
          | vivobr  | display_cards       | 14.3   | QANOV-376624 |
          | vivobr  | data_cards          | 14.3   | QANOV-376625 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376626 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499292 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499293 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499294 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499295 |
          | o2uk    | featured_content    | 11.14  | QANOV-9698   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9701   |
          | o2uk    | rows                | 11.14  | QANOV-9702   |
          | o2uk    | banner              | 11.14  | QANOV-9705   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-286024 |
          | o2uk    | display_cards       | 14.3   | QANOV-376627 |
          | o2uk    | data_cards          | 14.3   | QANOV-376628 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376629 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499296 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499297 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499298 |
          | moves   | featured_content    | 11.14  | QANOV-9706   |
          | moves   | vertical_cards      | 11.14  | QANOV-9709   |
          | moves   | rows                | 11.14  | QANOV-9710   |
          | moves   | banner              | 11.14  | QANOV-9713   |
          | moves   | highlighted_cards   | 11.14  | QANOV-286025 |
          | moves   | display_cards       | 14.3   | QANOV-376630 |
          | moves   | data_cards          | 14.3   | QANOV-376631 |
          | moves   | banner_hero         | 14.3   | QANOV-376632 |
          | moves   | poster_cards        | 14.8   | QANOV-499299 |
          | moves   | naked_cards         | 14.8   | QANOV-499300 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499301 |
          | blaude  | featured_content    | 11.14  | QANOV-286026 |
          | blaude  | vertical_cards      | 11.14  | QANOV-286027 |
          | blaude  | rows                | 11.14  | QANOV-286028 |
          | blaude  | banner              | 11.14  | QANOV-286029 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-286030 |
          | blaude  | display_cards       | 14.3   | QANOV-376633 |
          | blaude  | data_cards          | 14.3   | QANOV-376634 |
          | blaude  | banner_hero         | 14.3   | QANOV-376635 |
          | blaude  | poster_cards        | 14.8   | QANOV-499302 |
          | blaude  | naked_cards         | 14.8   | QANOV-499303 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499304 |
          | o2de    | featured_content    | 14.3   | QANOV-376636 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376637 |
          | o2de    | rows                | 14.3   | QANOV-376638 |
          | o2de    | banner              | 14.3   | QANOV-376639 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376640 |
          | o2de    | display_cards       | 14.3   | QANOV-376641 |
          | o2de    | data_cards          | 14.3   | QANOV-376642 |
          | o2de    | banner_hero         | 14.3   | QANOV-376643 |
          | o2de    | poster_cards        | 14.8   | QANOV-499305 |
          | o2de    | naked_cards         | 14.8   | QANOV-499306 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499307 |
          | o2es    | featured_content    | Future | QANOV-376644 |
          | o2es    | vertical_cards      | Future | QANOV-376645 |
          | o2es    | rows                | Future | QANOV-376646 |
          | o2es    | banner              | Future | QANOV-376647 |
          | o2es    | display_cards       | Future | QANOV-376648 |
          | o2es    | data_cards          | Future | QANOV-376649 |
          | o2es    | banner_hero         | Future | QANOV-376650 |
          | o2es    | highlighted_cards   | Future | QANOV-376651 |
          | o2es    | poster_cards        | Future | QANOV-499308 |
          | o2es    | naked_cards         | Future | QANOV-499309 |
          | o2es    | naked_small_cards   | Future | QANOV-499310 |

  @jira.<jira_id> @<product> @jira.cv<cv> @manual @regression @web
  Scenario Outline: A user cannot edit a field in a card within a <module_type> if validation errors occur
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button" button
      And the "Edit Module" page is loaded
      And I click on the "edit_card_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And I fill in the "card_action_input" field with "htts://tuenti.com"
      And I click on the "save_button" button
     Then the "error" textfield with the "Invalid URL, please check that the URL is HTTPS" text is displayed under the "action_url_input" field

    Examples:
          | product | module_type         | 11.14  | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9750   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9752   |
          | vivobr  | rows                | 11.14  | QANOV-9754   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-286031 |
          | vivobr  | display_cards       | 14.3   | QANOV-376652 |
          | vivobr  | data_cards          | 14.3   | QANOV-376653 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376654 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499311 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499312 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499313 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499314 |
          | o2uk    | featured_content    | 11.14  | QANOV-9758   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9760   |
          | o2uk    | rows                | 11.14  | QANOV-9762   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-286032 |
          | o2uk    | display_cards       | 14.3   | QANOV-376655 |
          | o2uk    | data_cards          | 14.3   | QANOV-376656 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376657 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499315 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499316 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499317 |
          | moves   | featured_content    | 11.14  | QANOV-9766   |
          | moves   | vertical_cards      | 11.14  | QANOV-9768   |
          | moves   | rows                | 11.14  | QANOV-9770   |
          | moves   | highlighted_cards   | 11.14  | QANOV-286033 |
          | moves   | display_cards       | 14.3   | QANOV-376658 |
          | moves   | data_cards          | 14.3   | QANOV-376659 |
          | moves   | banner_hero         | 14.3   | QANOV-376660 |
          | moves   | poster_cards        | 14.8   | QANOV-499318 |
          | moves   | naked_cards         | 14.8   | QANOV-499319 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499320 |
          | blaude  | featured_content    | 11.14  | QANOV-286034 |
          | blaude  | vertical_cards      | 11.14  | QANOV-286035 |
          | blaude  | rows                | 11.14  | QANOV-286036 |
          | blaude  | banner              | 11.14  | QANOV-286037 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-286038 |
          | blaude  | featured_content    | 14.3   | QANOV-376661 |
          | blaude  | vertical_cards      | 14.3   | QANOV-376662 |
          | blaude  | rows                | 14.3   | QANOV-376663 |
          | blaude  | banner              | 14.3   | QANOV-376664 |
          | blaude  | display_cards       | 14.3   | QANOV-376665 |
          | blaude  | data_cards          | 14.3   | QANOV-376666 |
          | blaude  | banner_hero         | 14.3   | QANOV-376667 |
          | blaude  | poster_cards        | 14.8   | QANOV-499321 |
          | blaude  | naked_cards         | 14.8   | QANOV-499322 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499323 |
          | o2de    | featured_content    | 14.3   | QANOV-376668 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376669 |
          | o2de    | rows                | 14.3   | QANOV-376670 |
          | o2de    | banner              | 14.3   | QANOV-376671 |
          | o2de    | display_cards       | 14.3   | QANOV-376672 |
          | o2de    | data_cards          | 14.3   | QANOV-376673 |
          | o2de    | banner_hero         | 14.3   | QANOV-376674 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376675 |
          | o2de    | poster_cards        | 14.8   | QANOV-499324 |
          | o2de    | naked_cards         | 14.8   | QANOV-499325 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499326 |
          | o2es    | featured_content    | Future | QANOV-376676 |
          | o2es    | vertical_cards      | Future | QANOV-376677 |
          | o2es    | rows                | Future | QANOV-376678 |
          | o2es    | banner              | Future | QANOV-376679 |
          | o2es    | display_cards       | Future | QANOV-376680 |
          | o2es    | data_cards          | Future | QANOV-376681 |
          | o2es    | banner_hero         | Future | QANOV-376682 |
          | o2es    | highlighted_cards   | Future | QANOV-376683 |
          | o2es    | poster_cards        | Future | QANOV-499327 |
          | o2es    | naked_cards         | Future | QANOV-499328 |
          | o2es    | naked_small_cards   | Future | QANOV-499329 |

  @jira.<jira_id> @<product> @jira.cv<cv> @manual @regression @web
  Scenario Outline: A user cannot edit a card if a mandatory field is left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
      And the "<module_type>" module contains ">=1" card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>_button>" button
      And the "Edit Module" page is loaded
      And I click on the "edit_<module_type>_card_button" button
      And the "Card Content" page is loaded
      And I clear the "card_title_input" input value
      And I click on the "save_button" button
     Then the "error" textfield with the "This field is required" text is displayed under the "<validation_field>" field

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured_content    | 11.14  | QANOV-9774   |
          | vivobr  | vertical_cards      | 11.14  | QANOV-9775   |
          | vivobr  | rows                | 11.14  | QANOV-9776   |
          | vivobr  | highlighted_cards   | 11.14  | QANOV-286039 |
          | vivobr  | display_cards       | 14.3   | QANOV-376684 |
          | vivobr  | data_cards          | 14.3   | QANOV-376685 |
          | vivobr  | banner_hero         | 14.3   | QANOV-376686 |
          | vivobr  | data_cards_advanced | 14.8   | QANOV-499330 |
          | vivobr  | poster_cards        | 14.8   | QANOV-499331 |
          | vivobr  | naked_cards         | 14.8   | QANOV-499332 |
          | vivobr  | naked_small_cards   | 14.8   | QANOV-499333 |
          | o2uk    | featured_content    | 11.14  | QANOV-9778   |
          | o2uk    | vertical_cards      | 11.14  | QANOV-9779   |
          | o2uk    | rows                | 11.14  | QANOV-9780   |
          | o2uk    | highlighted_cards   | 11.14  | QANOV-286040 |
          | o2uk    | display_cards       | 14.3   | QANOV-376687 |
          | o2uk    | data_cards          | 14.3   | QANOV-376688 |
          | o2uk    | banner_hero         | 14.3   | QANOV-376689 |
          | o2uk    | poster_cards        | 14.8   | QANOV-499334 |
          | o2uk    | naked_cards         | 14.8   | QANOV-499335 |
          | o2uk    | naked_small_cards   | 14.8   | QANOV-499336 |
          | moves   | featured_content    | 11.14  | QANOV-9782   |
          | moves   | vertical_cards      | 11.14  | QANOV-9783   |
          | moves   | rows                | 11.14  | QANOV-9784   |
          | moves   | highlighted_cards   | 11.14  | QANOV-286041 |
          | moves   | display_cards       | 14.3   | QANOV-376690 |
          | moves   | data_cards          | 14.3   | QANOV-376691 |
          | moves   | banner_hero         | 14.3   | QANOV-376692 |
          | moves   | poster_cards        | 14.8   | QANOV-499337 |
          | moves   | naked_cards         | 14.8   | QANOV-499338 |
          | moves   | naked_small_cards   | 14.8   | QANOV-499339 |
          | blaude  | featured_content    | 11.14  | QANOV-286042 |
          | blaude  | vertical_cards      | 11.14  | QANOV-286043 |
          | blaude  | rows                | 11.14  | QANOV-286044 |
          | blaude  | highlighted_cards   | 11.14  | QANOV-286045 |
          | blaude  | banner              | 14.3   | QANOV-376693 |
          | blaude  | display_cards       | 14.3   | QANOV-376694 |
          | blaude  | data_cards          | 14.3   | QANOV-376695 |
          | blaude  | banner_hero         | 14.3   | QANOV-376696 |
          | blaude  | poster_cards        | 14.8   | QANOV-499340 |
          | blaude  | naked_cards         | 14.8   | QANOV-499341 |
          | blaude  | naked_small_cards   | 14.8   | QANOV-499342 |
          | o2de    | featured_content    | 14.3   | QANOV-376697 |
          | o2de    | vertical_cards      | 14.3   | QANOV-376698 |
          | o2de    | rows                | 14.3   | QANOV-376699 |
          | o2de    | banner              | 14.3   | QANOV-376700 |
          | o2de    | display_cards       | 14.3   | QANOV-376701 |
          | o2de    | data_cards          | 14.3   | QANOV-376702 |
          | o2de    | banner_hero         | 14.3   | QANOV-376703 |
          | o2de    | highlighted_cards   | 14.3   | QANOV-376704 |
          | o2de    | poster_cards        | 14.8   | QANOV-499343 |
          | o2de    | naked_cards         | 14.8   | QANOV-499344 |
          | o2de    | naked_small_cards   | 14.8   | QANOV-499345 |
          | o2es    | featured_content    | Future | QANOV-376705 |
          | o2es    | vertical_cards      | Future | QANOV-376706 |
          | o2es    | rows                | Future | QANOV-376707 |
          | o2es    | banner              | Future | QANOV-376708 |
          | o2es    | display_cards       | Future | QANOV-376709 |
          | o2es    | data_cards          | Future | QANOV-376710 |
          | o2es    | banner_hero         | Future | QANOV-376711 |
          | o2es    | highlighted_cards   | Future | QANOV-376712 |
          | o2es    | poster_cards        | Future | QANOV-499346 |
          | o2es    | naked_cards         | Future | QANOV-499347 |
          | o2es    | naked_small_cards   | Future | QANOV-499348 |
