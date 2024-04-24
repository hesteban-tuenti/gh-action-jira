# -*- coding: utf-8 -*-
@jira.QANOV-10329
Feature: Explore banner

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-29266 @mobile @webapp
  Scenario Outline: User can see a banner module
    Given user has a "banner" module in the Explore content
     When searches the "card"
     Then the selected explore card has the "image_or_bumper" media field displayed

    @automatic @live @next @qa @sanity
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-10330 |

    @automatic @cert0 @cert1 @live @next @qa @sanity
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-10331 |

    @automatic @cert2 @live @next @qa @sanity
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-10332 |

    @automatic @cert3 @live @next @qa @sanity @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228448 |

    Examples:
          | product | cv   | jira_id     |
          | o2de    | 14.2 | QANOV-49236 |

    @manual @sanity
    Examples:
          | product | cv   | jira_id     |
          | o2de    | 14.2 | QANOV-49236 |

    @manual @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407202 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-29275 @mobile @webapp
  Scenario Outline: A link can be shown in a banner module
    Given user has a "banner" module with links in the Explore content
     When searches the banner "module" with "links"
     Then the selected explore "module" has the "links" field displayed

    @automatic @live @next @qa @smoke
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10330 | 13.3 | QANOV-10334 |

    @automatic @cert0 @cert1 @live @next @qa @smoke
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10331 | 13.3 | QANOV-10336 |

    @automatic @cert2 @live @next @qa @smoke
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10332 | 13.3 | QANOV-10338 |

    @automatic @cert3 @live @next @qa @smoke
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228448 | 13.9 | QANOV-228449 |

    @manual @smoke
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2de    | QANOV-49236 | 14.2 | QANOV-49237 |

    @manual @regression
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-407203 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-29310 @mobile @regression
  Scenario Outline: User can access to a link in the banner module
    Given user has a "banner" module with links in the Explore content
     When searches the banner "module" with "links"
      And clicks on the "0" position in the "links" list in the explore "module"
     Then the Explore module link is opened

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10334 | 13.3 | QANOV-10340 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10336 | 13.3 | QANOV-10342 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10338 | 13.3 | QANOV-10344 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228449 | 13.9 | QANOV-228450 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49237 | 14.2   | QANOV-49238  |
          | o2es    |             | Future | QANOV-407204 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201123 @mobile @regression
  Scenario Outline: User can go back to Explore tab after accessing a link in the banner module
    Given user has a "banner" module with links in the Explore content
     When searches the banner "module" with "links"
      And clicks on the "0" position in the "links" list in the explore "module"
      And the Explore module link is opened
      And the Explore module link is closed
     Then the "[CONTEXT:explore_page]" page is displayed

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10334 | 13.3 | QANOV-10346 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10336 | 13.3 | QANOV-10348 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10338 | 13.3 | QANOV-10350 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228450 | 13.9 | QANOV-228451 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49237 | 14.2   | QANOV-49239  |
          | o2es    |             | Future | QANOV-407205 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.2 @manual @mobile @regression
  Scenario Outline: A user can see more than one link in a banner module
    Given user has a "banner" module with ">1" links in the Explore content
     When searches the banner "module" with "links"
     Then the "liks" list has "[CONTEXT:bottom_links_number]" elements

    @jira.cv.13.2
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-417301 |
          | o2uk    | QANOV-417302 |
          | moves   | QANOV-417303 |
          | blaude  | QANOV-417304 |
          | o2de    | QANOV-417305 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-417813 |
