
Domain fromMagicBoxes(String json) {
  Map<String, Object> boardMap = JSON.parse(json);
  List<Map<String, Object>> boxes = boardMap["boxes"];
  List<Map<String, Object>> lines = boardMap["lines"];

  Domain domain = new Domain();
  Model model = new Model(domain);

  for (Map<String, Object> box in boxes) {
    String conceptCode = box["name"];
    bool conceptEntry = box["entry"];
    Concept concept = new Concept(model, conceptCode);
    concept.entry = conceptEntry;

    List<Map<String, Object>> items = box["items"];
    for (Map<String, Object> item in items) {
      String attributeCode = item["name"];
      if (attributeCode != 'oid' && attributeCode != 'code') {
        Attribute attribute = new Attribute(concept, attributeCode);
        String itemCategory = item["category"];
        if (itemCategory == 'guid') {
          attribute.guid = true;
        } else if (itemCategory == 'identifier') {
          attribute.id = true;
        } else if (itemCategory == 'required') {
          attribute.min = '1';
        }
        int itemSequence = item["sequence"];
        attribute.sequence = itemSequence;
        String itemInit = item["init"];
        if (itemInit == null || itemInit.trim() == '') {
          attribute.init = null;
        } else {
          attribute.init = itemInit;
        }
        String itemType = item["type"];
        Type type = domain.types.findByCode(itemType);
        if (type != null) {
          attribute.type = type;
        }
      }
    }
  }

  for (Map<String, Object> line in lines) {
    String box1Name = line["box1Name"];
    String box2Name = line["box2Name"];

    Concept concept1 = model.concepts.findByCode(box1Name);
    Concept concept2 = model.concepts.findByCode(box2Name);
    if (concept1 == null) {
      throw new NullPointerException(
        'Line concept is missing for the $box1Name box.');
    }
    if (concept2 == null) {
      throw new NullPointerException(
        'Line concept is missing for the $box2Name box.');
    }

    String box1box2Name = line["box1box2Name"];
    String box1box2Min = line["box1box2Min"];
    String box1box2Max = line["box1box2Max"];
    bool box1box2Id = line["box1box2Id"];

    String box2box1Name = line["box2box1Name"];
    String box2box1Min = line["box2box1Min"];
    String box2box1Max = line["box2box1Max"];
    bool box2box1Id = line["box2box1Id"];

    bool lineInternal = line["internal"];
    String lineCategory = line["category"];

    bool d12Child;
    bool d21Child;
    bool d12Parent;
    bool d21Parent;

    if (box1box2Max != '1') {
      d12Child = true;
      if (box2box1Max != '1') {
        d21Child = true;
      } else {
        d21Child = false;
      }
    } else if (box2box1Max != '1') {
      d12Child = false;
      d21Child = true;
    } else if (box1box2Min == '0') {
      d12Child = true;
      d21Child = false;
    } else if (box2box1Min == '0') {
      d12Child = false;
      d21Child = true;
    } else {
      d12Child = true;
      d21Child = false;
    }

    d12Parent = !d12Child;
    d21Parent = !d21Child;

    if (d12Child && d21Child) {
      throw new Exception('$box1Name -- $box2Name line has two children.');
    }
    if (d12Parent && d21Parent) {
      throw new Exception('$box1Name -- $box2Name line has two parents.');
    }

    Neighbor neighbor12;
    Neighbor neighbor21;

    if (d12Child && d21Parent) {
      neighbor12 = new Child(concept1, concept2, box1box2Name);
      neighbor21 = new Parent(concept2, concept1, box2box1Name);
    } else if (d12Parent && d21Child) {
      neighbor12 = new Parent(concept1, concept2, box1box2Name);
      neighbor21 = new Child(concept2, concept1, box2box1Name);
    }

    neighbor12.opposite = neighbor21;
    neighbor21.opposite = neighbor12;

    neighbor12.min = box1box2Min;
    neighbor12.max = box1box2Max;
    neighbor12.id = box1box2Id;

    neighbor21.min = box2box1Min;
    neighbor21.max = box2box1Max;
    neighbor21.id = box2box1Id;

    neighbor12.internal = lineInternal;
    if (lineCategory == 'inheritance') {
      neighbor12.inheritance = true;
    }
  }

  return domain;
}
