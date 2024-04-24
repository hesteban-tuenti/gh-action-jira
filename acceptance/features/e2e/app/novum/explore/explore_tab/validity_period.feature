# -*- coding: utf-8 -*-
@jira.QANOV-10793
Feature: Validity period

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<exec_mode> @<priority> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-91910 @mobile
  @webapp
  Scenario Outline: User can see an explore "<module>" card which validity period is not expired
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Banners dont have any information that we can use to locate them through the UI. We are keeping them
    in this scenario to have it organized, but have in mind that the title and description don't apply
    to banners.
    Given user has a card configured with a not expired validity period in a "<module>" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @live @next @qa
    Examples:
          | product | module              | cv   | exec_mode | priority   | jira_id      |
          | vivobr  | featured content    | 13.3 | automatic | smoke      | QANOV-10906  |
          | vivobr  | banner              | 13.3 | manual    | regression | QANOV-10908  |
          | vivobr  | vertical cards      | 13.3 | automatic | regression | QANOV-10910  |
          | vivobr  | rows                | 13.3 | automatic | regression | QANOV-10912  |
          | vivobr  | banner hero         | 14.3 | manual    | regression | QANOV-355373 |
          | vivobr  | highlighted cards   | 14.3 | automatic | regression | QANOV-525261 |
          | vivobr  | data cards          | 14.3 | manual    | regression | QANOV-355374 |
          | vivobr  | display cards       | 14.3 | automatic | regression | QANOV-355375 |
          | vivobr  | naked cards         | 14.8 | manual    | regression | QANOV-448554 |
          | vivobr  | naked small cards   | 14.8 | manual    | regression | QANOV-448555 |
          | vivobr  | poster cards        | 14.8 | manual    | regression | QANOV-441096 |
          | vivobr  | data cards advanced | 14.8 | manual    | regression | QANOV-441097 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | priority   | jira_id      |
          | o2uk    | featured content  | 13.3 | automatic | smoke      | QANOV-10914  |
          | o2uk    | banner            | 13.3 | manual    | regression | QANOV-10916  |
          | o2uk    | vertical cards    | 13.3 | automatic | regression | QANOV-10918  |
          | o2uk    | rows              | 13.3 | automatic | regression | QANOV-10920  |
          | o2uk    | banner hero       | 14.3 | manual    | regression | QANOV-355376 |
          | o2uk    | highlighted cards | 14.3 | automatic | regression | QANOV-525264 |
          | o2uk    | data cards        | 14.3 | manual    | regression | QANOV-355377 |
          | o2uk    | display cards     | 14.3 | automatic | regression | QANOV-355378 |
          | o2uk    | naked cards       | 14.8 | manual    | regression | QANOV-448556 |
          | o2uk    | naked small cards | 14.8 | manual    | regression | QANOV-448557 |
          | o2uk    | poster cards      | 14.8 | manual    | regression | QANOV-441098 |

    @cert2 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | priority   | jira_id      |
          | moves   | featured content  | 13.3 | automatic | smoke      | QANOV-10922  |
          | moves   | banner            | 13.3 | manual    | regression | QANOV-10923  |
          | moves   | vertical cards    | 13.3 | automatic | regression | QANOV-10926  |
          | moves   | rows              | 13.3 | automatic | regression | QANOV-10927  |
          | moves   | banner hero       | 14.3 | manual    | regression | QANOV-355379 |
          | moves   | highlighted cards | 14.3 | automatic | regression | QANOV-525265 |
          | moves   | data cards        | 14.3 | manual    | regression | QANOV-355380 |
          | moves   | display cards     | 14.3 | automatic | regression | QANOV-355381 |
          | moves   | naked cards       | 14.8 | manual    | regression | QANOV-448558 |
          | moves   | naked small cards | 14.8 | manual    | regression | QANOV-448559 |
          | moves   | poster cards      | 14.8 | manual    | regression | QANOV-441100 |

    @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | module           | cv   | exec_mode | priority | jira_id      |
          | blaude  | featured content | 13.9 | automatic | smoke    | QANOV-228278 |

    @cert3 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | priority   | jira_id      |
          | blaude  | banner            | 13.9 | manual    | regression | QANOV-228279 |
          | blaude  | vertical cards    | 13.9 | automatic | regression | QANOV-228280 |
          | blaude  | rows              | 13.9 | automatic | regression | QANOV-228281 |
          | blaude  | banner hero       | 14.3 | manual    | regression | QANOV-355382 |
          | blaude  | highlighted cards | 14.3 | automatic | regression | QANOV-525267 |
          | blaude  | data cards        | 14.3 | manual    | regression | QANOV-355383 |
          | blaude  | display cards     | 14.3 | automatic | regression | QANOV-355384 |
          | blaude  | naked cards       | 14.8 | manual    | regression | QANOV-448560 |
          | blaude  | naked small cards | 14.8 | manual    | regression | QANOV-448561 |
          | blaude  | poster cards      | 14.8 | manual    | regression | QANOV-441102 |

    Examples:
          | product | module            | cv     | exec_mode | priority   | jira_id      |
          | o2de    | featured content  | 14.2   | manual    | smoke      | QANOV-49106  |
          | o2de    | banner            | 14.2   | manual    | regression | QANOV-49107  |
          | o2de    | vertical cards    | 14.2   | manual    | regression | QANOV-49108  |
          | o2de    | rows              | 14.2   | manual    | regression | QANOV-49109  |
          | o2de    | banner hero       | 14.3   | manual    | regression | QANOV-355385 |
          | o2de    | highlighted cards | 14.3   | manual    | regression | QANOV-525269 |
          | o2de    | data cards        | 14.3   | manual    | regression | QANOV-355386 |
          | o2de    | display cards     | 14.3   | manual    | regression | QANOV-355387 |
          | o2de    | naked cards       | 14.8   | manual    | regression | QANOV-448562 |
          | o2de    | naked small cards | 14.8   | manual    | regression | QANOV-448563 |
          | o2de    | poster cards      | 14.8   | manual    | regression | QANOV-441104 |
          | o2es    | featured content  | Future | manual    | smoke      | QANOV-417632 |
          | o2es    | banner            | Future | manual    | regression | QANOV-417633 |
          | o2es    | vertical cards    | Future | manual    | regression | QANOV-417634 |
          | o2es    | rows              | Future | manual    | regression | QANOV-417635 |
          | o2es    | banner hero       | Future | manual    | regression | QANOV-417636 |
          | o2es    | highlighted cards | Future | manual    | regression | QANOV-525270 |
          | o2es    | data cards        | Future | manual    | regression | QANOV-417637 |
          | o2es    | display cards     | Future | manual    | regression | QANOV-417638 |
          | o2es    | naked cards       | Future | manual    | regression | QANOV-448564 |
          | o2es    | naked small cards | Future | manual    | regression | QANOV-448565 |
          | o2es    | poster cards      | Future | manual    | regression | QANOV-441106 |

  @jira.<jira_id> @<exec_mode> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-201335 @mobile @regression
  @webapp
  Scenario Outline: User can not see the expiration date of a "<module>" card configured in CMS with a not expired and not displayed validity period
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Given user has a card configured with a not expired and not displayed validity period in a "<module>" module
     When searches the "card"
     Then the expiration date of that card is not displayed

    @live @next @qa
    Examples:
          | product | module              | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | 13.3 | automatic | QANOV-10929  |
          | vivobr  | vertical cards      | 13.3 | automatic | QANOV-10931  |
          | vivobr  | rows                | 13.3 | automatic | QANOV-10933  |
          | vivobr  | banner hero         | 14.3 | manual    | QANOV-355388 |
          | vivobr  | data cards          | 14.3 | manual    | QANOV-355389 |
          | vivobr  | display cards       | 14.3 | automatic | QANOV-355390 |
          | vivobr  | naked cards         | 14.8 | manual    | QANOV-448566 |
          | vivobr  | poster cards        | 14.8 | manual    | QANOV-441108 |
          | vivobr  | data cards advanced | 14.8 | manual    | QANOV-441109 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | o2uk    | featured content | 13.3 | automatic | QANOV-10935  |
          | o2uk    | vertical cards   | 13.3 | automatic | QANOV-10937  |
          | o2uk    | rows             | 13.3 | automatic | QANOV-10939  |
          | o2uk    | banner hero      | 14.3 | manual    | QANOV-355394 |
          | o2uk    | data cards       | 14.3 | manual    | QANOV-355395 |
          | o2uk    | display cards    | 14.3 | automatic | QANOV-355396 |
          | o2uk    | naked cards      | 14.8 | manual    | QANOV-448570 |
          | o2uk    | poster cards     | 14.8 | manual    | QANOV-441112 |

    @cert2 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | moves   | featured content | 13.3 | automatic | QANOV-10941  |
          | moves   | vertical cards   | 13.3 | automatic | QANOV-10943  |
          | moves   | rows             | 13.3 | automatic | QANOV-10945  |
          | moves   | banner hero      | 14.3 | manual    | QANOV-355400 |
          | moves   | data cards       | 14.3 | manual    | QANOV-355401 |
          | moves   | display cards    | 14.3 | automatic | QANOV-355402 |
          | moves   | naked cards      | 14.8 | manual    | QANOV-448574 |
          | moves   | poster cards     | 14.8 | manual    | QANOV-441116 |

    @cert3 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | blaude  | featured content | 13.9 | automatic | QANOV-228282 |
          | blaude  | vertical cards   | 13.9 | automatic | QANOV-228283 |
          | blaude  | rows             | 13.9 | automatic | QANOV-228284 |
          | blaude  | banner hero      | 14.3 | manual    | QANOV-355406 |
          | blaude  | data cards       | 14.3 | manual    | QANOV-355407 |
          | blaude  | display cards    | 14.3 | automatic | QANOV-355408 |
          | blaude  | naked cards      | 14.8 | manual    | QANOV-448578 |
          | blaude  | poster cards     | 14.8 | manual    | QANOV-441120 |

    Examples:
          | product | module           | cv     | exec_mode | jira_id      |
          | o2de    | featured content | 14.2   | manual    | QANOV-49110  |
          | o2de    | vertical cards   | 14.2   | manual    | QANOV-49111  |
          | o2de    | rows             | 14.2   | manual    | QANOV-49112  |
          | o2de    | banner hero      | 14.3   | manual    | QANOV-355412 |
          | o2de    | data cards       | 14.3   | manual    | QANOV-355413 |
          | o2de    | display cards    | 14.3   | manual    | QANOV-355414 |
          | o2de    | naked cards      | 14.8   | manual    | QANOV-448582 |
          | o2de    | poster cards     | 14.8   | manual    | QANOV-441124 |
          | o2es    | featured content | Future | manual    | QANOV-417639 |
          | o2es    | vertical cards   | Future | manual    | QANOV-417640 |
          | o2es    | rows             | Future | manual    | QANOV-417641 |
          | o2es    | banner hero      | Future | manual    | QANOV-417642 |
          | o2es    | data cards       | Future | manual    | QANOV-417643 |
          | o2es    | display cards    | Future | manual    | QANOV-417644 |
          | o2es    | naked cards      | Future | manual    | QANOV-448586 |
          | o2es    | poster cards     | Future | manual    | QANOV-441128 |

  @jira.<jira_id> @<exec_mode> @<priority> @<product> @android @ios @jira.<cv> @mobile @webapp
  Scenario Outline: User can see the expiration date of a "<module>" card
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Given user has a card configured with a not expired validity period being displayed in a "<module>" module
     When searches the "card"
     Then the expiration date of that card is displayed

    @live @next @qa
    Examples:
          | product | module              | priority   | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | smoke      | 13.3 | automatic | QANOV-98296  |
          | vivobr  | vertical cards      | regression | 13.3 | automatic | QANOV-98297  |
          | vivobr  | rows                | regression | 13.3 | automatic | QANOV-98298  |
          | vivobr  | banner hero         | regression | 14.3 | manual    | QANOV-355418 |
          | vivobr  | data cards          | regression | 14.3 | manual    | QANOV-355419 |
          | vivobr  | display cards       | regression | 14.3 | automatic | QANOV-355420 |
          | vivobr  | poster cards        | regression | 14.8 | manual    | QANOV-441132 |
          | vivobr  | data cards advanced | regression | 14.8 | manual    | QANOV-441133 |
          | vivobr  | naked cards         | regression | 14.8 | manual    | QANOV-448590 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | o2uk    | featured content | smoke      | 13.3 | automatic | QANOV-98302  |
          | o2uk    | vertical cards   | regression | 13.3 | automatic | QANOV-98303  |
          | o2uk    | rows             | regression | 13.3 | automatic | QANOV-98304  |
          | o2uk    | banner hero      | regression | 14.3 | manual    | QANOV-355424 |
          | o2uk    | data cards       | regression | 14.3 | manual    | QANOV-355425 |
          | o2uk    | display cards    | regression | 14.3 | automatic | QANOV-355426 |
          | o2uk    | naked cards      | regression | 14.8 | manual    | QANOV-448594 |
          | o2uk    | poster cards     | regression | 14.8 | manual    | QANOV-441136 |

    @cert2 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | moves   | featured content | smoke      | 13.3 | automatic | QANOV-98308  |
          | moves   | vertical cards   | regression | 13.3 | automatic | QANOV-98309  |
          | moves   | rows             | regression | 13.3 | automatic | QANOV-98310  |
          | moves   | banner hero      | regression | 14.3 | manual    | QANOV-355430 |
          | moves   | data cards       | regression | 14.3 | manual    | QANOV-355431 |
          | moves   | display cards    | regression | 14.3 | automatic | QANOV-355432 |
          | moves   | naked cards      | regression | 14.8 | manual    | QANOV-448598 |
          | moves   | poster cards     | regression | 14.8 | manual    | QANOV-441140 |

    @cert3 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | blaude  | featured content | smoke      | 13.9 | automatic | QANOV-228288 |
          | blaude  | vertical cards   | regression | 13.9 | automatic | QANOV-228289 |
          | blaude  | rows             | regression | 13.9 | automatic | QANOV-228290 |
          | blaude  | banner hero      | regression | 14.3 | manual    | QANOV-355436 |
          | blaude  | data cards       | regression | 14.3 | manual    | QANOV-355437 |
          | blaude  | display cards    | regression | 14.3 | automatic | QANOV-355438 |
          | blaude  | naked cards      | regression | 14.8 | manual    | QANOV-448602 |
          | blaude  | poster cards     | regression | 14.8 | manual    | QANOV-441144 |

    Examples:
          | product | module           | priority   | cv     | exec_mode | jira_id      |
          | o2de    | featured content | smoke      | 14.2   | manual    | QANOV-223826 |
          | o2de    | vertical cards   | regression | 14.2   | manual    | QANOV-223827 |
          | o2de    | rows             | regression | 14.2   | manual    | QANOV-223828 |
          | o2de    | banner hero      | regression | 14.3   | manual    | QANOV-355442 |
          | o2de    | data cards       | regression | 14.3   | manual    | QANOV-355443 |
          | o2de    | display cards    | regression | 14.3   | manual    | QANOV-355444 |
          | o2de    | naked cards      | regression | 14.8   | manual    | QANOV-448606 |
          | o2de    | poster cards     | regression | 14.8   | manual    | QANOV-441148 |
          | o2es    | featured content | smoke      | Future | manual    | QANOV-417651 |
          | o2es    | vertical cards   | regression | Future | manual    | QANOV-417652 |
          | o2es    | rows             | regression | Future | manual    | QANOV-417653 |
          | o2es    | banner hero      | regression | Future | manual    | QANOV-417654 |
          | o2es    | data cards       | regression | Future | manual    | QANOV-417655 |
          | o2es    | display cards    | regression | Future | manual    | QANOV-417656 |
          | o2es    | naked cards      | regression | Future | manual    | QANOV-448610 |
          | o2es    | poster cards     | regression | Future | manual    | QANOV-441152 |

  @jira.<jira_id> @<exec_mode> @<priority> @<product> @android @ios @jira.cv.<cv> @mobile @webapp
  Scenario Outline: User can see the expiration date of a "<module>" card with single timer and expiration set to today
    Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary
    Given user has a card configured with expiration date set to "today" in a "single" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.single.today]" format displayed

    @live @next @qa
    Examples:
          | product | module              | priority   | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | smoke      | 13.3 | automatic | QANOV-10947  |
          | vivobr  | vertical cards      | regression | 13.3 | automatic | QANOV-10949  |
          | vivobr  | rows                | regression | 13.3 | automatic | QANOV-10950  |
          | vivobr  | banner hero         | regression | 14.3 | manual    | QANOV-355448 |
          | vivobr  | data cards          | regression | 14.3 | manual    | QANOV-355449 |
          | vivobr  | display cards       | regression | 14.3 | automatic | QANOV-355450 |
          | vivobr  | poster cards        | regression | 14.8 | manual    | QANOV-441156 |
          | vivobr  | data cards advanced | regression | 14.8 | manual    | QANOV-441157 |
          | vivobr  | naked cards         | regression | 14.8 | manual    | QANOV-448614 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | o2uk    | featured content | smoke      | 13.3 | automatic | QANOV-10952  |
          | o2uk    | vertical cards   | regression | 13.3 | automatic | QANOV-10954  |
          | o2uk    | rows             | regression | 13.3 | automatic | QANOV-10955  |
          | o2uk    | banner hero      | regression | 14.3 | manual    | QANOV-355451 |
          | o2uk    | data cards       | regression | 14.3 | manual    | QANOV-355452 |
          | o2uk    | display cards    | regression | 14.3 | automatic | QANOV-355453 |
          | o2uk    | naked cards      | regression | 14.8 | manual    | QANOV-448615 |
          | o2uk    | poster cards     | regression | 14.8 | manual    | QANOV-441158 |

    @cert2 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | moves   | featured content | smoke      | 13.3 | automatic | QANOV-10957  |
          | moves   | vertical cards   | regression | 13.3 | automatic | QANOV-10959  |
          | moves   | rows             | regression | 13.3 | automatic | QANOV-10960  |
          | moves   | banner hero      | regression | 14.3 | manual    | QANOV-355454 |
          | moves   | data cards       | regression | 14.3 | manual    | QANOV-355455 |
          | moves   | display cards    | regression | 14.3 | automatic | QANOV-355456 |
          | moves   | naked cards      | regression | 14.8 | manual    | QANOV-448616 |
          | moves   | poster cards     | regression | 14.8 | manual    | QANOV-441160 |

    @cert3 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | blaude  | featured content | smoke      | 13.9 | automatic | QANOV-228294 |
          | blaude  | vertical cards   | regression | 13.9 | automatic | QANOV-228295 |
          | blaude  | rows             | regression | 13.9 | automatic | QANOV-228296 |
          | blaude  | banner hero      | regression | 14.3 | manual    | QANOV-355457 |
          | blaude  | data cards       | regression | 14.3 | manual    | QANOV-355458 |
          | blaude  | display cards    | regression | 14.3 | automatic | QANOV-355459 |
          | blaude  | naked cards      | regression | 14.8 | manual    | QANOV-448617 |
          | blaude  | poster cards     | regression | 14.8 | manual    | QANOV-441162 |

    Examples:
          | product | module           | priority   | cv     | exec_mode | jira_id      |
          | o2de    | featured content | smoke      | 14.2   | manual    | QANOV-49113  |
          | o2de    | vertical cards   | regression | 14.2   | manual    | QANOV-49114  |
          | o2de    | rows             | regression | 14.2   | manual    | QANOV-49115  |
          | o2de    | banner hero      | regression | 14.3   | manual    | QANOV-355460 |
          | o2de    | data cards       | regression | 14.3   | manual    | QANOV-355461 |
          | o2de    | display cards    | regression | 14.3   | manual    | QANOV-355462 |
          | o2de    | naked cards      | regression | 14.8   | manual    | QANOV-448618 |
          | o2de    | poster cards     | regression | 14.8   | manual    | QANOV-441164 |
          | o2es    | featured content | smoke      | Future | manual    | QANOV-417663 |
          | o2es    | vertical cards   | regression | Future | manual    | QANOV-417664 |
          | o2es    | rows             | regression | Future | manual    | QANOV-417665 |
          | o2es    | banner hero      | regression | Future | manual    | QANOV-417666 |
          | o2es    | data cards       | regression | Future | manual    | QANOV-417667 |
          | o2es    | display cards    | regression | Future | manual    | QANOV-417668 |
          | o2es    | naked cards      | regression | Future | manual    | QANOV-448619 |
          | o2es    | poster cards     | regression | Future | manual    | QANOV-441166 |

  @jira.<jira_id> @<exec_mode> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-136853 @mobile @regression
  @webapp
  Scenario Outline: User can see the expiration date of a "<module>" card with single timer and expiration set to tomorrow
    Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary
    Given user has a card configured with expiration date set to "tomorrow" in a "single" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.single.tomorrow]" format displayed

    @live @next @qa
    Examples:
          | product | module              | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | 13.3 | automatic | QANOV-10962  |
          | vivobr  | vertical cards      | 13.3 | automatic | QANOV-10964  |
          | vivobr  | rows                | 13.3 | automatic | QANOV-10966  |
          | vivobr  | banner hero         | 14.3 | manual    | QANOV-355463 |
          | vivobr  | data cards          | 14.3 | manual    | QANOV-355464 |
          | vivobr  | poster cards        | 14.8 | manual    | QANOV-441168 |
          | vivobr  | data cards advanced | 14.8 | manual    | QANOV-441169 |
          | vivobr  | naked cards         | 14.8 | manual    | QANOV-448620 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | o2uk    | featured content | 13.3 | automatic | QANOV-10968  |
          | o2uk    | vertical cards   | 13.3 | automatic | QANOV-10970  |
          | o2uk    | rows             | 13.3 | automatic | QANOV-10972  |
          | o2uk    | banner hero      | 14.3 | manual    | QANOV-355466 |
          | o2uk    | data cards       | 14.3 | manual    | QANOV-355467 |
          | o2uk    | naked cards      | 14.8 | manual    | QANOV-448621 |
          | o2uk    | poster cards     | 14.8 | manual    | QANOV-441170 |

    @cert2 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | moves   | featured content | 13.3 | automatic | QANOV-10974  |
          | moves   | vertical cards   | 13.3 | automatic | QANOV-10976  |
          | moves   | rows             | 13.3 | automatic | QANOV-10978  |
          | moves   | banner hero      | 14.3 | manual    | QANOV-355469 |
          | moves   | data cards       | 14.3 | manual    | QANOV-355470 |
          | moves   | naked cards      | 14.8 | manual    | QANOV-448622 |
          | moves   | poster cards     | 14.8 | manual    | QANOV-441172 |

    @cert3 @live @next @qa
    Examples:
          | product | module           | cv   | exec_mode | jira_id      |
          | blaude  | featured content | 13.9 | automatic | QANOV-228297 |
          | blaude  | vertical cards   | 13.9 | automatic | QANOV-228298 |
          | blaude  | rows             | 13.9 | automatic | QANOV-228299 |
          | blaude  | banner hero      | 14.3 | manual    | QANOV-355472 |
          | blaude  | data cards       | 14.3 | manual    | QANOV-355473 |
          | blaude  | naked cards      | 14.8 | manual    | QANOV-448623 |
          | blaude  | poster cards     | 14.8 | manual    | QANOV-441174 |

    Examples:
          | product | module           | cv     | exec_mode | jira_id      |
          | o2de    | featured content | 14.2   | manual    | QANOV-49119  |
          | o2de    | vertical cards   | 14.2   | manual    | QANOV-49120  |
          | o2de    | rows             | 14.2   | manual    | QANOV-49121  |
          | o2de    | banner hero      | 14.3   | manual    | QANOV-355475 |
          | o2de    | data cards       | 14.3   | manual    | QANOV-355476 |
          | o2de    | naked cards      | 14.8   | manual    | QANOV-448624 |
          | o2de    | poster cards     | 14.8   | manual    | QANOV-441176 |
          | o2es    | featured content | Future | manual    | QANOV-417669 |
          | o2es    | vertical cards   | Future | manual    | QANOV-417670 |
          | o2es    | rows             | Future | manual    | QANOV-417671 |
          | o2es    | banner hero      | Future | manual    | QANOV-417672 |
          | o2es    | data cards       | Future | manual    | QANOV-417673 |
          | o2es    | naked cards      | Future | manual    | QANOV-448625 |
          | o2es    | poster cards     | Future | manual    | QANOV-441178 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-202245 @manual @mobile @regression
  @webapp
  Scenario Outline: User can see the expiration date of a "<module>" card with single timer and expiration set to more than two days
    Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary
    Given user has a card configured with expiration date set to "in more than two days" in a "single" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.single.after_tomorrow]" format displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-10980  |
          | vivobr  | vertical cards      | 13.3   | QANOV-10982  |
          | vivobr  | rows                | 13.3   | QANOV-10984  |
          | vivobr  | banner hero         | 14.3   | QANOV-355478 |
          | vivobr  | data cards          | 14.3   | QANOV-355479 |
          | vivobr  | display cards       | 14.3   | QANOV-355480 |
          | vivobr  | poster_cards        | 14.8   | QANOV-441180 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441181 |
          | vivobr  | naked cards         | 14.8   | QANOV-448626 |
          | o2uk    | featured content    | 13.3   | QANOV-10986  |
          | o2uk    | vertical cards      | 13.3   | QANOV-10988  |
          | o2uk    | rows                | 13.3   | QANOV-10990  |
          | o2uk    | banner hero         | 14.3   | QANOV-355481 |
          | o2uk    | data cards          | 14.3   | QANOV-355482 |
          | o2uk    | display cards       | 14.3   | QANOV-355483 |
          | o2uk    | poster_cards        | 14.8   | QANOV-441182 |
          | o2uk    | naked cards         | 14.8   | QANOV-448627 |
          | moves   | featured content    | 13.3   | QANOV-10992  |
          | moves   | vertical cards      | 13.3   | QANOV-10994  |
          | moves   | rows                | 13.3   | QANOV-10996  |
          | moves   | banner hero         | 14.3   | QANOV-355484 |
          | moves   | data cards          | 14.3   | QANOV-355485 |
          | moves   | display cards       | 14.3   | QANOV-355486 |
          | moves   | poster_cards        | 14.8   | QANOV-441184 |
          | moves   | naked cards         | 14.8   | QANOV-448628 |
          | blaude  | featured content    | 13.9   | QANOV-228300 |
          | blaude  | vertical cards      | 13.9   | QANOV-228301 |
          | blaude  | rows                | 13.9   | QANOV-228302 |
          | blaude  | banner hero         | 14.3   | QANOV-355487 |
          | blaude  | data cards          | 14.3   | QANOV-355488 |
          | blaude  | display cards       | 14.3   | QANOV-355489 |
          | blaude  | poster_cards        | 14.8   | QANOV-441186 |
          | blaude  | naked cards         | 14.8   | QANOV-448629 |
          | o2de    | featured content    | 14.2   | QANOV-49122  |
          | o2de    | vertical cards      | 14.2   | QANOV-49123  |
          | o2de    | rows                | 14.2   | QANOV-49124  |
          | o2de    | banner hero         | 14.3   | QANOV-355490 |
          | o2de    | data cards          | 14.3   | QANOV-355491 |
          | o2de    | display cards       | 14.3   | QANOV-355492 |
          | o2de    | poster_cards        | 14.8   | QANOV-441188 |
          | o2de    | naked cards         | 14.8   | QANOV-448630 |
          | o2es    | featured content    | Future | QANOV-417675 |
          | o2es    | vertical cards      | Future | QANOV-417676 |
          | o2es    | rows                | Future | QANOV-417677 |
          | o2es    | banner hero         | Future | QANOV-417678 |
          | o2es    | data cards          | Future | QANOV-417679 |
          | o2es    | display cards       | Future | QANOV-417680 |
          | o2es    | poster_cards        | Future | QANOV-441190 |
          | o2es    | naked cards         | Future | QANOV-448631 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the expiration date of a "<module>" card with countdown timer and expiration set to 15 days
    Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary
    To test this scenario disable the automatic time/date in the phone and set it to a day before.
    Given user has a card configured with expiration date set to "15 days" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.fifteen]" format displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-368733 |
          | vivobr  | vertical cards      | 13.3   | QANOV-368734 |
          | vivobr  | rows                | 13.3   | QANOV-368735 |
          | vivobr  | banner hero         | 14.3   | QANOV-368736 |
          | vivobr  | data cards          | 14.3   | QANOV-368737 |
          | vivobr  | display cards       | 14.3   | QANOV-368738 |
          | vivobr  | poster cards        | 14.8   | QANOV-441192 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441193 |
          | vivobr  | naked cards         | 14.8   | QANOV-448632 |
          | o2uk    | featured content    | 13.3   | QANOV-368739 |
          | o2uk    | vertical cards      | 13.3   | QANOV-368740 |
          | o2uk    | rows                | 13.3   | QANOV-368741 |
          | o2uk    | banner hero         | 14.3   | QANOV-368742 |
          | o2uk    | data cards          | 14.3   | QANOV-368743 |
          | o2uk    | display cards       | 14.3   | QANOV-368744 |
          | o2uk    | poster cards        | 14.8   | QANOV-441194 |
          | o2uk    | naked cards         | 14.8   | QANOV-448633 |
          | moves   | featured content    | 13.3   | QANOV-368745 |
          | moves   | vertical cards      | 13.3   | QANOV-368746 |
          | moves   | rows                | 13.3   | QANOV-368747 |
          | moves   | banner hero         | 14.3   | QANOV-368748 |
          | moves   | data cards          | 14.3   | QANOV-368749 |
          | moves   | display cards       | 14.3   | QANOV-368750 |
          | moves   | poster cards        | 14.8   | QANOV-441196 |
          | moves   | naked cards         | 14.8   | QANOV-448634 |
          | blaude  | featured content    | 13.9   | QANOV-368751 |
          | blaude  | vertical cards      | 13.9   | QANOV-368752 |
          | blaude  | rows                | 13.9   | QANOV-368753 |
          | blaude  | banner hero         | 14.3   | QANOV-368754 |
          | blaude  | data cards          | 14.3   | QANOV-368755 |
          | blaude  | display cards       | 14.3   | QANOV-368756 |
          | blaude  | poster cards        | 14.8   | QANOV-441198 |
          | blaude  | naked cards         | 14.8   | QANOV-448635 |
          | o2de    | featured content    | 14.2   | QANOV-368757 |
          | o2de    | vertical cards      | 14.2   | QANOV-368758 |
          | o2de    | rows                | 14.2   | QANOV-368759 |
          | o2de    | banner hero         | 14.3   | QANOV-368760 |
          | o2de    | data cards          | 14.3   | QANOV-368761 |
          | o2de    | display cards       | 14.3   | QANOV-368762 |
          | o2de    | poster cards        | 14.8   | QANOV-441200 |
          | o2de    | naked cards         | 14.8   | QANOV-448636 |
          | o2es    | featured content    | Future | QANOV-441202 |
          | o2es    | vertical cards      | Future | QANOV-441203 |
          | o2es    | rows                | Future | QANOV-441204 |
          | o2es    | banner hero         | Future | QANOV-441205 |
          | o2es    | data cards          | Future | QANOV-441206 |
          | o2es    | display cards       | Future | QANOV-441207 |
          | o2es    | poster cards        | Future | QANOV-441208 |

  @jira.<jira_id> @<exec_mode> @<priority> @<product> @android @ios @jira.cv.<cv> @mobile @webapp
  Scenario Outline: User can see the expiration date of a "<module>" module with countdown timer and expiration set to 1 and 15 days
    Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary
    Given user has a card configured with expiration date set to "1 > days < 15" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.one_and_fifteen]" format displayed

    @live @next @qa
    Examples:
          | product | module              | priority   | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | smoke      | 13.3 | automatic | QANOV-189516 |
          | vivobr  | vertical cards      | regression | 13.3 | automatic | QANOV-189517 |
          | vivobr  | rows                | regression | 13.3 | automatic | QANOV-189518 |
          | vivobr  | banner hero         | regression | 14.3 | manual    | QANOV-355493 |
          | vivobr  | data cards          | regression | 14.3 | manual    | QANOV-355494 |
          | vivobr  | naked cards         | regression | 14.8 | manual    | QANOV-448644 |
          | vivobr  | poster cards        | regression | 14.8 | manual    | QANOV-441210 |
          | vivobr  | data cards advanced | regression | 14.8 | manual    | QANOV-441211 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | o2uk    | featured content | smoke      | 13.3 | automatic | QANOV-189519 |
          | o2uk    | vertical cards   | regression | 13.3 | automatic | QANOV-189520 |
          | o2uk    | rows             | regression | 13.3 | automatic | QANOV-189521 |
          | o2uk    | banner hero      | regression | 14.3 | manual    | QANOV-355496 |
          | o2uk    | data cards       | regression | 14.3 | manual    | QANOV-355497 |
          | o2uk    | naked cards      | regression | 14.8 | manual    | QANOV-448645 |
          | o2uk    | poster cards     | regression | 14.8 | manual    | QANOV-441212 |

    @cert2 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | moves   | featured content | smoke      | 13.3 | automatic | QANOV-189522 |
          | moves   | vertical cards   | regression | 13.3 | automatic | QANOV-189523 |
          | moves   | rows             | regression | 13.3 | automatic | QANOV-189524 |
          | moves   | banner hero      | regression | 14.3 | manual    | QANOV-355499 |
          | moves   | data cards       | regression | 14.3 | manual    | QANOV-355500 |
          | moves   | naked cards      | regression | 14.8 | manual    | QANOV-448646 |
          | moves   | poster cards     | regression | 14.8 | manual    | QANOV-441214 |

    @cert3 @live @next @qa
    Examples:
          | product | module           | priority   | cv   | exec_mode | jira_id      |
          | blaude  | featured content | smoke      | 13.9 | automatic | QANOV-228306 |
          | blaude  | vertical cards   | regression | 13.9 | automatic | QANOV-228307 |
          | blaude  | rows             | regression | 13.9 | automatic | QANOV-228308 |
          | blaude  | banner hero      | regression | 14.3 | manual    | QANOV-355502 |
          | blaude  | data cards       | regression | 14.3 | manual    | QANOV-355503 |
          | blaude  | naked cards      | regression | 14.8 | manual    | QANOV-448647 |
          | blaude  | poster cards     | regression | 14.8 | manual    | QANOV-441216 |

    Examples:
          | product | module           | priority   | cv     | exec_mode | jira_id      |
          | o2de    | featured content | smoke      | 14.2   | manual    | QANOV-189525 |
          | o2de    | vertical cards   | regression | 14.2   | manual    | QANOV-189526 |
          | o2de    | rows             | regression | 14.2   | manual    | QANOV-189527 |
          | o2de    | banner hero      | regression | 14.3   | manual    | QANOV-355505 |
          | o2de    | data cards       | regression | 14.3   | manual    | QANOV-355506 |
          | o2de    | naked cards      | regression | 14.8   | manual    | QANOV-448648 |
          | o2de    | poster cards     | regression | 14.8   | manual    | QANOV-441218 |
          | o2es    | featured content | smoke      | Future | manual    | QANOV-417681 |
          | o2es    | vertical cards   | regression | Future | manual    | QANOV-417682 |
          | o2es    | rows             | regression | Future | manual    | QANOV-417683 |
          | o2es    | banner hero      | regression | Future | manual    | QANOV-417684 |
          | o2es    | data cards       | regression | Future | manual    | QANOV-417685 |
          | o2es    | naked cards      | regression | Future | manual    | QANOV-448649 |
          | o2es    | poster cards     | regression | Future | manual    | QANOV-441220 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile
  Scenario Outline: User can see the expiration date of a "<module>" card with countdown timer and expiration set to 1 day
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary"
    Given user has a card configured with expiration date set to "1 day" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.one_day]" format displayed

    @smoke
    Examples:
          | product | module           | cv     | jira_id      |
          | vivobr  | featured content | 13.3   | QANOV-189528 |
          | o2uk    | featured content | 13.3   | QANOV-189531 |
          | moves   | featured content | 13.3   | QANOV-189534 |
          | blaude  | featured content | 13.9   | QANOV-228309 |
          | o2de    | featured content | 14.2   | QANOV-189537 |
          | o2es    | featured content | Future | QANOV-417687 |

    @regression
    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | vertical cards      | 13.3   | QANOV-189529 |
          | vivobr  | rows                | 13.3   | QANOV-189530 |
          | vivobr  | banner hero         | 14.3   | QANOV-355508 |
          | vivobr  | data cards          | 14.3   | QANOV-355509 |
          | vivobr  | poster cards        | 14.8   | QANOV-441222 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441223 |
          | vivobr  | naked cards         | 14.8   | QANOV-448650 |
          | o2uk    | vertical cards      | 13.3   | QANOV-189532 |
          | o2uk    | rows                | 13.3   | QANOV-189533 |
          | o2uk    | banner hero         | 14.3   | QANOV-355511 |
          | o2uk    | data cards          | 14.3   | QANOV-355512 |
          | o2uk    | poster cards        | 14.8   | QANOV-441224 |
          | o2uk    | naked cards         | 14.8   | QANOV-448651 |
          | moves   | vertical cards      | 13.3   | QANOV-189535 |
          | moves   | rows                | 13.3   | QANOV-189536 |
          | moves   | banner hero         | 14.3   | QANOV-355514 |
          | moves   | data cards          | 14.3   | QANOV-355515 |
          | moves   | poster cards        | 14.8   | QANOV-441226 |
          | moves   | naked cards         | 14.8   | QANOV-448652 |
          | blaude  | vertical cards      | 13.9   | QANOV-228310 |
          | blaude  | rows                | 13.9   | QANOV-228311 |
          | blaude  | banner hero         | 14.3   | QANOV-355517 |
          | blaude  | data cards          | 14.3   | QANOV-355518 |
          | blaude  | poster cards        | 14.8   | QANOV-441228 |
          | blaude  | naked cards         | 14.8   | QANOV-448653 |
          | o2de    | vertical cards      | 14.2   | QANOV-189538 |
          | o2de    | rows                | 14.2   | QANOV-189539 |
          | o2de    | banner hero         | 14.3   | QANOV-355520 |
          | o2de    | data cards          | 14.3   | QANOV-355521 |
          | o2de    | poster cards        | 14.8   | QANOV-441230 |
          | o2de    | naked cards         | 14.8   | QANOV-448654 |
          | o2es    | vertical cards      | Future | QANOV-417688 |
          | o2es    | rows                | Future | QANOV-417689 |
          | o2es    | banner hero         | Future | QANOV-417690 |
          | o2es    | data cards          | Future | QANOV-417691 |
          | o2es    | poster cards        | Future | QANOV-441232 |
          | o2es    | naked cards         | Future | QANOV-448655 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the expiration date of a "<module>" card with countdown timer and expiration set to 1 and 24 hours
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary"
    Given user has a card configured with expiration date set to "1 > hours < 24" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.one_and_twentyfour_hours]" format displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-189540 |
          | vivobr  | vertical cards      | 13.3   | QANOV-189541 |
          | vivobr  | rows                | 13.3   | QANOV-189542 |
          | vivobr  | banner hero         | 14.3   | QANOV-355523 |
          | vivobr  | data cards          | 14.3   | QANOV-355524 |
          | vivobr  | display cards       | 14.3   | QANOV-355525 |
          | vivobr  | poster cards        | 14.8   | QANOV-441234 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441235 |
          | vivobr  | naked cards         | 14.8   | QANOV-448656 |
          | o2uk    | featured content    | 13.3   | QANOV-189543 |
          | o2uk    | vertical cards      | 13.3   | QANOV-189544 |
          | o2uk    | rows                | 13.3   | QANOV-189545 |
          | o2uk    | banner hero         | 14.3   | QANOV-355526 |
          | o2uk    | data cards          | 14.3   | QANOV-355527 |
          | o2uk    | display cards       | 14.3   | QANOV-355528 |
          | o2uk    | poster cards        | 14.8   | QANOV-441236 |
          | o2uk    | naked cards         | 14.8   | QANOV-448657 |
          | moves   | featured content    | 13.3   | QANOV-189546 |
          | moves   | vertical cards      | 13.3   | QANOV-189547 |
          | moves   | rows                | 13.3   | QANOV-189548 |
          | moves   | banner hero         | 14.3   | QANOV-355529 |
          | moves   | data cards          | 14.3   | QANOV-355530 |
          | moves   | display cards       | 14.3   | QANOV-355531 |
          | moves   | poster cards        | 14.8   | QANOV-441238 |
          | moves   | naked cards         | 14.8   | QANOV-448658 |
          | blaude  | featured content    | 13.9   | QANOV-228312 |
          | blaude  | vertical cards      | 13.9   | QANOV-228313 |
          | blaude  | rows                | 13.9   | QANOV-228314 |
          | blaude  | banner hero         | 14.3   | QANOV-355532 |
          | blaude  | data cards          | 14.3   | QANOV-355533 |
          | blaude  | display cards       | 14.3   | QANOV-355534 |
          | blaude  | poster cards        | 14.8   | QANOV-441240 |
          | blaude  | naked cards         | 14.8   | QANOV-448659 |
          | o2de    | featured content    | 14.2   | QANOV-189549 |
          | o2de    | vertical cards      | 14.2   | QANOV-189550 |
          | o2de    | rows                | 14.2   | QANOV-189551 |
          | o2de    | banner hero         | 14.3   | QANOV-355535 |
          | o2de    | data cards          | 14.3   | QANOV-355536 |
          | o2de    | display cards       | 14.3   | QANOV-355537 |
          | o2de    | poster cards        | 14.8   | QANOV-441242 |
          | o2de    | naked cards         | 14.8   | QANOV-448660 |
          | o2es    | featured content    | Future | QANOV-417693 |
          | o2es    | vertical cards      | Future | QANOV-417694 |
          | o2es    | rows                | Future | QANOV-417695 |
          | o2es    | banner hero         | Future | QANOV-417696 |
          | o2es    | data cards          | Future | QANOV-417697 |
          | o2es    | display cards       | Future | QANOV-417698 |
          | o2es    | poster cards        | Future | QANOV-441244 |
          | o2es    | naked cards         | Future | QANOV-448661 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the expiration date of a "<module>" card with countdown timer and expiration set to in 1 hour
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary"
    Given user has a card configured with expiration date set to "1 hour" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.one_hour]" format displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-189552 |
          | vivobr  | vertical cards      | 13.3   | QANOV-189553 |
          | vivobr  | rows                | 13.3   | QANOV-189554 |
          | vivobr  | banner hero         | 14.3   | QANOV-355538 |
          | vivobr  | data cards          | 14.3   | QANOV-355539 |
          | vivobr  | display cards       | 14.3   | QANOV-355540 |
          | vivobr  | poster cards        | 14.8   | QANOV-441246 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441247 |
          | vivobr  | naked cards         | 14.8   | QANOV-448662 |
          | o2uk    | featured content    | 13.3   | QANOV-189555 |
          | o2uk    | vertical cards      | 13.3   | QANOV-189556 |
          | o2uk    | rows                | 13.3   | QANOV-189557 |
          | o2uk    | banner hero         | 14.3   | QANOV-355541 |
          | o2uk    | data cards          | 14.3   | QANOV-355542 |
          | o2uk    | display cards       | 14.3   | QANOV-355543 |
          | o2uk    | poster cards        | 14.8   | QANOV-441248 |
          | o2uk    | naked cards         | 14.8   | QANOV-448663 |
          | moves   | featured content    | 13.3   | QANOV-189558 |
          | moves   | vertical cards      | 13.3   | QANOV-189559 |
          | moves   | rows                | 13.3   | QANOV-189560 |
          | moves   | banner hero         | 14.3   | QANOV-355544 |
          | moves   | data cards          | 14.3   | QANOV-355545 |
          | moves   | display cards       | 14.3   | QANOV-355546 |
          | moves   | poster cards        | 14.8   | QANOV-441250 |
          | moves   | naked cards         | 14.8   | QANOV-448664 |
          | blaude  | featured content    | 13.9   | QANOV-228336 |
          | blaude  | vertical cards      | 13.9   | QANOV-228338 |
          | blaude  | rows                | 13.9   | QANOV-228340 |
          | blaude  | banner hero         | 14.3   | QANOV-355547 |
          | blaude  | data cards          | 14.3   | QANOV-355548 |
          | blaude  | display cards       | 14.3   | QANOV-355549 |
          | blaude  | poster cards        | 14.8   | QANOV-441252 |
          | blaude  | naked cards         | 14.8   | QANOV-448665 |
          | o2de    | featured content    | 14.2   | QANOV-189561 |
          | o2de    | vertical cards      | 14.2   | QANOV-189562 |
          | o2de    | rows                | 14.2   | QANOV-189563 |
          | o2de    | banner hero         | 14.3   | QANOV-355550 |
          | o2de    | data cards          | 14.3   | QANOV-355551 |
          | o2de    | display cards       | 14.3   | QANOV-355552 |
          | o2de    | poster cards        | 14.8   | QANOV-441254 |
          | o2de    | naked cards         | 14.8   | QANOV-448666 |
          | o2es    | featured content    | Future | QANOV-417699 |
          | o2es    | vertical cards      | Future | QANOV-417700 |
          | o2es    | rows                | Future | QANOV-417701 |
          | o2es    | banner hero         | Future | QANOV-417702 |
          | o2es    | data cards          | Future | QANOV-417703 |
          | o2es    | display cards       | Future | QANOV-417704 |
          | o2es    | poster cards        | Future | QANOV-441256 |
          | o2es    | naked cards         | Future | QANOV-448667 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the expiration date of a "<module>" card with countdown timer and expiration set to less than 1 hour
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1. Expiry date text may vary"
    Given user has a card configured with expiration date set to "< 1 hour" in a "countdown" timer in a "<module>" module
     When searches the "card"
     Then the selected explore card has the validity period with "[LANG:explore.validity_period.countdown.less_one_hour]" format displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-189564 |
          | vivobr  | vertical cards      | 13.3   | QANOV-189565 |
          | vivobr  | rows                | 13.3   | QANOV-189566 |
          | vivobr  | banner hero         | 14.3   | QANOV-355553 |
          | vivobr  | data cards          | 14.3   | QANOV-355554 |
          | vivobr  | display cards       | 14.3   | QANOV-355555 |
          | vivobr  | poster cards        | 14.8   | QANOV-441258 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441259 |
          | vivobr  | naked cards         | 14.8   | QANOV-448668 |
          | o2uk    | featured content    | 13.3   | QANOV-189567 |
          | o2uk    | vertical cards      | 13.3   | QANOV-189568 |
          | o2uk    | rows                | 13.3   | QANOV-189569 |
          | o2uk    | banner hero         | 14.3   | QANOV-355556 |
          | o2uk    | data cards          | 14.3   | QANOV-355557 |
          | o2uk    | display cards       | 14.3   | QANOV-355558 |
          | o2uk    | poster cards        | 14.8   | QANOV-441260 |
          | o2uk    | naked cards         | 14.8   | QANOV-448669 |
          | moves   | featured content    | 13.3   | QANOV-189570 |
          | moves   | vertical cards      | 13.3   | QANOV-189571 |
          | moves   | rows                | 13.3   | QANOV-189572 |
          | moves   | banner hero         | 14.3   | QANOV-355559 |
          | moves   | data cards          | 14.3   | QANOV-355560 |
          | moves   | display cards       | 14.3   | QANOV-355561 |
          | moves   | poster cards        | 14.8   | QANOV-441262 |
          | moves   | naked cards         | 14.8   | QANOV-448670 |
          | blaude  | featured content    | 13.9   | QANOV-228376 |
          | blaude  | vertical cards      | 13.9   | QANOV-228377 |
          | blaude  | rows                | 13.9   | QANOV-228378 |
          | blaude  | banner hero         | 14.3   | QANOV-355562 |
          | blaude  | data cards          | 14.3   | QANOV-355563 |
          | blaude  | display cards       | 14.3   | QANOV-355564 |
          | blaude  | poster cards        | 14.8   | QANOV-441264 |
          | blaude  | naked cards         | 14.8   | QANOV-448671 |
          | o2de    | featured content    | 14.2   | QANOV-189573 |
          | o2de    | vertical cards      | 14.2   | QANOV-189574 |
          | o2de    | rows                | 14.2   | QANOV-189575 |
          | o2de    | banner hero         | 14.3   | QANOV-355565 |
          | o2de    | data cards          | 14.3   | QANOV-355566 |
          | o2de    | display cards       | 14.3   | QANOV-355567 |
          | o2de    | poster cards        | 14.8   | QANOV-441266 |
          | o2de    | naked cards         | 14.8   | QANOV-448672 |
          | o2es    | featured content    | Future | QANOV-417705 |
          | o2es    | vertical cards      | Future | QANOV-417706 |
          | o2es    | rows                | Future | QANOV-417707 |
          | o2es    | banner hero         | Future | QANOV-417708 |
          | o2es    | data cards          | Future | QANOV-417709 |
          | o2es    | display cards       | Future | QANOV-417710 |
          | o2es    | poster cards        | Future | QANOV-441268 |
          | o2es    | naked cards         | Future | QANOV-448673 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-91911 @mobile @no_automatable
  Scenario Outline: User cannot see an explore "<module>" card which validity period is expired
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1."
    Given user has a card configured with an expired validity period in a "<module>" module
     Then the explore card is not displayed

    @ber @raitt_drop1 @sanity
    Examples:
          | product | module           | cv   | jira_id      |
          | blaude  | featured content | 13.9 | QANOV-228379 |

    @ber @sanity
    Examples:
          | product | module           | cv   | jira_id      |
          | o2uk    | rows             | 13.3 | QANOV-11012  |
          | vivobr  | featured content | 13.3 | QANOV-10998  |
          | moves   | vertical cards   | 13.3 | QANOV-11018  |
          | o2de    | banner           | 14.2 | QANOV-49126  |
          | vivobr  | poster cards     | 14.8 | QANOV-441270 |

    @regression
    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | banner              | 13.3   | QANOV-11000  |
          | vivobr  | vertical cards      | 13.3   | QANOV-11002  |
          | vivobr  | rows                | 13.3   | QANOV-11004  |
          | vivobr  | banner hero         | 14.3   | QANOV-355568 |
          | vivobr  | highlighted cards   | 14.3   | QANOV-525372 |
          | vivobr  | data cards          | 14.3   | QANOV-355569 |
          | vivobr  | display cards       | 14.3   | QANOV-355570 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441271 |
          | vivobr  | naked cards         | 14.8   | QANOV-448674 |
          | vivobr  | naked small cards   | 14.8   | QANOV-448675 |
          | o2uk    | featured content    | 13.3   | QANOV-11006  |
          | o2uk    | banner              | 13.3   | QANOV-11008  |
          | o2uk    | vertical cards      | 13.3   | QANOV-11010  |
          | o2uk    | banner hero         | 14.3   | QANOV-355571 |
          | o2uk    | highlighted cards   | 14.3   | QANOV-525374 |
          | o2uk    | data cards          | 14.3   | QANOV-355572 |
          | o2uk    | display cards       | 14.3   | QANOV-355573 |
          | o2uk    | poster cards        | 14.8   | QANOV-441272 |
          | o2uk    | naked cards         | 14.8   | QANOV-448676 |
          | o2uk    | naked small cards   | 14.8   | QANOV-448677 |
          | moves   | featured content    | 13.3   | QANOV-11014  |
          | moves   | banner              | 13.3   | QANOV-11016  |
          | moves   | rows                | 13.3   | QANOV-11020  |
          | moves   | banner hero         | 14.3   | QANOV-355574 |
          | moves   | highlighted cards   | 14.3   | QANOV-525375 |
          | moves   | data cards          | 14.3   | QANOV-355575 |
          | moves   | display cards       | 14.3   | QANOV-355576 |
          | moves   | poster cards        | 14.8   | QANOV-441274 |
          | moves   | naked cards         | 14.8   | QANOV-448678 |
          | moves   | naked small cards   | 14.8   | QANOV-448679 |
          | blaude  | banner              | 13.9   | QANOV-228380 |
          | blaude  | vertical cards      | 13.9   | QANOV-228381 |
          | blaude  | rows                | 13.9   | QANOV-228382 |
          | blaude  | banner hero         | 14.3   | QANOV-355577 |
          | blaude  | highlighted cards   | 14.3   | QANOV-525376 |
          | blaude  | data cards          | 14.3   | QANOV-355578 |
          | blaude  | display cards       | 14.3   | QANOV-355579 |
          | blaude  | poster cards        | 14.8   | QANOV-441276 |
          | blaude  | naked cards         | 14.8   | QANOV-448680 |
          | blaude  | naked small cards   | 14.8   | QANOV-448681 |
          | o2de    | featured content    | 14.2   | QANOV-49125  |
          | o2de    | vertical cards      | 14.2   | QANOV-49127  |
          | o2de    | rows                | 14.2   | QANOV-49128  |
          | o2de    | banner hero         | 14.3   | QANOV-355580 |
          | o2de    | highlighted cards   | 14.3   | QANOV-525377 |
          | o2de    | data cards          | 14.3   | QANOV-355581 |
          | o2de    | display cards       | 14.3   | QANOV-355582 |
          | o2de    | poster cards        | 14.8   | QANOV-441278 |
          | o2de    | naked cards         | 14.8   | QANOV-448682 |
          | o2de    | naked small cards   | 14.8   | QANOV-448683 |
          | o2es    | featured content    | Future | QANOV-417711 |
          | o2es    | vertical cards      | Future | QANOV-417712 |
          | o2es    | rows                | Future | QANOV-417713 |
          | o2es    | banner hero         | Future | QANOV-417714 |
          | o2es    | highlighted cards   | Future | QANOV-525378 |
          | o2es    | data cards          | Future | QANOV-417715 |
          | o2es    | display cards       | Future | QANOV-417716 |
          | o2es    | poster cards        | Future | QANOV-441280 |
          | o2es    | naked cards         | Future | QANOV-448684 |
          | o2es    | naked small cards   | Future | QANOV-448685 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-91929 @mobile @no_automatable
  @regression
  Scenario Outline: The module with just one "<module>" card will disappear when the validity period is expired
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1."
    Given user has a card configured with an expired validity period in a "<module>" module
      And the card is the only one inside an explore module
     When the expiration date of the card is accomplished
     Then the explore module is not displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-11022  |
          | vivobr  | vertical cards      | 13.3   | QANOV-11024  |
          | vivobr  | rows                | 13.3   | QANOV-11026  |
          | vivobr  | banner hero         | 14.3   | QANOV-355583 |
          | vivobr  | highlighted cards   | 14.3   | QANOV-525379 |
          | vivobr  | data cards          | 14.3   | QANOV-355584 |
          | vivobr  | display cards       | 14.3   | QANOV-355585 |
          | vivobr  | poster cards        | 14.8   | QANOV-441282 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441283 |
          | vivobr  | naked cards         | 14.8   | QANOV-448686 |
          | vivobr  | naked small cards   | 14.8   | QANOV-448687 |
          | o2uk    | featured content    | 13.3   | QANOV-11028  |
          | o2uk    | vertical cards      | 13.3   | QANOV-11030  |
          | o2uk    | rows                | 13.3   | QANOV-11032  |
          | o2uk    | banner hero         | 14.3   | QANOV-355586 |
          | o2uk    | highlighted cards   | 14.3   | QANOV-525380 |
          | o2uk    | data cards          | 14.3   | QANOV-355587 |
          | o2uk    | display cards       | 14.3   | QANOV-355588 |
          | o2uk    | poster_cards        | 14.8   | QANOV-441284 |
          | o2uk    | naked cards         | 14.8   | QANOV-448688 |
          | o2uk    | naked small cards   | 14.8   | QANOV-448689 |
          | moves   | featured content    | 13.3   | QANOV-11034  |
          | moves   | vertical cards      | 13.3   | QANOV-11037  |
          | moves   | rows                | 13.3   | QANOV-11038  |
          | moves   | banner hero         | 14.3   | QANOV-355589 |
          | moves   | highlighted cards   | 14.3   | QANOV-525381 |
          | moves   | data cards          | 14.3   | QANOV-355590 |
          | moves   | display cards       | 14.3   | QANOV-355591 |
          | moves   | poster_cards        | 14.8   | QANOV-441286 |
          | moves   | naked cards         | 14.8   | QANOV-448690 |
          | moves   | naked small cards   | 14.8   | QANOV-448691 |
          | blaude  | featured content    | 13.9   | QANOV-228383 |
          | blaude  | vertical cards      | 13.9   | QANOV-228384 |
          | blaude  | rows                | 13.9   | QANOV-228385 |
          | blaude  | banner hero         | 14.3   | QANOV-355592 |
          | blaude  | highlighted cards   | 14.3   | QANOV-525382 |
          | blaude  | data cards          | 14.3   | QANOV-355593 |
          | blaude  | display cards       | 14.3   | QANOV-355594 |
          | blaude  | poster_cards        | 14.8   | QANOV-441288 |
          | blaude  | naked cards         | 14.8   | QANOV-448692 |
          | blaude  | naked small cards   | 14.8   | QANOV-448693 |
          | o2de    | featured content    | 14.2   | QANOV-49129  |
          | o2de    | vertical cards      | 14.2   | QANOV-49130  |
          | o2de    | rows                | 14.2   | QANOV-49131  |
          | o2de    | banner hero         | 14.3   | QANOV-355595 |
          | o2de    | highlighted cards   | 14.3   | QANOV-525383 |
          | o2de    | data cards          | 14.3   | QANOV-355596 |
          | o2de    | display cards       | 14.3   | QANOV-355597 |
          | o2de    | poster_cards        | 14.8   | QANOV-441290 |
          | o2de    | naked cards         | 14.8   | QANOV-448694 |
          | o2de    | naked small cards   | 14.8   | QANOV-448695 |
          | o2es    | featured content    | Future | QANOV-417717 |
          | o2es    | vertical cards      | Future | QANOV-417718 |
          | o2es    | rows                | Future | QANOV-417719 |
          | o2es    | banner hero         | Future | QANOV-417720 |
          | o2es    | highlighted cards   | Future | QANOV-525384 |
          | o2es    | data cards          | Future | QANOV-417721 |
          | o2es    | display cards       | Future | QANOV-417722 |
          | o2es    | poster_cards        | Future | QANOV-441292 |
          | o2es    | naked cards         | Future | QANOV-448696 |
          | o2es    | naked small cards   | Future | QANOV-448697 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: User cannot see an explore "<module>" card which validity period has not started
    internal_checkpoint="Time is set in the local time. Ex MyO2: The time is GMT+1."
    Given user has a card configured with a not started validity period in a "<module>" module
     Then the explore card is not displayed

    Examples:
          | product | module              | cv     | jira_id      |
          | vivobr  | featured content    | 13.3   | QANOV-97140  |
          | vivobr  | banner              | 13.3   | QANOV-97141  |
          | vivobr  | vertical cards      | 13.3   | QANOV-97142  |
          | vivobr  | rows                | 13.3   | QANOV-97143  |
          | vivobr  | banner hero         | 14.3   | QANOV-355598 |
          | vivobr  | highlighted cards   | 14.3   | QANOV-525385 |
          | vivobr  | data cards          | 14.3   | QANOV-355599 |
          | vivobr  | display cards       | 14.3   | QANOV-355600 |
          | vivobr  | poster cards        | 14.8   | QANOV-441294 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441295 |
          | vivobr  | naked cards         | 14.8   | QANOV-448698 |
          | vivobr  | naked small cards   | 14.8   | QANOV-448699 |
          | o2uk    | featured content    | 13.3   | QANOV-97144  |
          | o2uk    | banner              | 13.3   | QANOV-97145  |
          | o2uk    | vertical cards      | 13.3   | QANOV-97146  |
          | o2uk    | rows                | 13.3   | QANOV-97147  |
          | o2uk    | banner hero         | 14.3   | QANOV-355601 |
          | o2uk    | highlighted cards   | 14.3   | QANOV-525386 |
          | o2uk    | data cards          | 14.3   | QANOV-355602 |
          | o2uk    | display cards       | 14.3   | QANOV-355603 |
          | o2uk    | poster cards        | 14.8   | QANOV-441296 |
          | o2uk    | naked cards         | 14.8   | QANOV-448700 |
          | o2uk    | naked small cards   | 14.8   | QANOV-448701 |
          | moves   | featured content    | 13.3   | QANOV-97148  |
          | moves   | banner              | 13.3   | QANOV-97149  |
          | moves   | vertical cards      | 13.3   | QANOV-97150  |
          | moves   | rows                | 13.3   | QANOV-97151  |
          | moves   | banner hero         | 14.3   | QANOV-355604 |
          | moves   | highlighted cards   | 14.3   | QANOV-525387 |
          | moves   | data cards          | 14.3   | QANOV-355605 |
          | moves   | display cards       | 14.3   | QANOV-355606 |
          | moves   | poster cards        | 14.8   | QANOV-441298 |
          | moves   | naked cards         | 14.8   | QANOV-448702 |
          | moves   | naked small cards   | 14.8   | QANOV-448703 |
          | blaude  | featured content    | 13.9   | QANOV-228386 |
          | blaude  | banner              | 13.9   | QANOV-228387 |
          | blaude  | vertical cards      | 13.9   | QANOV-228388 |
          | blaude  | rows                | 13.9   | QANOV-228389 |
          | blaude  | banner hero         | 14.3   | QANOV-355607 |
          | blaude  | highlighted cards   | 14.3   | QANOV-525388 |
          | blaude  | data cards          | 14.3   | QANOV-355608 |
          | blaude  | display cards       | 14.3   | QANOV-355609 |
          | blaude  | poster cards        | 14.8   | QANOV-441300 |
          | blaude  | naked cards         | 14.8   | QANOV-448704 |
          | blaude  | naked small cards   | 14.8   | QANOV-448705 |
          | o2de    | featured content    | 14.2   | QANOV-228390 |
          | o2de    | banner              | 14.2   | QANOV-228391 |
          | o2de    | vertical cards      | 14.2   | QANOV-228392 |
          | o2de    | rows                | 14.2   | QANOV-228393 |
          | o2de    | banner hero         | 14.3   | QANOV-355610 |
          | o2de    | highlighted cards   | 14.3   | QANOV-525389 |
          | o2de    | data cards          | 14.3   | QANOV-355611 |
          | o2de    | display cards       | 14.3   | QANOV-355612 |
          | o2de    | poster cards        | 14.8   | QANOV-441302 |
          | o2de    | naked cards         | 14.8   | QANOV-448706 |
          | o2de    | naked small cards   | 14.8   | QANOV-448707 |
          | o2es    | featured content    | Future | QANOV-417723 |
          | o2es    | vertical cards      | Future | QANOV-417724 |
          | o2es    | rows                | Future | QANOV-417725 |
          | o2es    | banner hero         | Future | QANOV-417726 |
          | o2es    | highlighted cards   | Future | QANOV-525390 |
          | o2es    | data cards          | Future | QANOV-417727 |
          | o2es    | display cards       | Future | QANOV-417728 |
          | o2es    | poster cards        | Future | QANOV-441304 |
          | o2es    | naked cards         | Future | QANOV-448708 |
          | o2es    | naked small cards   | Future | QANOV-448709 |

  @jira.<jira_id> @<exec_mode> @<priority> @<product> @android @ios @jira.cv.<cv> @mobile @webapp
  Scenario Outline: User can see an explore "<module>" card which validity period has started
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Given user has a card configured with a started validity period in a "<module>" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @live @next @qa
    Examples:
          | product | module              | priority   | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | smoke      | 13.3 | automatic | QANOV-97152  |
          | vivobr  | banner              | regression | 13.3 | manual    | QANOV-97153  |
          | vivobr  | vertical cards      | regression | 13.3 | automatic | QANOV-97154  |
          | vivobr  | rows                | regression | 13.3 | automatic | QANOV-97155  |
          | vivobr  | banner hero         | regression | 14.3 | manual    | QANOV-355613 |
          | vivobr  | highlighted cards   | regression | 14.3 | automatic | QANOV-525391 |
          | vivobr  | data cards          | regression | 14.3 | manual    | QANOV-355614 |
          | vivobr  | display cards       | regression | 14.3 | automatic | QANOV-355615 |
          | vivobr  | naked cards         | regression | 14.8 | manual    | QANOV-448710 |
          | vivobr  | naked small cards   | regression | 14.8 | manual    | QANOV-448711 |
          | vivobr  | poster cards        | regression | 14.8 | manual    | QANOV-441306 |
          | vivobr  | data cards advanced | regression | 14.8 | manual    | QANOV-441307 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module            | priority   | cv   | exec_mode | jira_id      |
          | o2uk    | featured content  | smoke      | 13.3 | automatic | QANOV-97156  |
          | o2uk    | banner            | regression | 13.3 | manual    | QANOV-97157  |
          | o2uk    | vertical cards    | regression | 13.3 | automatic | QANOV-97158  |
          | o2uk    | rows              | regression | 13.3 | automatic | QANOV-97159  |
          | o2uk    | banner hero       | regression | 14.3 | manual    | QANOV-355616 |
          | o2uk    | highlighted cards | regression | 14.3 | automatic | QANOV-525392 |
          | o2uk    | data cards        | regression | 14.3 | manual    | QANOV-355617 |
          | o2uk    | display cards     | regression | 14.3 | automatic | QANOV-355618 |
          | o2uk    | naked cards       | regression | 14.8 | manual    | QANOV-448712 |
          | o2uk    | naked small cards | regression | 14.8 | manual    | QANOV-448713 |
          | o2uk    | poster cards      | regression | 14.8 | manual    | QANOV-441308 |

    @cert2 @live @next @qa
    Examples:
          | product | module            | priority   | cv   | exec_mode | jira_id      |
          | moves   | featured content  | smoke      | 13.3 | automatic | QANOV-97160  |
          | moves   | banner            | regression | 13.3 | manual    | QANOV-97161  |
          | moves   | vertical cards    | regression | 13.3 | automatic | QANOV-97162  |
          | moves   | rows              | regression | 13.3 | automatic | QANOV-97163  |
          | moves   | banner hero       | regression | 14.3 | manual    | QANOV-355619 |
          | moves   | highlighted cards | regression | 14.3 | automatic | QANOV-525393 |
          | moves   | data cards        | regression | 14.3 | manual    | QANOV-355620 |
          | moves   | display cards     | regression | 14.3 | automatic | QANOV-355621 |
          | moves   | naked cards       | regression | 14.8 | manual    | QANOV-448714 |
          | moves   | naked small cards | regression | 14.8 | manual    | QANOV-448715 |
          | moves   | poster cards      | regression | 14.8 | manual    | QANOV-441310 |

    @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | module            | priority   | cv   | exec_mode | jira_id      |
          | blaude  | featured content  | smoke      | 13.9 | automatic | QANOV-228394 |
          | blaude  | banner            | regression | 13.9 | manual    | QANOV-228395 |
          | blaude  | vertical cards    | regression | 13.9 | automatic | QANOV-228396 |
          | blaude  | rows              | regression | 13.9 | automatic | QANOV-228397 |
          | blaude  | banner hero       | regression | 14.3 | manual    | QANOV-355622 |
          | blaude  | highlighted cards | regression | 14.3 | automatic | QANOV-525394 |
          | blaude  | data cards        | regression | 14.3 | manual    | QANOV-355623 |
          | blaude  | display cards     | regression | 14.3 | automatic | QANOV-355624 |
          | blaude  | naked cards       | regression | 14.8 | manual    | QANOV-448716 |
          | blaude  | naked small cards | regression | 14.8 | manual    | QANOV-448717 |
          | blaude  | poster cards      | regression | 14.8 | manual    | QANOV-441312 |

    Examples:
          | product | module            | priority   | cv     | exec_mode | jira_id      |
          | o2de    | featured content  | smoke      | 14.2   | manual    | QANOV-228398 |
          | o2de    | banner            | regression | 14.2   | manual    | QANOV-228399 |
          | o2de    | vertical cards    | regression | 14.2   | manual    | QANOV-228400 |
          | o2de    | rows              | regression | 14.2   | manual    | QANOV-228401 |
          | o2de    | banner hero       | regression | 14.3   | manual    | QANOV-355625 |
          | o2de    | highlighted cards | regression | 14.3   | manual    | QANOV-525395 |
          | o2de    | data cards        | regression | 14.3   | manual    | QANOV-355626 |
          | o2de    | display cards     | regression | 14.3   | manual    | QANOV-355627 |
          | o2de    | naked cards       | regression | 14.8   | manual    | QANOV-448718 |
          | o2de    | naked small cards | regression | 14.8   | manual    | QANOV-448719 |
          | o2de    | poster cards      | regression | 14.8   | manual    | QANOV-441314 |
          | o2es    | featured content  | smoke      | Future | manual    | QANOV-417729 |
          | o2es    | vertical cards    | regression | Future | manual    | QANOV-417730 |
          | o2es    | rows              | regression | Future | manual    | QANOV-417731 |
          | o2es    | banner hero       | regression | Future | manual    | QANOV-417732 |
          | o2es    | highlighted cards | regression | Future | manual    | QANOV-525396 |
          | o2es    | data cards        | regression | Future | manual    | QANOV-417733 |
          | o2es    | display cards     | regression | Future | manual    | QANOV-417734 |
          | o2es    | naked cards       | regression | Future | manual    | QANOV-448720 |
          | o2es    | naked small cards | regression | Future | manual    | QANOV-448721 |
          | o2es    | poster cards      | regression | Future | manual    | QANOV-441316 |

  @jira.<jira_id> @<exec_mode> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  Scenario Outline: User can see an explore "<module>" card without start validity period
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Given user has a card configured with a with no start validity period in a "<module>" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @live @next
    Examples:
          | product | module              | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | 13.3 | automatic | QANOV-97164  |
          | vivobr  | banner              | 13.3 | manual    | QANOV-97165  |
          | vivobr  | vertical cards      | 13.3 | automatic | QANOV-97166  |
          | vivobr  | rows                | 13.3 | automatic | QANOV-97167  |
          | vivobr  | banner hero         | 14.3 | manual    | QANOV-355628 |
          | vivobr  | highlighted cards   | 14.3 | automatic | QANOV-525397 |
          | vivobr  | data cards          | 14.3 | manual    | QANOV-355629 |
          | vivobr  | display cards       | 14.3 | automatic | QANOV-355630 |
          | vivobr  | naked cards         | 14.8 | manual    | QANOV-448722 |
          | vivobr  | naked small cards   | 14.8 | manual    | QANOV-448723 |
          | vivobr  | poster cards        | 14.8 | manual    | QANOV-441318 |
          | vivobr  | data cards advanced | 14.8 | manual    | QANOV-441319 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | o2uk    | featured content  | 13.3 | automatic | QANOV-97168  |
          | o2uk    | banner            | 13.3 | manual    | QANOV-97169  |
          | o2uk    | vertical cards    | 13.3 | automatic | QANOV-97170  |
          | o2uk    | rows              | 13.3 | automatic | QANOV-97171  |
          | o2uk    | banner hero       | 14.3 | manual    | QANOV-355631 |
          | o2uk    | highlighted cards | 14.3 | automatic | QANOV-525398 |
          | o2uk    | data cards        | 14.3 | manual    | QANOV-355632 |
          | o2uk    | display cards     | 14.3 | automatic | QANOV-355633 |
          | o2uk    | naked cards       | 14.8 | manual    | QANOV-448724 |
          | o2uk    | naked small cards | 14.8 | manual    | QANOV-448725 |
          | o2uk    | poster cards      | 14.8 | manual    | QANOV-441320 |

    @cert2 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | moves   | featured content  | 13.3 | automatic | QANOV-97172  |
          | moves   | banner            | 13.3 | manual    | QANOV-97173  |
          | moves   | vertical cards    | 13.3 | automatic | QANOV-97174  |
          | moves   | rows              | 13.3 | automatic | QANOV-97175  |
          | moves   | banner hero       | 14.3 | manual    | QANOV-355634 |
          | moves   | highlighted cards | 14.3 | automatic | QANOV-525399 |
          | moves   | data cards        | 14.3 | manual    | QANOV-355635 |
          | moves   | display cards     | 14.3 | automatic | QANOV-355636 |
          | moves   | naked cards       | 14.8 | manual    | QANOV-448726 |
          | moves   | naked small cards | 14.8 | manual    | QANOV-448727 |
          | moves   | poster cards      | 14.8 | manual    | QANOV-441322 |

    @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | blaude  | featured content  | 13.9 | automatic | QANOV-228402 |
          | blaude  | banner            | 13.9 | manual    | QANOV-228403 |
          | blaude  | vertical cards    | 13.9 | automatic | QANOV-228404 |
          | blaude  | rows              | 13.9 | automatic | QANOV-228405 |
          | blaude  | banner hero       | 14.3 | manual    | QANOV-355637 |
          | blaude  | highlighted cards | 14.3 | automatic | QANOV-525400 |
          | blaude  | data cards        | 14.3 | manual    | QANOV-355638 |
          | blaude  | display cards     | 14.3 | automatic | QANOV-355639 |
          | blaude  | naked cards       | 14.8 | manual    | QANOV-448728 |
          | blaude  | naked small cards | 14.8 | manual    | QANOV-448729 |
          | blaude  | poster cards      | 14.8 | manual    | QANOV-441324 |

    Examples:
          | product | module            | cv     | exec_mode | jira_id      |
          | o2de    | featured content  | 14.2   | manual    | QANOV-228406 |
          | o2de    | banner            | 14.2   | manual    | QANOV-228407 |
          | o2de    | vertical cards    | 14.2   | manual    | QANOV-228408 |
          | o2de    | rows              | 14.2   | manual    | QANOV-228409 |
          | o2de    | banner hero       | 14.3   | manual    | QANOV-355640 |
          | o2de    | highlighted cards | 14.3   | manual    | QANOV-525401 |
          | o2de    | data cards        | 14.3   | manual    | QANOV-355641 |
          | o2de    | display cards     | 14.3   | manual    | QANOV-355642 |
          | o2de    | naked cards       | 14.8   | manual    | QANOV-448730 |
          | o2de    | naked small cards | 14.8   | manual    | QANOV-448731 |
          | o2de    | poster cards      | 14.8   | manual    | QANOV-441326 |
          | o2es    | featured content  | Future | manual    | QANOV-417735 |
          | o2es    | banner            | Future | manual    | QANOV-417736 |
          | o2es    | vertical cards    | Future | manual    | QANOV-417737 |
          | o2es    | rows              | Future | manual    | QANOV-417738 |
          | o2es    | banner hero       | Future | manual    | QANOV-417739 |
          | o2es    | highlighted cards | Future | manual    | QANOV-525402 |
          | o2es    | data cards        | Future | manual    | QANOV-417740 |
          | o2es    | display cards     | Future | manual    | QANOV-417741 |
          | o2es    | naked cards       | Future | manual    | QANOV-448732 |
          | o2es    | naked small cards | Future | manual    | QANOV-448733 |
          | o2es    | poster cards      | Future | manual    | QANOV-441328 |

  @jira.<jira_id> @<exec_mode> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  Scenario Outline: User can see an explore "<module>" card without expiration date
    Time is set in the local time. Ex MyO2: The time is GMT+1.
    Given user has a card configured with no expiration date in a "<module>" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @live @next @qa
    Examples:
          | product | module              | cv   | exec_mode | jira_id      |
          | vivobr  | featured content    | 13.3 | automatic | QANOV-98314  |
          | vivobr  | banner              | 13.3 | manual    | QANOV-98315  |
          | vivobr  | vertical cards      | 13.3 | automatic | QANOV-98316  |
          | vivobr  | rows                | 13.3 | automatic | QANOV-98317  |
          | vivobr  | banner hero         | 14.3 | manual    | QANOV-355643 |
          | vivobr  | highlighted cards   | 14.3 | automatic | QANOV-525403 |
          | vivobr  | data cards          | 14.3 | manual    | QANOV-355644 |
          | vivobr  | display cards       | 14.3 | automatic | QANOV-355645 |
          | vivobr  | naked cards         | 14.8 | manual    | QANOV-448734 |
          | vivobr  | naked small cards   | 14.8 | manual    | QANOV-448735 |
          | vivobr  | poster cards        | 14.8 | manual    | QANOV-441330 |
          | vivobr  | data cards advanced | 14.8 | manual    | QANOV-441331 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | o2uk    | featured content  | 13.3 | automatic | QANOV-98318  |
          | o2uk    | banner            | 13.3 | manual    | QANOV-98319  |
          | o2uk    | vertical cards    | 13.3 | automatic | QANOV-98320  |
          | o2uk    | rows              | 13.3 | automatic | QANOV-98321  |
          | o2uk    | banner hero       | 14.3 | manual    | QANOV-355646 |
          | o2uk    | highlighted cards | 14.3 | automatic | QANOV-525404 |
          | o2uk    | data cards        | 14.3 | manual    | QANOV-355647 |
          | o2uk    | display cards     | 14.3 | automatic | QANOV-355648 |
          | o2uk    | naked cards       | 14.8 | manual    | QANOV-448736 |
          | o2uk    | naked small cards | 14.8 | manual    | QANOV-448737 |
          | o2uk    | poster cards      | 14.8 | manual    | QANOV-441332 |

    @cert2 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | moves   | featured content  | 13.3 | automatic | QANOV-98322  |
          | moves   | banner            | 13.3 | manual    | QANOV-98323  |
          | moves   | vertical cards    | 13.3 | automatic | QANOV-98324  |
          | moves   | rows              | 13.3 | automatic | QANOV-98325  |
          | moves   | banner hero       | 14.3 | manual    | QANOV-355649 |
          | moves   | highlighted cards | 14.3 | automatic | QANOV-525405 |
          | moves   | data cards        | 14.3 | manual    | QANOV-355650 |
          | moves   | display cards     | 14.3 | automatic | QANOV-355651 |
          | moves   | naked cards       | 14.8 | manual    | QANOV-448738 |
          | moves   | naked small cards | 14.8 | manual    | QANOV-448739 |
          | moves   | poster cards      | 14.8 | manual    | QANOV-441334 |

    @cert3 @live @next @qa
    Examples:
          | product | module            | cv   | exec_mode | jira_id      |
          | blaude  | featured content  | 13.9 | automatic | QANOV-228410 |
          | blaude  | banner            | 13.9 | manual    | QANOV-228411 |
          | blaude  | vertical cards    | 13.9 | automatic | QANOV-228412 |
          | blaude  | rows              | 13.9 | automatic | QANOV-228413 |
          | blaude  | banner hero       | 14.3 | manual    | QANOV-355652 |
          | blaude  | highlighted cards | 14.3 | automatic | QANOV-525406 |
          | blaude  | data cards        | 14.3 | manual    | QANOV-355653 |
          | blaude  | display cards     | 14.3 | automatic | QANOV-355654 |
          | blaude  | naked cards       | 14.8 | manual    | QANOV-448740 |
          | blaude  | naked small cards | 14.8 | manual    | QANOV-448741 |
          | blaude  | poster cards      | 14.8 | manual    | QANOV-441336 |

    Examples:
          | product | module            | cv     | exec_mode | jira_id      |
          | o2de    | featured content  | 14.2   | manual    | QANOV-228414 |
          | o2de    | banner            | 14.2   | manual    | QANOV-228415 |
          | o2de    | vertical cards    | 14.2   | manual    | QANOV-228416 |
          | o2de    | rows              | 14.2   | manual    | QANOV-228417 |
          | o2de    | banner hero       | 14.3   | manual    | QANOV-355655 |
          | o2de    | highlighted cards | 14.3   | manual    | QANOV-525407 |
          | o2de    | data cards        | 14.3   | manual    | QANOV-355656 |
          | o2de    | display cards     | 14.3   | manual    | QANOV-355657 |
          | o2de    | naked cards       | 14.8   | manual    | QANOV-448742 |
          | o2de    | naked small cards | 14.8   | manual    | QANOV-448743 |
          | o2de    | poster cards      | 14.8   | manual    | QANOV-441338 |
          | o2es    | featured content  | Future | manual    | QANOV-417742 |
          | o2es    | banner            | Future | manual    | QANOV-417743 |
          | o2es    | vertical cards    | Future | manual    | QANOV-417744 |
          | o2es    | rows              | Future | manual    | QANOV-417745 |
          | o2es    | banner hero       | Future | manual    | QANOV-417746 |
          | o2es    | highlighted cards | Future | manual    | QANOV-525408 |
          | o2es    | data cards        | Future | manual    | QANOV-417747 |
          | o2es    | display cards     | Future | manual    | QANOV-417748 |
          | o2es    | naked cards       | Future | manual    | QANOV-448744 |
          | o2es    | naked small cards | Future | manual    | QANOV-448745 |
          | o2es    | poster cards      | Future | manual    | QANOV-441340 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the countdown timer instead of the tag in a <module> card with both options configured
    Given user has a card configured with expiration date and a tag in a "countdown" timer in a "<module>" module
      And the "countdown" timer is not expired
     Then the "<module>_card_tag" textfield is displayed with the content of the countdowntimer tag

    Examples:
          | product | module           | cv   | jira_id      |
          | vivobr  | featured content | 13.3 | QANOV-189576 |
          | vivobr  | naked cards      | 14.8 | QANOV-441342 |
          | vivobr  | poster cards     | 14.8 | QANOV-442202 |
          | o2uk    | featured content | 13.3 | QANOV-189578 |
          | o2uk    | naked cards      | 14.8 | QANOV-441344 |
          | o2uk    | poster cards     | 14.8 | QANOV-442190 |
          | moves   | featured content | 13.3 | QANOV-189580 |
          | moves   | naked cards      | 14.8 | QANOV-441346 |
          | moves   | poster cards     | 14.8 | QANOV-442191 |
          | blaude  | featured content | 13.9 | QANOV-228418 |
          | blaude  | naked cards      | 14.8 | QANOV-441348 |
          | blaude  | poster cards     | 14.8 | QANOV-442192 |
          | o2de    | featured content | 14.2 | QANOV-228420 |
          | o2de    | naked cards      | 14.8 | QANOV-441350 |
          | o2de    | poster cards     | 14.8 | QANOV-442193 |
          | o2es    | featured content | 14.8 | QANOV-417749 |
          | o2es    | naked cards      | 14.8 | QANOV-441352 |
          | o2es    | poster cards     | 14.8 | QANOV-442195 |
