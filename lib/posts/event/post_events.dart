class MaidPostEvents {}

class MaidPostEventLoad extends MaidPostEvents {}

class MaidPostEventSearch extends MaidPostEvents {
  final String q;
  MaidPostEventSearch(this.q);
}
