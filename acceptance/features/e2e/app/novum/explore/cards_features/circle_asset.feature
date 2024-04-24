# -*- coding: utf-8 -*-
@jira.QANOV-441512
Feature: Circle asset

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a circle asset with <type> in a card within a <module_type> module
    Given user has a card with a circle asset with "<type>" on a "<module_type>" Explore module
     When searches the "card"
     Then the selected explore "card" has the "circle_asset_<type>" field displayed

    @smoke
    Examples:
          | product | module_type      | type  | cv   | ber | jira_id      |
          | vivobr  | featured content | image | 14.8 | ber | QANOV-441513 |
          | moves   | vertical cards   | text  | 14.8 | ber | QANOV-441514 |

    @regression
    Examples:
          | product | module_type      | type  | cv     | ber | jira_id      |
          | vivobr  | featured content | text  | 14.8   |     | QANOV-441515 |
          | vivobr  | vertical cards   | image | 14.8   |     | QANOV-441516 |
          | vivobr  | vertical cards   | text  | 14.8   |     | QANOV-441517 |
          | vivobr  | display cards    | image | 14.8   |     | QANOV-441518 |
          | vivobr  | display cards    | text  | 14.8   |     | QANOV-441519 |
          | vivobr  | poster cards     | image | 14.8   |     | QANOV-441520 |
          | vivobr  | poster cards     | text  | 14.8   |     | QANOV-441521 |
          | vivobr  | naked cards      | image | 14.8   |     | QANOV-468581 |
          | vivobr  | naked cards      | text  | 14.8   |     | QANOV-468582 |
          | moves   | featured content | image | 14.8   |     | QANOV-441523 |
          | moves   | featured content | text  | 14.8   |     | QANOV-441524 |
          | moves   | vertical cards   | image | 14.8   |     | QANOV-441525 |
          | moves   | display cards    | image | 14.8   |     | QANOV-441526 |
          | moves   | display cards    | text  | 14.8   |     | QANOV-441527 |
          | moves   | poster cards     | image | 14.8   |     | QANOV-441528 |
          | moves   | poster cards     | text  | 14.8   |     | QANOV-441529 |
          | moves   | naked cards      | image | 14.8   |     | QANOV-468584 |
          | moves   | naked cards      | text  | 14.8   |     | QANOV-468585 |
          | o2uk    | featured content | image | 14.8   | ber | QANOV-441530 |
          | o2uk    | featured content | text  | 14.8   |     | QANOV-441531 |
          | o2uk    | vertical cards   | image | 14.8   |     | QANOV-441532 |
          | o2uk    | vertical cards   | text  | 14.8   |     | QANOV-441533 |
          | o2uk    | display cards    | image | 14.8   |     | QANOV-441534 |
          | o2uk    | display cards    | text  | 14.8   |     | QANOV-441535 |
          | o2uk    | poster cards     | image | 14.8   |     | QANOV-441536 |
          | o2uk    | poster cards     | text  | 14.8   |     | QANOV-441537 |
          | o2uk    | naked cards      | image | 14.8   |     | QANOV-468588 |
          | o2uk    | naked cards      | text  | 14.8   |     | QANOV-468589 |
          | blaude  | featured content | image | 14.8   |     | QANOV-441538 |
          | blaude  | featured content | text  | 14.8   |     | QANOV-441539 |
          | blaude  | vertical cards   | image | 14.8   |     | QANOV-441540 |
          | blaude  | vertical cards   | text  | 14.8   |     | QANOV-441541 |
          | blaude  | display cards    | image | 14.8   |     | QANOV-441542 |
          | blaude  | display cards    | text  | 14.8   |     | QANOV-441543 |
          | blaude  | poster cards     | image | 14.8   |     | QANOV-441544 |
          | blaude  | poster cards     | text  | 14.8   |     | QANOV-441545 |
          | blaude  | naked cards      | image | 14.8   | ber | QANOV-468590 |
          | blaude  | naked cards      | text  | 14.8   |     | QANOV-468592 |
          | o2de    | featured content | image | 14.8   |     | QANOV-441546 |
          | o2de    | featured content | text  | 14.8   |     | QANOV-441547 |
          | o2de    | vertical cards   | image | 14.8   |     | QANOV-441548 |
          | o2de    | vertical cards   | text  | 14.8   |     | QANOV-441549 |
          | o2de    | display cards    | image | 14.8   |     | QANOV-441550 |
          | o2de    | display cards    | text  | 14.8   | ber | QANOV-441551 |
          | o2de    | poster cards     | image | 14.8   |     | QANOV-441552 |
          | o2de    | poster cards     | text  | 14.8   |     | QANOV-441553 |
          | o2de    | naked cards      | image | 14.8   |     | QANOV-468594 |
          | o2de    | naked cards      | text  | 14.8   |     | QANOV-468595 |
          | o2es    | featured content | image | Future |     | QANOV-441554 |
          | o2es    | featured content | text  | Future |     | QANOV-441555 |
          | o2es    | vertical cards   | image | Future |     | QANOV-441556 |
          | o2es    | vertical cards   | text  | Future |     | QANOV-441557 |
          | o2es    | display cards    | image | Future |     | QANOV-441558 |
          | o2es    | display cards    | text  | Future |     | QANOV-441559 |
          | o2es    | poster cards     | image | Future |     | QANOV-441560 |
          | o2es    | poster cards     | text  | Future |     | QANOV-441561 |
          | o2es    | naked cards      | image | Future |     | QANOV-468599 |
          | o2es    | naked cards      | text  | Future | ber | QANOV-468601 |
