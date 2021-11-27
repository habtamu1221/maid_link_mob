import 'package:maidlink/maids/model/maid.dart';
import 'package:maidlink/posts/model/work_model.dart';

List<Work> dummyworks = [
  Work.fromJson(
    {
      "NO": 2,
      "Shift": 1,
      "Type": 1,
      "Experiance": "Cake Bread",
      "Experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "NO": 4,
      "Shift": 1,
      "Type": 1,
      "Experiance": "Cooking",
      "Experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "NO": 4,
      "Shift": 1,
      "Type": 1,
      "Experiance": "Cooking",
      "Experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "NO": 4,
      "Shift": 1,
      "Type": 1,
      "Experiance": "Cooking",
      "Experties": ["One", "Two", "Three"]
    },
  ),
  Work.fromJson(
    {
      "NO": 4,
      "Shift": 1,
      "Type": 1,
      "Experiance": "Cooking",
      "Experties": ["One", "Two", "Three"]
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
    imageUrl: "",
    role: 0,
    username: "Samuael",
  ),
);
