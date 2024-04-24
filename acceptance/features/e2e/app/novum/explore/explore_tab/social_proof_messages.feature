# -*- coding: utf-8 -*-
@jira.QANOV-241143
Feature: Social Proof Messages

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @mobile @no_automatable
  Scenario Outline: User can see the social proof message in a <module_type> card within a module with the social proof option activated
    The clicks are counted every 24 hours, so after is activated in the CMS you need to click on the cards and wait one day
    to see the social proof text/icon in the most clicked
    Given user has a "<module_type>" module with the social proof activated in the Explore content
     When searches the "module"
     Then the card with more clicks has the "social_proof_textfield" field displayed
      And the card with more clicks has the "social_proof_icon" field displayed
      And no other card in the module has the "social_proof_textfield" field displayed

    Examples:
          | product | module_type         | test_priority | cv     | jira_id      |
          | vivobr  | featured content    | sanity        | 13.6   | QANOV-241144 |
          | vivobr  | vertical cards      | regression    | 13.6   | QANOV-241145 |
          | vivobr  | rows                | regression    | 13.6   | QANOV-241146 |
          | vivobr  | data cards          | regression    | 14.6   | QANOV-447793 |
          | vivobr  | data cards advanced | regression    | Future | QANOV-447794 |
          | vivobr  | naked cards         | regression    | Future | QANOV-447831 |
          | o2uk    | featured content    | regression    | 13.6   | QANOV-241147 |
          | o2uk    | vertical cards      | smoke         | 13.6   | QANOV-241148 |
          | o2uk    | rows                | sanity        | 13.6   | QANOV-241149 |
          | o2uk    | data cards          | regression    | 14.6   | QANOV-447796 |
          | o2uk    | naked cards         | regression    | Future | QANOV-447832 |
          | moves   | featured content    | regression    | 13.6   | QANOV-241150 |
          | moves   | vertical cards      | sanity        | 13.6   | QANOV-241151 |
          | moves   | rows                | smoke         | 13.6   | QANOV-241152 |
          | moves   | data cards          | regression    | 14.6   | QANOV-447797 |
          | moves   | naked cards         | regression    | Future | QANOV-447833 |
          | blaude  | featured content    | regression    | Future | QANOV-257962 |
          | blaude  | vertical cards      | sanity        | Future | QANOV-257963 |
          | blaude  | rows                | regression    | Future | QANOV-257964 |
          | blaude  | data cards          | regression    | 14.6   | QANOV-447798 |
          | blaude  | naked cards         | regression    | Future | QANOV-447834 |
          | o2de    | featured content    | regression    | Future | QANOV-241153 |
          | o2de    | vertical cards      | regression    | Future | QANOV-241154 |
          | o2de    | rows                | sanity        | Future | QANOV-241155 |
          | o2de    | naked cards         | regression    | Future | QANOV-447835 |
          | o2de    | data cards          | regression    | 14.6   | QANOV-447799 |
          | o2es    | featured content    | smoke         | Future | QANOV-417769 |
          | o2es    | vertical cards      | regression    | Future | QANOV-417770 |
          | o2es    | rows                | regression    | Future | QANOV-417771 |
          | o2es    | data cards          | regression    | 14.6   | QANOV-447800 |
          | o2es    | naked cards         | regression    | Future | QANOV-447836 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the social proof message according to the social proof category activated
    Given user has a module with the "<message_type>" social proof activated in the Explore content
      And the card within the module with more clicks do not have "timer;tag" enabled
     When searches the "module"
     Then the card with more clicks has the "social_proof_textfield" field with "<social_proof_message>" text

    Examples:
          | product | message_type   | social_proof_message                       | cv     | jira_id      |
          | vivobr  | most_popular   | [LANG:explore.social_proof.most_popular]   | 13.6   | QANOV-241156 |
          | vivobr  | most_viewed    | [LANG:explore.social_proof.most_viewed]    | 13.6   | QANOV-241157 |
          | vivobr  | mais_deseada   | [LANG:explore.social_proof.mais_deseada]   | 13.6   | QANOV-241158 |
          | vivobr  | mais_deseado   | [LANG:explore.social_proof.mais_deseado]   | 13.6   | QANOV-241159 |
          | vivobr  | queridinha_app | [LANG:explore.social_proof.queridinha_app] | 13.6   | QANOV-241160 |
          | vivobr  | queridinho_app | [LANG:explore.social_proof.queridinho_app] | 13.6   | QANOV-241161 |
          | moves   | most_popular   | [LANG:explore.social_proof.most_popular]   | 13.6   | QANOV-241162 |
          | moves   | most_viewed    | [LANG:explore.social_proof.most_viewed]    | 13.6   | QANOV-241163 |
          | moves   | best_seller    | [LANG:explore.social_proof.best_seller]    | 13.6   | QANOV-241164 |
          | o2uk    | most_popular   | [LANG:explore.social_proof.most_popular]   | 13.6   | QANOV-241165 |
          | o2uk    | most_viewed    | [LANG:explore.social_proof.most_viewed]    | 13.6   | QANOV-241166 |
          | o2uk    | best_seller    | [LANG:explore.social_proof.best_seller]    | 13.6   | QANOV-241167 |
          | blaude  | most_popular   | [LANG:explore.social_proof.most_popular]   | Future | QANOV-257965 |
          | blaude  | most_viewed    | [LANG:explore.social_proof.most_viewed]    | Future | QANOV-257966 |
          | blaude  | best_seller    | [LANG:explore.social_proof.best_seller]    | Future | QANOV-257967 |
          | o2de    | most_popular   | [LANG:explore.social_proof.most_popular]   | Future | QANOV-241168 |
          | o2de    | most_viewed    | [LANG:explore.social_proof.most_viewed]    | Future | QANOV-241169 |
          | o2de    | best_seller    | [LANG:explore.social_proof.best_seller]    | Future | QANOV-241170 |
          | o2es    | most_popular   | [LANG:explore.social_proof.most_popular]   | Future | QANOV-417772 |
          | o2es    | most_viewed    | [LANG:explore.social_proof.most_viewed]    | Future | QANOV-417773 |
          | o2es    | best_seller    | [LANG:explore.social_proof.best_seller]    | Future | QANOV-417774 |

  @jira.QANOV-241183 @android @automation.hard @ios @jira @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: User won't see the social proof message in a PEGA offer card
    Currently the Social Proof and PEGA feedbacks can'T work simultaneously, so PEGA cards won't send the clicks,
    therefore this scenario is out-of-scope at the moment.
    Given user has a "featured content" module with the social proof activated in the Explore content
      And the module includes a PEGA offer card
      And the card within the module with more clicks is the PEGA card
     When searches the "module"
     Then the PEGA card does not have the "social_proof_textfield" field displayed
      And the PEGA card does not have the "social_proof_icon" field displayed
