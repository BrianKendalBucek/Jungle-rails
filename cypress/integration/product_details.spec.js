describe("Users should be able to view the product detail page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("", () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.get(".product-detail")
      .should("be.visible")
  })

});