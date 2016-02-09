$(document).ready(function(){
  module("Accordion tests");

  test("example test", function() {
    ok(true);
  });

  test( "hello test", function( assert ) {
    assert.ok( 1 == "1", "Passed!" );
  });

  test( "number of accordions for ACT example", function( assert ) {
    assert.strictEqual( acc.length, 5, "Yup, 5 accordions!");
  });

  test( "At least one accordion", function( assert ) {
    assert.ok( acc.length > 0, "Yup, accordions exist!");
  });

  test( "Nothing showing on load", function( assert ) {
    assert.equal( document.getElementsByClassName("show").length, 0, "Yes, no accordions are showing on load!");
  });

  test( "Panel shows when second accordion is clicked", function( assert ) {
    $(acc[1]).click();
    assert.equal( document.getElementsByClassName("show").length, 1, "Yes, an accordion is showing on click!");
  });

  test( "Clicking again closes second accordion", function( assert ) {
    $(acc[1]).click();
    assert.equal( document.getElementsByClassName("show").length, 0, "Yes, clicking again closes it!");
  });

  test( "Clicking more than one accordion works", function( assert ) {
    $(acc[1]).click();
    $(acc[4]).click();
    assert.equal( document.getElementsByClassName("show").length, 2, "Yes, two accordions are showing!");
    $(acc[1]).click(); // closing the panels again for subsequent tests
    $(acc[4]).click();
  });

});
