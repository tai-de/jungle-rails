describe('Product details', () => {

  beforeEach(() => {
    cy.visit('/')
  })


  it("Users can click a product's Add button and the cart will increase by 1", () => {
    cy.get(".button_to > .btn")
      .first()
      .click({force: true});
    cy.contains(".end-0 > .nav-link", "My Cart (1)");
  });

});