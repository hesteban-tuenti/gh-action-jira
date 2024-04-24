# -*- coding: utf-8 -*-
@jira.QANOV-441383
Feature: Aspect ratio

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User will see the image included in the <module_type> with the <ratio> aspect ratio
    To execute this scenario automatically a category (QACategory) with a segment has been created in the QA environment CMS
    Given a "<module_type>" has been created with a "<ratio>" aspect ratio
     When searches the "module"
     Then the selected explore "module" has the "image" field with the "<ratio>" aspect ratio

    @smoke
    Examples:
          | product | module_type      | ratio | cv   | jira_id      |
          | vivobr  | featured content | 16:9  | 14.8 | QANOV-441384 |
          | moves   | vertical cards   | 4:3   | 14.8 | QANOV-441385 |
          | o2uk    | display cards    | 9:10  | 14.8 | QANOV-441386 |
          | blaude  | poster cards     | 1:1   | 14.8 | QANOV-441387 |
          | o2de    | naked cards      | 4:3   | 14.8 | QANOV-441388 |

    @regression
    Examples:
          | product | module_type      | ratio | cv     | jira_id      |
          | vivobr  | featured content | 4:3   | 14.8   | QANOV-441389 |
          | vivobr  | featured content | 1:1   | 14.8   | QANOV-441390 |
          | vivobr  | vertical cards   | 16:9  | 14.8   | QANOV-441391 |
          | vivobr  | vertical cards   | 4:3   | 14.8   | QANOV-441392 |
          | vivobr  | vertical cards   | 1:1   | 14.8   | QANOV-441393 |
          | vivobr  | display cards    | 7:10  | 14.8   | QANOV-441394 |
          | vivobr  | display cards    | 9:10  | 14.8   | QANOV-441395 |
          | vivobr  | display cards    | 16:9  | 14.8   | QANOV-441396 |
          | vivobr  | display cards    | 1:1   | 14.8   | QANOV-441397 |
          | vivobr  | poster cards     | 7:10  | 14.8   | QANOV-441398 |
          | vivobr  | poster cards     | 9:10  | 14.8   | QANOV-441399 |
          | vivobr  | poster cards     | 16:9  | 14.8   | QANOV-441401 |
          | vivobr  | poster cards     | 1:1   | 14.8   | QANOV-441402 |
          | vivobr  | naked cards      | 16:9  | 14.8   | QANOV-441403 |
          | vivobr  | naked cards      | 4:3   | 14.8   | QANOV-441404 |
          | vivobr  | naked cards      | 1:1   | 14.8   | QANOV-441405 |
          | moves   | featured content | 16:9  | 14.8   | QANOV-441406 |
          | moves   | featured content | 4:3   | 14.8   | QANOV-441407 |
          | moves   | featured content | 1:1   | 14.8   | QANOV-441408 |
          | moves   | vertical cards   | 16:9  | 14.8   | QANOV-441409 |
          | moves   | vertical cards   | 1:1   | 14.8   | QANOV-441410 |
          | moves   | display cards    | 7:10  | 14.8   | QANOV-441411 |
          | moves   | display cards    | 9:10  | 14.8   | QANOV-441412 |
          | moves   | display cards    | 16:9  | 14.8   | QANOV-441413 |
          | moves   | display cards    | 1:1   | 14.8   | QANOV-441414 |
          | moves   | poster cards     | 7:10  | 14.8   | QANOV-441415 |
          | moves   | poster cards     | 9:10  | 14.8   | QANOV-441416 |
          | moves   | poster cards     | 16:9  | 14.8   | QANOV-441417 |
          | moves   | poster cards     | 1:1   | 14.8   | QANOV-441418 |
          | moves   | naked cards      | 16:9  | 14.8   | QANOV-441419 |
          | moves   | naked cards      | 4:3   | 14.8   | QANOV-441420 |
          | moves   | naked cards      | 1:1   | 14.8   | QANOV-441421 |
          | o2uk    | featured content | 16:9  | 14.8   | QANOV-441422 |
          | o2uk    | featured content | 4:3   | 14.8   | QANOV-441423 |
          | o2uk    | featured content | 1:1   | 14.8   | QANOV-441424 |
          | o2uk    | vertical cards   | 16:9  | 14.8   | QANOV-441425 |
          | o2uk    | vertical cards   | 4:3   | 14.8   | QANOV-441426 |
          | o2uk    | vertical cards   | 1:1   | 14.8   | QANOV-441427 |
          | o2uk    | display cards    | 7:10  | 14.8   | QANOV-441428 |
          | o2uk    | display cards    | 16:9  | 14.8   | QANOV-441429 |
          | o2uk    | display cards    | 1:1   | 14.8   | QANOV-441430 |
          | o2uk    | poster cards     | 7:10  | 14.8   | QANOV-441431 |
          | o2uk    | poster cards     | 9:10  | 14.8   | QANOV-441432 |
          | o2uk    | poster cards     | 16:9  | 14.8   | QANOV-441433 |
          | o2uk    | poster cards     | 1:1   | 14.8   | QANOV-441435 |
          | o2uk    | naked cards      | 16:9  | 14.8   | QANOV-441436 |
          | o2uk    | naked cards      | 4:3   | 14.8   | QANOV-441437 |
          | o2uk    | naked cards      | 1:1   | 14.8   | QANOV-441438 |
          | blaude  | featured content | 16:9  | 14.8   | QANOV-441439 |
          | blaude  | featured content | 4:3   | 14.8   | QANOV-441440 |
          | blaude  | featured content | 1:1   | 14.8   | QANOV-441441 |
          | blaude  | vertical cards   | 16:9  | 14.8   | QANOV-441442 |
          | blaude  | vertical cards   | 4:3   | 14.8   | QANOV-441443 |
          | blaude  | vertical cards   | 1:1   | 14.8   | QANOV-441444 |
          | blaude  | display cards    | 7:10  | 14.8   | QANOV-441445 |
          | blaude  | display cards    | 9:10  | 14.8   | QANOV-441446 |
          | blaude  | display cards    | 16:9  | 14.8   | QANOV-441447 |
          | blaude  | display cards    | 1:1   | 14.8   | QANOV-441448 |
          | blaude  | poster cards     | 7:10  | 14.8   | QANOV-441449 |
          | blaude  | poster cards     | 9:10  | 14.8   | QANOV-441450 |
          | blaude  | poster cards     | 16:9  | 14.8   | QANOV-441451 |
          | blaude  | naked cards      | 16:9  | 14.8   | QANOV-441452 |
          | blaude  | naked cards      | 4:3   | 14.8   | QANOV-441453 |
          | blaude  | naked cards      | 1:1   | 14.8   | QANOV-441454 |
          | o2de    | featured content | 16:9  | 14.8   | QANOV-441455 |
          | o2de    | featured content | 4:3   | 14.8   | QANOV-441456 |
          | o2de    | featured content | 1:1   | 14.8   | QANOV-441457 |
          | o2de    | vertical cards   | 16:9  | 14.8   | QANOV-441458 |
          | o2de    | vertical cards   | 4:3   | 14.8   | QANOV-441459 |
          | o2de    | vertical cards   | 1:1   | 14.8   | QANOV-441460 |
          | o2de    | display cards    | 7:10  | 14.8   | QANOV-441461 |
          | o2de    | display cards    | 9:10  | 14.8   | QANOV-441462 |
          | o2de    | display cards    | 16:9  | 14.8   | QANOV-441463 |
          | o2de    | display cards    | 1:1   | 14.8   | QANOV-441464 |
          | o2de    | poster cards     | 7:10  | 14.8   | QANOV-441465 |
          | o2de    | poster cards     | 9:10  | 14.8   | QANOV-441466 |
          | o2de    | poster cards     | 16:9  | 14.8   | QANOV-441467 |
          | o2de    | poster cards     | 1:1   | 14.8   | QANOV-441468 |
          | o2de    | naked cards      | 16:9  | 14.8   | QANOV-441470 |
          | o2de    | naked cards      | 1:1   | 14.8   | QANOV-441471 |
          | o2es    | featured content | 16:9  | Future | QANOV-441472 |
          | o2es    | featured content | 4:3   | Future | QANOV-441473 |
          | o2es    | featured content | 1:1   | Future | QANOV-441474 |
          | o2es    | vertical cards   | 16:9  | Future | QANOV-441475 |
          | o2es    | vertical cards   | 4:3   | Future | QANOV-441476 |
          | o2es    | vertical cards   | 1:1   | Future | QANOV-441477 |
          | o2es    | display cards    | 7:10  | Future | QANOV-441478 |
          | o2es    | display cards    | 9:10  | Future | QANOV-441479 |
          | o2es    | display cards    | 16:9  | Future | QANOV-441480 |
          | o2es    | display cards    | 1:1   | Future | QANOV-441481 |
          | o2es    | poster cards     | 7:10  | Future | QANOV-441482 |
          | o2es    | poster cards     | 9:10  | Future | QANOV-441483 |
          | o2es    | poster cards     | 16:9  | Future | QANOV-441484 |
          | o2es    | poster cards     | 1:1   | Future | QANOV-441485 |
          | o2es    | naked cards      | 16:9  | Future | QANOV-441486 |
          | o2es    | naked cards      | 1:1   | Future | QANOV-441487 |
