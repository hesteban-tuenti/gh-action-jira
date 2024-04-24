# -*- coding: utf-8 -*-
@jira.QANOV-478868
Feature: Carousel modules

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-195448 @mobile @regression
  Scenario Outline: User can scroll the carousel in a <module_type> Explore module
    Given user has a "<module_type>" module scrollable
     When searches the "module"
      And displays the "carousel" in the "module" explore element
      And waits "2" seconds
      And takes a screenshot
      And swipes the carousel from "right to left" in the selected explore module
      And waits "2" seconds
      And displays the "carousel" in the "module" explore element
     Then check that the screen is not in the previous state with threshold "0.05"

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-10148  |
          | vivobr  | vertical cards    | 13.3 | QANOV-67233  |
          | vivobr  | highlighted cards | 13.3 | QANOV-285880 |
          | vivobr  | display cards     | 13.3 | QANOV-343850 |

    @automatic @cert0 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-10149  |
          | o2uk    | vertical cards    | 13.3 | QANOV-67234  |
          | o2uk    | highlighted cards | 13.3 | QANOV-285881 |
          | o2uk    | display cards     | 13.3 | QANOV-343851 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-10150  |
          | moves   | vertical cards    | 13.3 | QANOV-67235  |
          | moves   | highlighted cards | 13.3 | QANOV-285882 |
          | moves   | display cards     | 13.3 | QANOV-343854 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228487 |
          | blaude  | vertical cards    | 13.9 | QANOV-228525 |
          | blaude  | highlighted cards | 13.3 | QANOV-285883 |
          | blaude  | display cards     | 13.3 | QANOV-343852 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 13.3   | QANOV-343762 |
          | vivobr  | naked cards         | 14.8   | QANOV-448826 |
          | vivobr  | naked small cards   | 14.8   | QANOV-448875 |
          | vivobr  | data cards advanced | 14.8   | QANOV-446187 |
          | o2uk    | data cards          | 13.3   | QANOV-343763 |
          | o2uk    | naked cards         | 14.8   | QANOV-448827 |
          | o2uk    | naked small cards   | 14.8   | QANOV-448876 |
          | moves   | data cards          | 13.3   | QANOV-297850 |
          | moves   | naked cards         | 14.8   | QANOV-448830 |
          | moves   | naked small cards   | 14.8   | QANOV-448879 |
          | blaude  | data cards          | 13.3   | QANOV-343764 |
          | blaude  | naked cards         | 14.8   | QANOV-448828 |
          | blaude  | naked small cards   | 14.8   | QANOV-448877 |
          | o2de    | featured content    | 14.2   | QANOV-49220  |
          | o2de    | vertical cards      | 14.2   | QANOV-207574 |
          | o2de    | highlighted cards   | 13.3   | QANOV-285884 |
          | o2de    | display cards       | 13.3   | QANOV-343853 |
          | o2de    | data cards          | 13.3   | QANOV-343765 |
          | o2de    | naked cards         | 14.8   | QANOV-448829 |
          | o2de    | naked small cards   | 14.8   | QANOV-448878 |
          | o2es    | featured content    | Future | QANOV-415166 |
          | o2es    | vertical cards      | Future | QANOV-407249 |
          | o2es    | highlighted cards   | Future | QANOV-370131 |
          | o2es    | display cards       | Future | QANOV-407141 |
          | o2es    | data cards          | Future | QANOV-407199 |
          | o2es    | naked cards         | Future | QANOV-448831 |
          | o2es    | naked small cards   | Future | QANOV-448880 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User who scrolls the carousel in a "<module_type>" module will see it in the same position after scrolling down and up again
    Set to manual temporarily until visual testing is provides reliable results
    This scenario makes two scrolls down to ensure the carousel is not visible in the screen the step
    search the module will make it visible afterwards.
    Given user has a "<module_type>" module scrollable
     When searches the "module"
      And I switch to the native context
      And I do "1" swipes from bottom to top
      And swipes the carousel from "right to left" in the selected explore module
      And waits "2" seconds
      And displays the "carousel" in the "module" explore element
      And takes a screenshot
      And I do "1" swipes from bottom to top
      And displays the "carousel" in the "module" explore element
      And waits "2" seconds
     Then check that the screen is in the previous state with threshold "0.05"

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-10185  |
          | vivobr  | vertical cards    | 13.3 | QANOV-554113 |
          | vivobr  | highlighted cards | 13.3 | QANOV-554114 |
          | vivobr  | display cards     | 13.3 | QANOV-554115 |

    @automatic @cert0 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-10189  |
          | o2uk    | vertical cards    | 13.3 | QANOV-554117 |
          | o2uk    | highlighted cards | 13.3 | QANOV-554118 |
          | o2uk    | display cards     | 13.3 | QANOV-554119 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-10193  |
          | moves   | vertical cards    | 13.3 | QANOV-554120 |
          | moves   | highlighted cards | 13.3 | QANOV-554121 |
          | moves   | display cards     | 13.3 | QANOV-554122 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228496 |
          | blaude  | vertical cards    | 13.3 | QANOV-554123 |
          | blaude  | highlighted cards | 13.3 | QANOV-554124 |
          | blaude  | display cards     | 13.3 | QANOV-554125 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 13.3   | QANOV-554126 |
          | vivobr  | naked cards         | 14.8   | QANOV-554127 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554128 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554129 |
          | o2uk    | data cards          | 13.3   | QANOV-554130 |
          | o2uk    | naked cards         | 14.8   | QANOV-554131 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554132 |
          | moves   | data cards          | 13.3   | QANOV-554133 |
          | moves   | naked cards         | 14.8   | QANOV-554134 |
          | moves   | naked small cards   | 14.8   | QANOV-554136 |
          | blaude  | data cards          | 13.3   | QANOV-554137 |
          | blaude  | naked cards         | 14.8   | QANOV-554138 |
          | blaude  | naked small cards   | 14.8   | QANOV-554139 |
          | o2de    | featured content    | 14.2   | QANOV-49229  |
          | o2de    | vertical cards      | 13.3   | QANOV-554140 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554141 |
          | o2de    | display cards       | 13.3   | QANOV-554142 |
          | o2de    | data cards          | 13.3   | QANOV-554143 |
          | o2de    | naked cards         | 14.8   | QANOV-554144 |
          | o2de    | naked small cards   | 14.8   | QANOV-554145 |
          | o2es    | featured content    | Future | QANOV-415173 |
          | o2es    | vertical cards      | Future | QANOV-554146 |
          | o2es    | highlighted cards   | Future | QANOV-554147 |
          | o2es    | display cards       | Future | QANOV-554148 |
          | o2es    | data cards          | Future | QANOV-554149 |
          | o2es    | naked cards         | Future | QANOV-554150 |
          | o2es    | naked small cards   | Future | QANOV-554152 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User who scrolls the carousel in a "<module_type>" module will see it in the same position after changing tab and back
    Set to manual temporarily until visual testing is provides reliable results
    Given user has a "<module_type>" module scrollable
     When searches the "module"
      And I switch to the native context
      And I do "1" swipes from bottom to top
      And swipes the carousel from "right to left" in the selected explore module
      And waits "2" seconds
      And displays the "carousel" in the "module" explore element
      And takes a screenshot
      And user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_tab_bar.explore_tab" button
      And displays the "carousel" in the "module" explore element
      And waits "2" seconds
     Then check that the screen is in the previous state with threshold "0.15"

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-10197  |
          | vivobr  | vertical cards    | 13.3 | QANOV-554153 |
          | vivobr  | highlighted cards | 13.3 | QANOV-554154 |
          | vivobr  | display cards     | 13.3 | QANOV-554155 |

    @automatic @cert0 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-10201  |
          | o2uk    | vertical cards    | 13.3 | QANOV-554156 |
          | o2uk    | highlighted cards | 13.3 | QANOV-554157 |
          | o2uk    | display cards     | 13.3 | QANOV-554158 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-10205  |
          | moves   | vertical cards    | 13.3 | QANOV-554160 |
          | moves   | highlighted cards | 13.3 | QANOV-554161 |
          | moves   | display cards     | 13.3 | QANOV-554162 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228497 |
          | blaude  | vertical cards    | 13.3 | QANOV-554163 |
          | blaude  | highlighted cards | 13.3 | QANOV-554164 |
          | blaude  | display cards     | 13.3 | QANOV-554165 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 13.3   | QANOV-554166 |
          | vivobr  | naked cards         | 14.8   | QANOV-554167 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554168 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554169 |
          | o2uk    | data cards          | 13.3   | QANOV-554170 |
          | o2uk    | naked cards         | 14.8   | QANOV-554171 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554172 |
          | moves   | data cards          | 13.3   | QANOV-554173 |
          | moves   | naked cards         | 14.8   | QANOV-554174 |
          | moves   | naked small cards   | 14.8   | QANOV-554175 |
          | blaude  | data cards          | 13.3   | QANOV-554177 |
          | blaude  | naked cards         | 14.8   | QANOV-554178 |
          | blaude  | naked small cards   | 14.8   | QANOV-554179 |
          | o2de    | featured content    | 14.2   | QANOV-49231  |
          | o2de    | vertical cards      | 13.3   | QANOV-554180 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554182 |
          | o2de    | data cards          | 13.3   | QANOV-554183 |
          | o2de    | naked cards         | 14.8   | QANOV-554184 |
          | o2de    | naked small cards   | 14.8   | QANOV-554185 |
          | o2de    | display cards       | 13.3   | QANOV-554186 |
          | o2es    | featured content    | Future | QANOV-415174 |
          | o2es    | vertical cards      | Future | QANOV-554187 |
          | o2es    | highlighted cards   | Future | QANOV-554188 |
          | o2es    | display cards       | Future | QANOV-554189 |
          | o2es    | data cards          | Future | QANOV-554190 |
          | o2es    | naked cards         | Future | QANOV-554191 |
          | o2es    | naked small cards   | Future | QANOV-554192 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @smoke
  Scenario Outline: User can see the carousel in a "<module_type>" module starts playing automatically when autoplay is enabled in the module
    Set to manual temporarily until visual testing is provides reliable results
    The carousel moves forward automatically every 5 seconds. This is set via config
    Given user has a "<module_type>" module with autoplay
     When searches the "module"
      And displays the "carousel" in the "module" explore element
      And waits "2" seconds
      And takes a screenshot
      And waits "5" seconds
     Then check that the screen is not in the previous state with threshold "0.05"

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.9 | QANOV-293810 |
          | vivobr  | vertical cards    | 13.3 | QANOV-554193 |
          | vivobr  | highlighted cards | 13.3 | QANOV-554194 |
          | vivobr  | display cards     | 13.3 | QANOV-554195 |

    @automatic @cert0 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.9 | QANOV-293811 |
          | o2uk    | vertical cards    | 13.3 | QANOV-554196 |
          | o2uk    | highlighted cards | 13.3 | QANOV-554197 |
          | o2uk    | display cards     | 13.3 | QANOV-554198 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.9 | QANOV-293812 |
          | moves   | vertical cards    | 13.3 | QANOV-554199 |
          | moves   | highlighted cards | 13.3 | QANOV-554200 |
          | moves   | display cards     | 13.3 | QANOV-554202 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-293813 |
          | blaude  | vertical cards    | 13.3 | QANOV-554203 |
          | blaude  | highlighted cards | 13.3 | QANOV-554204 |
          | blaude  | display cards     | 13.3 | QANOV-554205 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 13.3   | QANOV-554206 |
          | vivobr  | naked cards         | 14.8   | QANOV-554207 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554208 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554209 |
          | o2uk    | data cards          | 13.3   | QANOV-554210 |
          | o2uk    | naked cards         | 14.8   | QANOV-554211 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554212 |
          | moves   | data cards          | 13.3   | QANOV-554213 |
          | moves   | naked cards         | 14.8   | QANOV-554214 |
          | moves   | naked small cards   | 14.8   | QANOV-554215 |
          | blaude  | data cards          | 13.3   | QANOV-554216 |
          | blaude  | naked cards         | 14.8   | QANOV-554217 |
          | blaude  | naked small cards   | 14.8   | QANOV-554218 |
          | o2de    | featured content    | 13.9   | QANOV-293814 |
          | o2de    | vertical cards      | 13.3   | QANOV-554219 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554220 |
          | o2de    | display cards       | 13.3   | QANOV-554221 |
          | o2de    | data cards          | 13.3   | QANOV-554222 |
          | o2de    | naked cards         | 14.8   | QANOV-554223 |
          | o2de    | naked small cards   | 14.8   | QANOV-554224 |
          | o2de    | display cards       | 13.3   | QANOV-554227 |
          | o2es    | featured content    | Future | QANOV-415175 |
          | o2es    | vertical cards      | Future | QANOV-554228 |
          | o2es    | highlighted cards   | Future | QANOV-554229 |
          | o2es    | display cards       | Future | QANOV-554230 |
          | o2es    | data cards          | Future | QANOV-554231 |
          | o2es    | naked cards         | Future | QANOV-554232 |
          | o2es    | naked small cards   | Future | QANOV-554233 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @smoke
  Scenario Outline: User can see the carousel in a "<module_type>" module stops at the end of the carousel when autoplay is enabled and play-in-loop disabled
    Set to manual temporarily until visual testing is provides reliable results
    The carousel moves forward automatically every 5 seconds. This is set via config
    Given user has a "<module_type>" module with autoplay and play-in-loop "disabled"
     When searches the "module"
      And waits "([CONTEXT:num_cards]-1)*5" seconds
      And displays the "carousel" in the "module" explore element
      And waits "2" seconds
      And takes a screenshot
      And waits "5" seconds
     Then check that the screen is in the previous state with threshold "0.15"

    @live @manual @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.9 | QANOV-268244 |
          | vivobr  | vertical cards    | 13.3 | QANOV-268274 |
          | vivobr  | highlighted cards | 13.3 | QANOV-554234 |
          | vivobr  | display cards     | 13.3 | QANOV-554235 |

    @automatic @cert0 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.9 | QANOV-268245 |
          | o2uk    | vertical cards    | 13.3 | QANOV-268275 |
          | o2uk    | highlighted cards | 13.3 | QANOV-554236 |
          | o2uk    | display cards     | 13.3 | QANOV-554237 |

    @cert2 @live @manual @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.9 | QANOV-268246 |
          | moves   | vertical cards    | 13.3 | QANOV-268276 |
          | moves   | highlighted cards | 13.3 | QANOV-554238 |
          | moves   | display cards     | 13.3 | QANOV-554239 |

    @cert3 @live @manual @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-268247 |
          | blaude  | vertical cards    | 13.3 | QANOV-268277 |
          | blaude  | highlighted cards | 13.3 | QANOV-554240 |
          | blaude  | display cards     | 13.3 | QANOV-554241 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 13.3   | QANOV-554242 |
          | vivobr  | naked cards         | 14.8   | QANOV-554243 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554244 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554245 |
          | o2uk    | data cards          | 13.3   | QANOV-554247 |
          | o2uk    | naked cards         | 14.8   | QANOV-554248 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554249 |
          | moves   | data cards          | 13.3   | QANOV-554250 |
          | moves   | naked cards         | 14.8   | QANOV-554251 |
          | moves   | naked small cards   | 14.8   | QANOV-554252 |
          | blaude  | data cards          | 13.3   | QANOV-554253 |
          | blaude  | naked cards         | 14.8   | QANOV-554254 |
          | blaude  | naked small cards   | 14.8   | QANOV-554255 |
          | o2de    | featured content    | 13.9   | QANOV-268248 |
          | o2de    | vertical cards      | 13.3   | QANOV-268278 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554256 |
          | o2de    | display cards       | 13.3   | QANOV-554257 |
          | o2de    | data cards          | 13.3   | QANOV-554258 |
          | o2de    | naked cards         | 14.8   | QANOV-554259 |
          | o2de    | naked small cards   | 14.8   | QANOV-554260 |
          | o2es    | featured content    | Future | QANOV-415176 |
          | o2es    | vertical cards      | Future | QANOV-407252 |
          | o2es    | highlighted cards   | Future | QANOV-554261 |
          | o2es    | display cards       | Future | QANOV-554262 |
          | o2es    | data cards          | Future | QANOV-554263 |
          | o2es    | naked cards         | Future | QANOV-554264 |
          | o2es    | naked small cards   | Future | QANOV-554265 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the carousel in a "<module_type>" module playing in loop when autoplay and play-in-loop are enabled
    Given user has a "<module_type>" module with autoplay and play-in-loop "enabled"
     When searches the "module"
      And the carousel shows the first card of the module
     Then the carousel moves forward automatically every "5" seconds
      And the carousel shows the first card after reaching the last card of the module

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 13.9   | QANOV-268249 |
          | vivobr  | vertical cards      | 13.3   | QANOV-268279 |
          | vivobr  | highlighted cards   | 13.3   | QANOV-554266 |
          | vivobr  | display cards       | 13.3   | QANOV-554268 |
          | vivobr  | data cards          | 13.3   | QANOV-554269 |
          | vivobr  | naked cards         | 14.8   | QANOV-554270 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554271 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554272 |
          | o2uk    | featured content    | 13.9   | QANOV-268250 |
          | o2uk    | vertical cards      | 13.3   | QANOV-268280 |
          | o2uk    | highlighted cards   | 13.3   | QANOV-554273 |
          | o2uk    | display cards       | 13.3   | QANOV-554274 |
          | o2uk    | data cards          | 13.3   | QANOV-554275 |
          | o2uk    | naked cards         | 14.8   | QANOV-554276 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554277 |
          | moves   | featured content    | 13.9   | QANOV-268251 |
          | moves   | vertical cards      | 13.3   | QANOV-268281 |
          | moves   | highlighted cards   | 13.3   | QANOV-554278 |
          | moves   | display cards       | 13.3   | QANOV-554279 |
          | moves   | data cards          | 13.3   | QANOV-554280 |
          | moves   | naked cards         | 14.8   | QANOV-554281 |
          | moves   | naked small cards   | 14.8   | QANOV-554282 |
          | blaude  | featured content    | 13.9   | QANOV-268252 |
          | blaude  | vertical cards      | 13.3   | QANOV-268282 |
          | blaude  | highlighted cards   | 13.3   | QANOV-554284 |
          | blaude  | display cards       | 13.3   | QANOV-554285 |
          | blaude  | data cards          | 13.3   | QANOV-554286 |
          | blaude  | naked cards         | 14.8   | QANOV-554287 |
          | blaude  | naked small cards   | 14.8   | QANOV-554288 |
          | o2de    | featured content    | 13.9   | QANOV-268253 |
          | o2de    | vertical cards      | 13.3   | QANOV-268283 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554289 |
          | o2de    | display cards       | 13.3   | QANOV-554290 |
          | o2de    | data cards          | 13.3   | QANOV-554291 |
          | o2de    | naked cards         | 14.8   | QANOV-554292 |
          | o2de    | naked small cards   | 14.8   | QANOV-554293 |
          | o2de    | display cards       | 13.3   | QANOV-554294 |
          | o2es    | featured content    | Future | QANOV-415177 |
          | o2es    | vertical cards      | Future | QANOV-407253 |
          | o2es    | highlighted cards   | Future | QANOV-554295 |
          | o2es    | display cards       | Future | QANOV-554296 |
          | o2es    | data cards          | Future | QANOV-554297 |
          | o2es    | naked cards         | Future | QANOV-554298 |
          | o2es    | naked small cards   | Future | QANOV-554299 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the carousel in a "<module_type>" module in the same position after scrolling down and up again when autoplay is enabled
    This scenario makes two scrolls down to ensure the carousel is not visible in the screen the step
    search the module will make it visible afterwards.
    Given user has a "<module_type>" module with autoplay
     When searches the "module"
      And the carousel shows the first card of the module
      And the carousel moves forward automatically every "5" seconds
      And I do "1" swipes from bottom to top
      And searches the "module"
     Then the carousel shows the last card shown previously

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 13.9   | QANOV-268254 |
          | vivobr  | vertical cards      | 13.3   | QANOV-554300 |
          | vivobr  | highlighted cards   | 13.3   | QANOV-554301 |
          | vivobr  | display cards       | 13.3   | QANOV-554302 |
          | vivobr  | data cards          | 13.3   | QANOV-554303 |
          | vivobr  | naked cards         | 14.8   | QANOV-554305 |
          | vivobr  | naked small cards   | 14.8   | QANOV-554306 |
          | vivobr  | data cards advanced | 14.8   | QANOV-554307 |
          | o2uk    | featured content    | 13.9   | QANOV-268255 |
          | o2uk    | vertical cards      | 13.3   | QANOV-554308 |
          | o2uk    | highlighted cards   | 13.3   | QANOV-554309 |
          | o2uk    | display cards       | 13.3   | QANOV-554310 |
          | o2uk    | data cards          | 13.3   | QANOV-554311 |
          | o2uk    | naked cards         | 14.8   | QANOV-554312 |
          | o2uk    | naked small cards   | 14.8   | QANOV-554313 |
          | moves   | featured content    | 13.9   | QANOV-268256 |
          | moves   | vertical cards      | 13.3   | QANOV-554314 |
          | moves   | highlighted cards   | 13.3   | QANOV-554315 |
          | moves   | display cards       | 13.3   | QANOV-554316 |
          | moves   | data cards          | 13.3   | QANOV-554317 |
          | moves   | naked cards         | 14.8   | QANOV-554318 |
          | moves   | naked small cards   | 14.8   | QANOV-554319 |
          | blaude  | featured content    | 13.9   | QANOV-268257 |
          | blaude  | vertical cards      | 13.3   | QANOV-554320 |
          | blaude  | highlighted cards   | 13.3   | QANOV-554321 |
          | blaude  | display cards       | 13.3   | QANOV-554322 |
          | blaude  | data cards          | 13.3   | QANOV-554323 |
          | blaude  | naked cards         | 14.8   | QANOV-554324 |
          | blaude  | naked small cards   | 14.8   | QANOV-554325 |
          | o2de    | featured content    | 13.9   | QANOV-268258 |
          | o2de    | vertical cards      | 13.3   | QANOV-554326 |
          | o2de    | highlighted cards   | 13.3   | QANOV-554327 |
          | o2de    | display cards       | 13.3   | QANOV-554328 |
          | o2de    | data cards          | 13.3   | QANOV-554329 |
          | o2de    | naked cards         | 14.8   | QANOV-554330 |
          | o2de    | naked small cards   | 14.8   | QANOV-554331 |
          | o2es    | featured content    | Future | QANOV-415178 |
          | o2es    | vertical cards      | Future | QANOV-554332 |
          | o2es    | highlighted cards   | Future | QANOV-554333 |
          | o2es    | display cards       | Future | QANOV-554334 |
          | o2es    | data cards          | Future | QANOV-554335 |
          | o2es    | naked cards         | Future | QANOV-554336 |
          | o2es    | naked small cards   | Future | QANOV-554337 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the carousel in a "<module_type>" module in the same position after moving automatically, change tab and back when autoplay is enabled
    Given user has a "featured content" module with autoplay
     When searches the "module"
      And the carousel shows the first card of the module
      And the carousel moves forward automatically every "5" seconds
      And clicks on the "navigation_tab_bar.support_tab" button
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the carousel shows the last card shown previously

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 13.9   | QANOV-268259 |
          | o2uk    | 13.9   | QANOV-268260 |
          | moves   | 13.9   | QANOV-268261 |
          | blaude  | 13.9   | QANOV-268262 |
          | o2de    | 13.9   | QANOV-268263 |
          | o2es    | Future | QANOV-415179 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: User sees the navball when <module_type> module has more than one card and doesn't have a bottom link
    Poster cards aren't carousel modules but slideshow
    Given user has a "<module_type>" module with more than "1" card and without bottom link
     When searches the "module"
     Then the selected explore "module" has the "navball" field displayed

    @automatic @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv    | jira_id      |
          | vivobr  | featured content  | 13.10 | QANOV-285368 |
          | vivobr  | vertical cards    | 13.10 | QANOV-285380 |
          | vivobr  | highlighted cards | 14.6  | QANOV-478869 |
          | vivobr  | display cards     | 14.3  | QANOV-478874 |

    @automatic @cert0 @cert1 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv    | jira_id      |
          | o2uk    | featured content  | 13.10 | QANOV-285366 |
          | o2uk    | vertical cards    | 13.10 | QANOV-285378 |
          | o2uk    | highlighted cards | 14.6  | QANOV-478870 |
          | o2uk    | display cards     | 14.3  | QANOV-478880 |

    @automatic @cert2 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv    | jira_id      |
          | moves   | featured content  | 13.10 | QANOV-285367 |
          | moves   | vertical cards    | 13.10 | QANOV-285379 |
          | moves   | highlighted cards | 14.6  | QANOV-478871 |
          | moves   | display cards     | 14.3  | QANOV-478885 |

    @automatic @cert3 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv    | jira_id      |
          | blaude  | featured content  | 13.10 | QANOV-285369 |
          | blaude  | vertical cards    | 13.10 | QANOV-285381 |
          | blaude  | highlighted cards | 14.6  | QANOV-478872 |
          | blaude  | display cards     | 14.3  | QANOV-478890 |

    @manual @regression
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 14.3   | QANOV-478873 |
          | vivobr  | display cards       | 14.3   | QANOV-478874 |
          | vivobr  | poster cards        | 14.8   | QANOV-478875 |
          | vivobr  | naked cards         | 14.8   | QANOV-478876 |
          | vivobr  | naked small cards   | 14.8   | QANOV-478877 |
          | vivobr  | data cards advanced | 14.8   | QANOV-478878 |
          | o2uk    | data cards          | 14.3   | QANOV-478879 |
          | o2uk    | display cards       | 14.3   | QANOV-478880 |
          | o2uk    | naked cards         | 14.8   | QANOV-478881 |
          | o2uk    | naked small cards   | 14.8   | QANOV-478882 |
          | moves   | data cards          | 14.3   | QANOV-478884 |
          | moves   | display cards       | 14.3   | QANOV-478885 |
          | moves   | naked cards         | 14.8   | QANOV-478886 |
          | moves   | naked small cards   | 14.8   | QANOV-478887 |
          | blaude  | data cards          | 14.3   | QANOV-478889 |
          | blaude  | display cards       | 14.3   | QANOV-478890 |
          | blaude  | naked cards         | 14.8   | QANOV-478891 |
          | blaude  | naked small cards   | 14.8   | QANOV-478892 |
          | o2de    | featured content    | 14.2   | QANOV-285577 |
          | o2de    | vertical cards      | 14.2   | QANOV-285580 |
          | o2de    | highlighted cards   | 14.6   | QANOV-478894 |
          | o2de    | data cards          | 14.3   | QANOV-478895 |
          | o2de    | display cards       | 14.8   | QANOV-478896 |
          | o2de    | naked cards         | 14.8   | QANOV-478897 |
          | o2de    | naked small cards   | 14.8   | QANOV-478898 |
          | o2es    | featured content    | Future | QANOV-415167 |
          | o2es    | vertical cards      | Future | QANOV-407250 |
          | o2es    | highlighted cards   | Future | QANOV-478900 |
          | o2es    | data cards          | Future | QANOV-478901 |
          | o2es    | display cards       | Future | QANOV-478902 |
          | o2es    | naked cards         | Future | QANOV-478903 |
          | o2es    | naked small cards   | Future | QANOV-478904 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: User won't see the navball when <module_type> module in Digital hub apps
    Poster cards aren't carousel modules but slideshow
    Given user has a "<module_type>" module with more than "1" card and without bottom link
     When searches the "module"
     Then the selected explore "module" has the "navball" field displayed

    @Future @manual @regression
    Examples:
          | product | module_type        | cv     | jira_id      |
          | vivobr  | featured content   | Future | QANOV-478906 |
          | vivobr  | vertical cards     | Future | QANOV-478907 |
          | vivobr  | highlighted cards  | Future | QANOV-478908 |
          | vivobr  | data cards         | Future | QANOV-478909 |
          | vivobr  | display cards      | Future | QANOV-478910 |
          | vivobr  | poster cards       | Future | QANOV-478911 |
          | vivobr  | naked cards        | Future | QANOV-478912 |
          | vivobr  | naked small cards  | Future | QANOV-478913 |
          | vivobr  | data cards advance | Future | QANOV-478914 |
          | o2uk    | featured content   | Future | QANOV-478915 |
          | o2uk    | vertical cards     | Future | QANOV-478916 |
          | o2uk    | highlighted cards  | Future | QANOV-478917 |
          | o2uk    | data cards         | Future | QANOV-478918 |
          | o2uk    | display cards      | Future | QANOV-478919 |
          | o2uk    | naked cards        | Future | QANOV-478920 |
          | o2uk    | naked small cards  | Future | QANOV-478921 |
          | moves   | featured content   | Future | QANOV-478923 |
          | moves   | vertical cards     | Future | QANOV-478924 |
          | moves   | highlighted cards  | Future | QANOV-478925 |
          | moves   | data cards         | Future | QANOV-478926 |
          | moves   | display cards      | Future | QANOV-478927 |
          | moves   | naked cards        | Future | QANOV-478928 |
          | moves   | naked small cards  | Future | QANOV-478929 |
          | blaude  | featured content   | Future | QANOV-478931 |
          | blaude  | vertical cards     | Future | QANOV-478932 |
          | blaude  | highlighted cards  | Future | QANOV-478933 |
          | blaude  | data cards         | Future | QANOV-478934 |
          | blaude  | display cards      | Future | QANOV-478935 |
          | blaude  | naked cards        | Future | QANOV-478936 |
          | blaude  | naked small cards  | Future | QANOV-478937 |
          | o2de    | featured content   | Future | QANOV-478939 |
          | o2de    | vertical cards     | Future | QANOV-478940 |
          | o2de    | highlighted cards  | Future | QANOV-478941 |
          | o2de    | data cards         | Future | QANOV-478942 |
          | o2de    | display cards      | Future | QANOV-478943 |
          | o2de    | naked cards        | Future | QANOV-478944 |
          | o2de    | naked small cards  | Future | QANOV-478945 |
          | o2es    | featured content   | Future | QANOV-478947 |
          | o2es    | vertical cards     | Future | QANOV-478948 |
          | o2es    | highlighted cards  | Future | QANOV-478949 |
          | o2es    | data cards         | Future | QANOV-478950 |
          | o2es    | display cards      | Future | QANOV-478951 |
          | o2es    | naked cards        | Future | QANOV-478952 |
          | o2es    | naked small cards  | Future | QANOV-478953 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @manual
  Scenario Outline: User sees the navball updates position when scrolls the <module_type> module
    Given user has a "<module_type>" module with more than "1" card and without bottom link
     When searches the "module"
      And swipes the carousel from "right to left" in the selected explore module
     Then the navball does not have the "0" index selected

    Examples:
          | product | module_type         | cv     | jira_id      |
          | o2uk    | featured content    | 13.10  | QANOV-478955 |
          | o2uk    | vertical cards      | 13.10  | QANOV-478956 |
          | o2uk    | highlighted cards   | 14.6   | QANOV-478957 |
          | o2uk    | data cards          | 14.3   | QANOV-478958 |
          | o2uk    | display cards       | 14.3   | QANOV-478959 |
          | o2uk    | naked cards         | 14.8   | QANOV-478960 |
          | o2uk    | naked small cards   | 14.8   | QANOV-478961 |
          | moves   | featured content    | 13.10  | QANOV-478963 |
          | moves   | vertical cards      | 13.10  | QANOV-478964 |
          | moves   | highlighted cards   | 14.6   | QANOV-478965 |
          | moves   | data cards          | 14.3   | QANOV-478966 |
          | moves   | display cards       | 14.3   | QANOV-478967 |
          | moves   | naked cards         | 14.8   | QANOV-478968 |
          | moves   | naked small cards   | 14.8   | QANOV-478969 |
          | vivobr  | featured content    | 13.10  | QANOV-478971 |
          | vivobr  | vertical cards      | 13.10  | QANOV-478972 |
          | vivobr  | highlighted cards   | 14.6   | QANOV-478973 |
          | vivobr  | data cards          | 14.3   | QANOV-478974 |
          | vivobr  | display cards       | 14.3   | QANOV-478975 |
          | vivobr  | poster cards        | 14.8   | QANOV-478976 |
          | vivobr  | naked cards         | 14.8   | QANOV-478977 |
          | vivobr  | naked small cards   | 14.8   | QANOV-478978 |
          | vivobr  | data cards advanced | 14.8   | QANOV-478979 |
          | blaude  | featured content    | 13.10  | QANOV-478980 |
          | blaude  | vertical cards      | 13.10  | QANOV-478981 |
          | blaude  | highlighted cards   | 14.6   | QANOV-478982 |
          | blaude  | data cards          | 14.3   | QANOV-478983 |
          | blaude  | display cards       | 14.3   | QANOV-478984 |
          | blaude  | naked cards         | 14.8   | QANOV-478985 |
          | blaude  | naked small cards   | 14.8   | QANOV-478986 |
          | o2de    | featured content    | 14.2   | QANOV-478988 |
          | o2de    | vertical cards      | 13.10  | QANOV-478989 |
          | o2de    | highlighted cards   | 14.6   | QANOV-478990 |
          | o2de    | data cards          | 14.3   | QANOV-478991 |
          | o2de    | display cards       | 14.8   | QANOV-478992 |
          | o2de    | naked cards         | 14.8   | QANOV-478993 |
          | o2de    | naked small cards   | 14.8   | QANOV-478994 |
          | o2es    | featured content    | Future | QANOV-478996 |
          | o2es    | vertical cards      | 13.10  | QANOV-478997 |
          | o2es    | highlighted cards   | 14.6   | QANOV-478998 |
          | o2es    | data cards          | Future | QANOV-478999 |
          | o2es    | display cards       | Future | QANOV-479000 |
          | o2es    | naked cards         | Future | QANOV-479001 |
          | o2es    | naked small cards   | Future | QANOV-479002 |
