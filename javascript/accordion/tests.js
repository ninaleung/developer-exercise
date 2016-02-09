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

});
