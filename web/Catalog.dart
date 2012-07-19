
class Catalog {

  Concept categoryConcept;
  Concept webLinkConcept;

  Categories categories;

  var _json = '{"width":990,"lines":[{"box2box1Min":"1","box1Name":"Category","box1box2Min":"0","box2Name":"WebLink","category":"relationship","box2box1Id":true,"box2box1Name":"category","box1box2Id":false,"box1box2Name":"webLinks","box1box2Max":"N","internal":true,"box2box1Max":"1"}],"height":580,"boxes":[{"entry":true,"name":"Category","x":146,"y":201,"width":120,"height":120,"items":[{"sequence":10,"category":"identifier","name":"code","type":"String","init":""},{"sequence":20,"category":"attribute","name":"description","type":"String","init":""}]},{"entry":false,"name":"WebLink","x":505,"y":215,"width":120,"height":120,"items":[{"sequence":10,"category":"identifier","name":"code","type":"String","init":""},{"sequence":20,"category":"required","name":"url","type":"String","init":""},{"sequence":30,"category":"attribute","name":"description","type":"String","init":""}]}]}';

  Catalog() {
    /*
    Domain domain = new Domain();
    Model model = new Model(domain);

    categoryConcept = new Concept(model, 'Category');
    categoryConcept.description = 'Category of web links.';
    Attribute categoryDescriptionAttribute = new Attribute(categoryConcept, 'description');

    webLinkConcept = new Concept(model, 'WebLink');
    webLinkConcept.entry = false;
    webLinkConcept.description = 'Web links of interest.';
    Attribute webLinkUrlAttribute = new Attribute(webLinkConcept, 'url');
    Attribute webLinkDescriptionAttribute = new Attribute(webLinkConcept, 'description');

    Neighbor categoryWebLinksNeighbor = new Neighbor(categoryConcept, webLinkConcept, 'webLinks');
    categoryWebLinksNeighbor.max = 'N';
    Neighbor webLinkCategoryNeighbor = new Neighbor(webLinkConcept, categoryConcept, 'category');
    webLinkCategoryNeighbor.id = true;
    webLinkCategoryNeighbor.child = false;
    categoryWebLinksNeighbor.opposite = webLinkCategoryNeighbor;
    webLinkCategoryNeighbor.opposite = categoryWebLinksNeighbor;

    categories = new Categories(categoryConcept);
    */

    Domain domain = fromMagicBoxes(_json);
    Model model = domain.model;
    categoryConcept = model.concepts.getEntity('Category');
    webLinkConcept = model.concepts.getEntity('WebLink');
    categories = new Categories(categoryConcept);
  }

}


