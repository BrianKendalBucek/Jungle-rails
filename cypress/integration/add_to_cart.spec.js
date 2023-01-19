describe("Users should be able to add products to the cart", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("Should increase the cart total by 1", () => {
    cy.contains("My Cart (0)").should('be.visible');
    cy.contains('Add').click({ force: true });
    cy.contains("My Cart (1)").should('be.visible');
  });
});