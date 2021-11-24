import 'package:maidlink/maids/model/maid.dart';
import 'package:maidlink/posts/model/work_model.dart';

List<Work> works = [
  Work.fromJson(
    {
      "no": 2,
      "shift": 1,
      "type": 1,
      "experiance": "Cake Bread",
      "experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "no": 4,
      "shift": 1,
      "type": 1,
      "experiance": "Cooking",
      "experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "no": 4,
      "shift": 1,
      "type": 1,
      "experiance": "Cooking",
      "experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "no": 4,
      "shift": 1,
      "type": 1,
      "experiance": "Cooking",
      "experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "no": 4,
      "shift": 1,
      "type": 1,
      "experiance": "Cooking",
      "experties": ["One", "Two", "Three"]
    },
  ),
];

Maid dummymaid = Maid(
  address: "Addis Ababa Ethiopia ",
  bio: "Habtamu Girma Belachew kassaw ",
  carrers: [
    "one",
    "Two",
    "Three",
    "Four ",
  ],
  works: [],
  ratedBy: [],
  profileImages: [
    "images/posts/RrSeQ.png",
    "images/posts/7_Tb1.png",
    "images/posts/LLSjw.png",
    "images/posts/oNjVE.png",
  ],
  phone: "+251992078204",
  rateCount: 3,
  rates: 4.78,
  user: DUser(
    id: "6125f135e831b1715dcb7056",
    email: "habtamugirma@gmail.com",
    imageUrl: "images/posts/RrSeQ.png",
    role: 0,
    username: "Samuael",
  ),
);
