# Documentation of Updated Layouts System

## Overview

New layouts for the Genny system. Instead of using json files which describe react element trees, this system uses only base entities and links to form the basis of each page. Changing the layout, content, or styling of a page is achieved by changing the base entities or links between them.

A layout is made of two types of base entities -  **Frames** (positional elements) and **Themes** (styling) - and the content is displayed is derived from **Asks** (Question Groups and Questions). The relationships between each of these entities is controlled by **Links** (relation description).

## Frames ( prefix: FRM_ )

The **Frame** base entity is the basic building block of the layout. Each **Frame** has five (5) **Panels**; **North**, **South**, **East**, **West**, and **Centre**. The panel layout is as follows:

![Panel Layout](https://i.imgur.com/7hj8n7r.png)

Each **Panel** has predefined default behaviour that allows content within it to be display in a way that is easily predictable and controllable by the backend. This behaviour can be overridden if desired.

- A **Panel** will only be rendered if it has content.
- The **Centre Panel** will always expand to fill the space available. Content will be positioned in the **middle** of the panel.
- The **East Panel** will fit its content, *unless* there is no **Centre Panel**, in which case it will expand to fill the space available. Content will be positioned against the **right side** of the panel.
- The **West Panel** will fit its content, *unless* there is no **Centre Panel**, in which case it will expand to fill the space available.
space available. Content will be positioned against the **left side** of the panel.
- The **North Panel** will fit its content, *unless* there are no **East**, **West**, or **Centre Panels**, in which case it will expand to fill the space available.  Content will be positioned against the **top** of the panel.
- The **South Panel** will fit its content, *unless* there are no **East**, **West**, or **Centre Panels**, in which case it will expand to fill the space available. Content will be positioned against the **bottom** of the panel.

#### Frame Base Entity Structure
```
{
  "baseEntityAttributes": [],
  "code": "FRM_XXX",
  "created": "2019-02-06T04:24:10",
  "delete": false,
  "id": 1001,
  "index": 0,
  "links": [],
  "name": "Frame Name",
  "realm": "genny",
  "replace": true,
  "shouldDeleteLinkedBaseEntities": false,
  "totalCount": 1,
  "updated": "2019-02-06T04:24:10"
}
```

#### Frame Fields
TBD

#### Frame Attributes
| Option | Value Type | Example | Required | Description |
| ------ | ---------- | ------- | -------- | ----------- |
| PRI_EXPANDABLE_PANELS | Array | [ 'CENTRE', 'WEST' ] | false | Allows the defined Panels to be expanded to fullscreen by pressing a small button in the top right corner. |

### Themes ( prefix: THM_ )

The **Theme** base entity contains all the styling information for other rendered elements (**Frames** and **Asks**). The value of the attribute `PRI_CONTENT` is an object that contains key-value pairings made up of CSS attributes and their values, which will be passed to the linked Base Entity when it is rendered in the app.

#### Theme Base Entity Structure
```
{
  "baseEntityAttributes": [
    {
      "attributeCode": "PRI_CONTENT",
      "attributeName": "Content",
      "baseEntityCode": "THM_XXX",
      "created": "2018-08-29T03:00:39",
      "inferred": false,
      "privacyFlag": false,
      "readonly": false,
      "value": {
        "backgroundColor": "#ddd"
      },
      "valueString": {
        "backgroundColor": "#ddd"
      }
    }
  ],
  "code": "THM_XXX",
  "created": "2019-02-06T04:24:10",
  "delete": false,
  "id": 1001,
  "index": 0,
  "links": [],
  "name": "Theme Name",
  "realm": "genny",
  "replace": true,
  "shouldDeleteLinkedBaseEntities": false,
  "totalCount": 1,
  "updated": "2019-02-06T04:24:10"
}

```

#### Theme Fields
TBD

#### Theme Attributes
| Option | Value Type | Example | Required | Description |
| ------ | ---------- | ------- | -------- | ----------- |
| PRI_CONTENT | Object | { "backgroundColor": "#ddd" } | true | An object composed of key-value pairings defining CSS values that will be passed to the rendered element in the frontend. |
| PRI_IS_INHERITABLE | Boolean | false | false | An optional prop to define whether a Theme's information should be passed to the children of the Theme. Defaults to true. |
| PRI_IS_EXPANDABLE | Boolean | true | false | Instructs linked component to de displayed with its children hidden inside in an expandable component. |

## Asks ( prefix: QUE_ )

The **Asks** are composed of **Question Groups** ( QUE_XXX_GRP ) and **Questions** ( QUE_XXX ). An **Ask** is rendered as a Form component with Inputs, and cover almost all of the display elements and interactable elements shown on the page.

#### Questions

A **Question** defines an element that will display information to the user. The element might be editable, or read only. The `dataType` field defines the type of data, which is used by the front end to render a display component.

#### Question Group

A **Question Group** defines a group of collection of **Questions**. **Question Groups** can have a **Theme** linked to it, and define behaviour such as Pagination, Dropdowns, and Selectable element. A **Question** can be rendered as part of the **Question Group** itself, not as a child, using the `question` field.


#### Ask Structure
```
{
  "items": [
    {
      "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
      "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
      "questionCode": "QUE_TREE_GRP",
      "attributeCode": "QQQ_QUESTION_GROUP",
      "mandatory": false,
      "disabled": false,
      "hidden": false,
      "readonly": false,
      "weight": 0.0,
      "parentId": 0,
      "childAsks": [
        {
          "question": {
            "attribute": {
              "dataType": {
                "className": "Event",
                "typeName": "Event",
                "validationList": []
              },
              "defaultPrivacyFlag": false,
              "code": "PRI_DASHBOARD",
              "index": 0,
              "created": "2019-02-10T10:41:00",
              "updated": "2019-02-10T10:41:00",
              "id": 159,
              "name": "Dashboard",
              "realm": "genny"
            },
            "attributeCode": "PRI_DASHBOARD",
            "mandatory": false,
            "readonly": false,
            "code": "QUE_DASHBOARD",
            "index": 0,
            "created": "2018-08-14T02:46:55",
            "updated": "2018-10-04T23:29:15",
            "id": 88,
            "name": "Dashboard",
            "realm": "genny"
          },
          "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
          "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
          "questionCode": "QUE_DASHBOARD",
          "attributeCode": "PRI_DASHBOARD",
          "mandatory": true,
          "disabled": false,
          "hidden": false,
          "readonly": false,
          "weight": 0.0,
          "parentId": 0,
          "contextList": {
            "eventType": "TV_SELECT"
          },
          "created": "2018-08-29T03:00:40",
          "updated": "2018-12-12T02:22:33",
          "id": 3668,
          "name": "Dashboard",
          "realm": "genny"
        },
        {
          "question": {
            "attribute": {
              "dataType": {
                "className": "Event",
                "typeName": "Event",
                "validationList": []
              },
              "defaultPrivacyFlag": false,
              "code": "QQQ_QUESTION_GROUP_INPUT",
              "index": 0,
              "created": "2019-02-10T10:40:32",
              "updated": "2019-02-10T10:40:32",
              "id": 171,
              "name": "QuestionGroupInput",
              "realm": "genny"
            },
            "attributeCode": "QQQ_QUESTION_GROUP_INPUT",
            "mandatory": false,
            "readonly": false,
            "code": "QUE_INTERNSHIPS_GRP",
            "index": 0,
            "created": "2018-08-14T02:46:56",
            "updated": "2018-10-04T23:29:19",
            "id": 247,
            "name": "Internships",
            "realm": "genny"
          },
          "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
          "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
          "questionCode": "QUE_INTERNSHIPS_GRP",
          "attributeCode": "QQQ_QUESTION_GROUP_INPUT",
          "mandatory": false,
          "disabled": false,
          "hidden": false,
          "readonly": false,
          "weight": 0.0,
          "parentId": 0,
          "childAsks": [
            {
              "question": {
                "attribute": {
                  "dataType": {
                    "className": "Event",
                    "typeName": "Event",
                    "validationList": []
                  },
                  "defaultPrivacyFlag": false,
                  "code": "PRI_INTERNSHIPS_PLACED",
                  "index": 0,
                  "created": "2019-02-10T10:41:00",
                  "updated": "2019-02-10T10:41:00",
                  "id": 159,
                  "name": "Placed Internships",
                  "realm": "genny"
                },
                "attributeCode": "PRI_INTERNSHIPS_PLACED",
                "mandatory": false,
                "readonly": false,
                "code": "QUE_INTERNSHIPS_PLACED",
                "index": 0,
                "created": "2018-08-14T02:46:55",
                "updated": "2018-10-04T23:29:15",
                "id": 88,
                "name": "Placed Internships",
                "realm": "genny"
              },
              "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "questionCode": "QUE_INTERNSHIPS_PLACED",
              "attributeCode": "PRI_INTERNSHIPS_PLACED",
              "mandatory": true,
              "disabled": false,
              "readonly": false,
              "weight": 0.0,
              "parentId": 0,
              "contextList": {},
              "created": "2018-08-29T03:00:40",
              "updated": "2018-12-12T02:22:33",
              "id": 3668,
              "name": "Placed Internships",
              "realm": "genny"
            },
            {
              "question": {
                "attribute": {
                  "dataType": {
                    "className": "Event",
                    "typeName": "Event",
                    "validationList": []
                  },
                  "defaultPrivacyFlag": false,
                  "code": "PRI_INTERNSHIPS_COMPLETED",
                  "index": 0,
                  "created": "2019-02-10T10:41:00",
                  "updated": "2019-02-10T10:41:00",
                  "id": 159,
                  "name": "Completed Internships",
                  "realm": "genny"
                },
                "attributeCode": "PRI_INTERNSHIPS_COMPLETED",
                "mandatory": false,
                "readonly": false,
                "code": "QUE_INTERNSHIPS_COMPLETED",
                "index": 0,
                "created": "2018-08-14T02:46:55",
                "updated": "2018-10-04T23:29:15",
                "id": 88,
                "name": "Completed Internships",
                "realm": "genny"
              },
              "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "questionCode": "QUE_INTERNSHIPS_COMPLETED",
              "attributeCode": "PRI_INTERNSHIPS_COMPLETED",
              "mandatory": true,
              "disabled": false,
              "hidden": false,
              "readonly": false,
              "weight": 0.0,
              "parentId": 0,
              "contextList": {},
              "created": "2018-08-29T03:00:40",
              "updated": "2018-12-12T02:22:33",
              "id": 3668,
              "name": "Completed Internships",
              "realm": "genny"
            },
            {
              "question": {
                "attribute": {
                  "dataType": {
                    "className": "Event",
                    "typeName": "Event",
                    "validationList": []
                  },
                  "defaultPrivacyFlag": false,
                  "code": "PRI_INTERNSHIPS_IN_PROGRESS",
                  "index": 0,
                  "created": "2019-02-10T10:41:00",
                  "updated": "2019-02-10T10:41:00",
                  "id": 159,
                  "name": "In Progress Internships",
                  "realm": "genny"
                },
                "attributeCode": "PRI_INTERNSHIPS_IN_PROGRESS",
                "mandatory": false,
                "readonly": false,
                "code": "QUE_INTERNSHIPS_IN_PROGRESS",
                "index": 0,
                "created": "2018-08-14T02:46:55",
                "updated": "2018-10-04T23:29:15",
                "id": 88,
                "name": "In Progress Internships",
                "realm": "genny"
              },
              "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "questionCode": "QUE_INTERNSHIPS_IN_PROGRESS",
              "attributeCode": "PRI_INTERNSHIPS_IN_PROGRESS",
              "mandatory": true,
              "disabled": false,
              "hidden": false,
              "readonly": false,
              "weight": 0.0,
              "parentId": 0,
              "contextList": {},
              "created": "2018-08-29T03:00:40",
              "updated": "2018-12-12T02:22:33",
              "id": 3668,
              "name": "In Progress Internships",
              "realm": "genny"
            },
            {
              "question": {
                "attribute": {
                  "dataType": {
                    "className": "Event",
                    "typeName": "Event",
                    "validationList": []
                  },
                  "defaultPrivacyFlag": false,
                  "code": "PRI_INTERNSHIPS_ACTIVE",
                  "index": 0,
                  "created": "2019-02-10T10:41:00",
                  "updated": "2019-02-10T10:41:00",
                  "id": 159,
                  "name": "Active Internships",
                  "realm": "genny"
                },
                "attributeCode": "PRI_INTERNSHIPS_ACTIVE",
                "mandatory": false,
                "readonly": false,
                "code": "QUE_INTERNSHIPS_ACTIVE",
                "index": 0,
                "created": "2018-08-14T02:46:55",
                "updated": "2018-10-04T23:29:15",
                "id": 88,
                "name": "Active Internships",
                "realm": "genny"
              },
              "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "questionCode": "QUE_INTERNSHIPS_ACTIVE",
              "attributeCode": "PRI_INTERNSHIPS_ACTIVE",
              "mandatory": true,
              "disabled": false,
              "hidden": false,
              "readonly": false,
              "weight": 0.0,
              "parentId": 0,
              "contextList": {},
              "created": "2018-08-29T03:00:40",
              "updated": "2018-12-12T02:22:33",
              "id": 3668,
              "name": "Active Internships",
              "realm": "genny"
            },
            {
              "question": {
                "attribute": {
                  "dataType": {
                    "className": "Event",
                    "typeName": "Event",
                    "validationList": []
                  },
                  "defaultPrivacyFlag": false,
                  "code": "PRI_INTERNSHIPS_OFFERED",
                  "index": 0,
                  "created": "2019-02-10T10:41:00",
                  "updated": "2019-02-10T10:41:00",
                  "id": 159,
                  "name": "Offered Internships",
                  "realm": "genny"
                },
                "attributeCode": "PRI_INTERNSHIPS_OFFERED",
                "mandatory": false,
                "readonly": false,
                "code": "QUE_INTERNSHIPS_OFFERED",
                "index": 0,
                "created": "2018-08-14T02:46:55",
                "updated": "2018-10-04T23:29:15",
                "id": 88,
                "name": "Offered Internships",
                "realm": "genny"
              },
              "sourceCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "targetCode": "PER_ADAMCROW63_AT_GMAILCOM",
              "questionCode": "QUE_INTERNSHIPS_OFFERED",
              "attributeCode": "PRI_INTERNSHIPS_OFFERED",
              "mandatory": true,
              "disabled": false,
              "hidden": false,
              "readonly": false,
              "weight": 0.0,
              "parentId": 0,
              "contextList": {},
              "created": "2018-08-29T03:00:40",
              "updated": "2018-12-12T02:22:33",
              "id": 3668,
              "name": "Offered Internships",
              "realm": "genny"
            }
          ],
          "contextList": {
            "isDropdown": true
          },
          "created": "2019-02-14T03:15:22",
          "id": 46341,
          "name": "Internships",
          "realm": "genny"
        }
      ],
      "contextList": {},
      "created": "2019-02-14T03:15:22",
      "id": 46341,
      "name": "Tree View",
      "realm": "genny"
    }
  ],
  "data_type": "Ask",
  "delete": false,
  "replace": false,
  "msg_type": "DATA_MSG"
}
```

## Legacy Layouts ( prefix: LAY_ )

The **Legacy Layouts** are base entities created using the previous layouts system, using Json files and Data Queries. They are rendered using the Sublayout component.

## Links ( prefix: LNK_ )

A **Link** is used to define the relationship between two **Entities**. When used for **Layouts**, the **Link** is principally used to tell the front end which entities are being linked, what type of entity the child is, and the location of the child within the **Frame**, if the parent is a **Frame** base entity.

The type of link is defined by the `attributeCode` field. The valid types of links are as follows:
- LNK_FRAME: Indicates that the child is a **Frame** base entity.
- LNK_THEME: Indicates that the child is a **Theme** base entity.
- LNK_ASK: Indicates that the child is an **Ask**.
- **LNK_LAYOUT**: Indicates the child is a **Legacy Layout**. This allows backwards compatibility with the previous layouts.

The **Panel** the child will be linked to is deinfed by the `linkValue` field. The valid values are **NORTH**, **SOUTH**, **EAST**, **WEST**, and **CENTRE**

#### Link Structure
```
{
  "created": "2019-02-06T04:24:58",
  "link": {
    "attributeCode": "LNK_FRAME",
    "linkValue": "CENTRE",
    "sourceCode": "FRM_PARENT",
    "targetCode": "FRM_CHILD",
    "weight": 1
  },
  "updated": "2019-02-06T04:25:25",
  "valueString": "CENTRE",
  "weight": 1
}
```

#### Link Fields
| Field | Value Type | Example | Required | Description |
| ------ | ---------- | ------- | -------- | ----------- |
| sourceCode | string | "FRM_PARENT" | true | Base Entity code of the link parent. |
| targetCode | string | "FRM_CHILD" | true | Base Entity code of the link child. **IMPORTANT: If using LNK_LAYOUT, the target code must be the URI of the legacy layout. Must begin with `pages/` or `sublayouts'`, eg `pages/applications/:id`** |
| attributeCode | string | "LNK_FRAME" | true | Defines the type of link. |
| linkValue | string | "CENTRE" | true | Defines which **Panel** of the parent **Frame** the child is linked to. |
| weight | number | 1 | true | The priority of the link. Lower numbers are more important, a value of `0` means the child will be hidden. |

## Creating a Layout

Tree of Frames and Asks

![Entity Tree](https://i.imgur.com/1gwHZZC.png)

With Themes added

![Adding Themes](https://i.imgur.com/6PM9heG.png)

Root Frame with Centre Panel

![Root Level](https://i.imgur.com/t2l2jas.png)

First Recursion with Panels

![First Level](https://i.imgur.com/shVknrP.png)

Second Recursion with Panels

![Second Level](https://i.imgur.com/SjdjV0a.png)

## Sending Messages

TBD