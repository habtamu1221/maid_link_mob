import "package:test/test.dart";
import "dart:convert";
import "../lib/libs.dart";

String jsonmaidInfo = """
{
    "id" : "6125f135e831b1715dcb7056",
    "user" : {
        "id" : "6125f135e831b1715dcb7056",
        "username" : "Alemnesh Wase ",
        "email" : "alemnfdkaslfssdfadfdadeho@gmail.com",
        "password" : "",
        "image_url" : "",
        "role" : 1
    },
    "phone" : "+251992089888",
    "address" : "addis Ababa Ethiopia",
    "bio" : "This is Alemneshe Wases Biiography ",
    "profile_images" : [ 
        "images/posts/RrSeQ.png", 
        "images/posts/7_Tb1.png", 
        "images/posts/LLSjw.png", 
        "images/posts/oNjVE.png"
    ],
    "carrers" : null,
    "createdby" : "61182e98ebeeebbee33314b8",
    "works" : [ 
        {
            "NO" : 2,
            "Shift" : 1,
            "Type" : 1,
            "Experiance" : "Cake Bread",
            "Experties" : [ 
                "One", 
                "Two", 
                "Three"
            ]
        }, 
        {
            "NO" : 4,
            "Shift" : 1,
            "Type" : 1,
            "Experiance" : "Cooking",
            "Experties" : [ 
                "One", 
                "Two", 
                "Three"
            ]
        }, 
        {
            "NO" : 5,
            "Shift" : 1,
            "Type" : 1,
            "Experiance" : "Cooking",
            "Experties" : [ 
                "One", 
                "Two", 
                "Three"
            ]
        }, 
        {
            "NO" : 6,
            "Shift" : 1,
            "Type" : 1,
            "Experiance" : "Cake Bread",
            "Experties" : [ 
                "One", 
                "Two", 
                "Three"
            ]
        }, 
        {
            "NO" : 7,
            "Shift" : 1,
            "Type" : 1,
            "Experiance" : "Cake Bread",
            "Experties" : [ 
                "One", 
                "Two", 
                "Three"
            ]
        }
    ],
    "rates" : 3.5,
    "rate_count" : 2,
    "rated_by" : [ 
        "6135defe42d28b2f6469ce05", 
        "6198b005165a8eb8a73350a8"
    ]
}
""";

void main() {
  group('Maids JSON COnversion ', () {
    test("parse-maids-json", () {
      expect(
          Maid.fromJson(jsonDecode(jsonmaidInfo) as Map<String, dynamic>).phone,
          "+251992089888");

      expect(dummymaid!.user!.id, "6125f135e831b1715dcb7056");
      expect(dummymaid!.phone, "+251992078204");
      // expect(dummymaid.rateCount, 4.78);
    });
  });
}
