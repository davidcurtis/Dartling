
class Domains extends Entities<Domain> {

}

class Domain extends Entity<Domain> {

  String description;

  Domain domain;

  Domains domains;
  Types types;
  Models models;

  Domain([String code = 'default']) {
    super.code = code;
    domains = new Domains();
    types = new Types();
    models = new Models();
    if (code == 'default') {
      description = 'Default domain to keep types and models.';
    }

    new Type(this, 'String');
    new Type(this, 'num');
    new Type(this, 'int');
    new Type(this, 'double');
    new Type(this, 'bool');
    new Type(this, 'Date');
    new Type(this, 'Uri');
    assert(types.count == 7);
  }

  Domain getDomain(String code) => domains.findByCode(code);

  Model get model() => models.findByCode('default');

  Model getModel(String code) => models.findByCode(code);

  Type getType(String code) => types.findByCode(code);
}
