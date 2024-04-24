# -*- coding: utf-8 -*-
@jira.QANOV-417306
Feature: Bottom link

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<priority> @<product> @android @ios @jira.cv.<cv> @manual @mobile
  Scenario Outline: A bottom link can be shown in a <module_type> module
    Given user has a "<module_type>" module with a "bottom" link in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "bottom_link" field displayed

    Examples:
          | product | module_type         | priority   | cv     | jira_id      |
          | vivobr  | featured content    | sanity     | 14.8   | QANOV-417307 |
          | vivobr  | vertical cards      | smoke      | 14.8   | QANOV-417308 |
          | vivobr  | rows                | smoke      | 14.8   | QANOV-417309 |
          | vivobr  | display cards       | smoke      | 14.8   | QANOV-417310 |
          | vivobr  | data cards          | regression | 14.8   | QANOV-417311 |
          | vivobr  | highlighted cards   | regression | 14.8   | QANOV-417312 |
          | vivobr  | data cards advanced | regression | 14.8   | QANOV-417314 |
          | vivobr  | naked cards         | regression | 14.8   | QANOV-417315 |
          | vivobr  | poster cards        | regression | 14.8   | QANOV-417313 |
          | vivobr  | naked small cards   | regression | 14.8   | QANOV-417317 |
          | o2uk    | featured content    | sanity     | 14.8   | QANOV-417318 |
          | o2uk    | vertical cards      | smoke      | 14.8   | QANOV-417319 |
          | o2uk    | rows                | smoke      | 14.8   | QANOV-417320 |
          | o2uk    | display cards       | smoke      | 14.8   | QANOV-417321 |
          | o2uk    | data cards          | regression | 14.8   | QANOV-417322 |
          | o2uk    | highlighted cards   | regression | 14.8   | QANOV-417323 |
          | o2uk    | poster cards        | regression | 14.8   | QANOV-417324 |
          | o2uk    | naked cards         | regression | 14.8   | QANOV-417326 |
          | o2uk    | naked small cards   | regression | 14.8   | QANOV-417328 |
          | moves   | featured content    | sanity     | 14.8   | QANOV-417329 |
          | moves   | vertical cards      | smoke      | 14.8   | QANOV-417330 |
          | moves   | rows                | smoke      | 14.8   | QANOV-417331 |
          | moves   | data cards          | smoke      | 14.8   | QANOV-417332 |
          | moves   | highlighted cards   | smoke      | 14.8   | QANOV-417333 |
          | moves   | display cards       | regression | 14.8   | QANOV-417334 |
          | moves   | poster cards        | regression | 14.8   | QANOV-417335 |
          | moves   | naked cards         | regression | 14.8   | QANOV-417337 |
          | moves   | naked small cards   | regression | 14.8   | QANOV-417339 |
          | blaude  | featured content    | sanity     | 14.8   | QANOV-417340 |
          | blaude  | vertical cards      | smoke      | 14.8   | QANOV-417341 |
          | blaude  | rows                | smoke      | 14.8   | QANOV-417342 |
          | blaude  | display cards       | smoke      | 14.8   | QANOV-417343 |
          | blaude  | data cards          | regression | 14.8   | QANOV-417344 |
          | blaude  | highlighted cards   | regression | 14.8   | QANOV-417345 |
          | blaude  | poster cards        | regression | 14.8   | QANOV-417346 |
          | blaude  | naked cards         | regression | 14.8   | QANOV-417348 |
          | blaude  | naked small cards   | regression | 14.8   | QANOV-417350 |
          | o2de    | featured content    | sanity     | 14.8   | QANOV-417351 |
          | o2de    | vertical cards      | smoke      | 14.8   | QANOV-417352 |
          | o2de    | rows                | smoke      | 14.8   | QANOV-417353 |
          | o2de    | display cards       | smoke      | 14.8   | QANOV-417354 |
          | o2de    | data cards          | regression | 14.8   | QANOV-417355 |
          | o2de    | highlighted cards   | regression | 14.8   | QANOV-417356 |
          | o2de    | poster cards        | regression | 14.8   | QANOV-417357 |
          | o2de    | naked cards         | regression | 14.8   | QANOV-417359 |
          | o2de    | naked small cards   | regression | 14.8   | QANOV-417361 |
          | o2es    | featured content    | sanity     | Future | QANOV-441488 |
          | o2es    | vertical cards      | regression | Future | QANOV-441489 |
          | o2es    | rows                | regression | Future | QANOV-441490 |
          | o2es    | display cards       | regression | Future | QANOV-441492 |
          | o2es    | data cards          | regression | Future | QANOV-441493 |
          | o2es    | highlighted cards   | regression | Future | QANOV-441494 |
          | o2es    | poster cards        | regression | Future | QANOV-441495 |
          | o2es    | naked cards         | regression | Future | QANOV-441497 |
          | o2es    | naked small cards   | regression | Future | QANOV-441499 |

  @jira.<jira_id> @<priority> @<product> @android @ios @jira.cv.<cv> @manual @mobile
  Scenario Outline: User can access to the bottom link in a <module_type> module
    Given user has a "<module_type>" module with a "bottom" link in the Explore content
     When searches the "module"
      And clicks on the "bottom_link" field in the explore "module"
     Then the Explore module link is opened
      And the Explore module link is closed
      And the "[CONTEXT:explore_page]" page is displayed

    Examples:
          | product | module_type         | priority   | cv     | jira_id      |
          | vivobr  | featured content    | smoke      | 14.8   | QANOV-417362 |
          | vivobr  | vertical cards      | smoke      | 14.8   | QANOV-417363 |
          | vivobr  | rows                | smoke      | 14.8   | QANOV-417364 |
          | vivobr  | display cards       | regression | 14.8   | QANOV-417365 |
          | vivobr  | data cards          | regression | 14.8   | QANOV-417366 |
          | vivobr  | highlighted cards   | regression | 14.8   | QANOV-417367 |
          | vivobr  | data cards advanced | regression | 14.8   | QANOV-417369 |
          | vivobr  | naked cards         | regression | 14.8   | QANOV-417370 |
          | vivobr  | poster cards        | regression | 14.8   | QANOV-417368 |
          | vivobr  | naked small cards   | regression | 14.8   | QANOV-417372 |
          | o2uk    | featured content    | smoke      | 14.8   | QANOV-417373 |
          | o2uk    | vertical cards      | smoke      | 14.8   | QANOV-417374 |
          | o2uk    | rows                | smoke      | 14.8   | QANOV-417375 |
          | o2uk    | display cards       | regression | 14.8   | QANOV-417376 |
          | o2uk    | data cards          | regression | 14.8   | QANOV-417377 |
          | o2uk    | highlighted cards   | regression | 14.8   | QANOV-417378 |
          | o2uk    | poster cards        | regression | 14.8   | QANOV-417379 |
          | o2uk    | naked cards         | regression | 14.8   | QANOV-417381 |
          | o2uk    | naked small cards   | regression | 14.8   | QANOV-417383 |
          | moves   | featured content    | smoke      | 14.8   | QANOV-417384 |
          | moves   | vertical cards      | smoke      | 14.8   | QANOV-417385 |
          | moves   | rows                | smoke      | 14.8   | QANOV-417386 |
          | moves   | display cards       | regression | 14.8   | QANOV-417387 |
          | moves   | data cards          | regression | 14.8   | QANOV-417388 |
          | moves   | highlighted cards   | regression | 14.8   | QANOV-417389 |
          | moves   | poster cards        | regression | 14.8   | QANOV-417390 |
          | moves   | naked cards         | regression | 14.8   | QANOV-417392 |
          | moves   | naked small cards   | regression | 14.8   | QANOV-417394 |
          | blaude  | featured content    | smoke      | 14.8   | QANOV-417395 |
          | blaude  | vertical cards      | smoke      | 14.8   | QANOV-417396 |
          | blaude  | rows                | smoke      | 14.8   | QANOV-417397 |
          | blaude  | display cards       | regression | 14.8   | QANOV-417398 |
          | blaude  | data cards          | regression | 14.8   | QANOV-417399 |
          | blaude  | highlighted cards   | regression | 14.8   | QANOV-417400 |
          | blaude  | poster cards        | regression | 14.8   | QANOV-417401 |
          | blaude  | naked cards         | regression | 14.8   | QANOV-417403 |
          | blaude  | naked small cards   | regression | 14.8   | QANOV-417405 |
          | o2de    | featured content    | smoke      | 14.8   | QANOV-417406 |
          | o2de    | vertical cards      | smoke      | 14.8   | QANOV-417407 |
          | o2de    | rows                | smoke      | 14.8   | QANOV-417408 |
          | o2de    | display cards       | regression | 14.8   | QANOV-417409 |
          | o2de    | data cards          | regression | 14.8   | QANOV-417410 |
          | o2de    | highlighted cards   | regression | 14.8   | QANOV-417411 |
          | o2de    | poster cards        | regression | 14.8   | QANOV-417412 |
          | o2de    | naked cards         | regression | 14.8   | QANOV-417414 |
          | o2de    | naked small cards   | regression | 14.8   | QANOV-417416 |
          | o2es    | featured content    | smoke      | Future | QANOV-441501 |
          | o2es    | vertical cards      | regression | Future | QANOV-441502 |
          | o2es    | rows                | regression | Future | QANOV-441503 |
          | o2es    | display cards       | regression | Future | QANOV-441504 |
          | o2es    | data cards          | regression | Future | QANOV-441505 |
          | o2es    | highlighted cards   | regression | Future | QANOV-441506 |
          | o2es    | poster cards        | regression | Future | QANOV-441507 |
          | o2es    | naked cards         | regression | Future | QANOV-441509 |
          | o2es    | naked small cards   | regression | Future | QANOV-441511 |
