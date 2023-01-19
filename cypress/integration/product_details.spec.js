describe("Users should be able to view the product detail page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("After clicking, product details page shows", () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.get(".product-detail")
      .should("be.visible")

  })
});