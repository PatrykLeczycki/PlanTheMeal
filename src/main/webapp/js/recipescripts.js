
$(document).on("click", ".delete",function() {

    var grandparent = $(this).parent().parent();

    if(grandparent.children().length > 2){
        var parent = $(this).parent();
        parent.remove();
    }
});

$(document).on("mouseenter", ".delete", function() {
    // hover starts code here

    var grandparent = $(this).parent().parent();

    if(grandparent.children().length == 2){
        var parent = $(this).parent();

        var text;

        if (parent.hasClass('step')){
            text = "Preparation list can't be empty."
        } else text = "Ingredients list can't be empty.";

        this.notice = $('<div>')
            .addClass('notice')
            .css({
                bottom: $(this).offset().bottom + 1000
            }).text(text)
            .appendTo(this);
    }
});

$(document).on("mouseleave", ".delete", function() {
    // hover ends code here
    if(this.notice)
        this.notice.remove();
});

$(".add").on("click", function(){

    var parent = $(this).parent();
    var newIngredient;

    if (parent.hasClass('preparation'))
        newIngredient = $("<div class='step'><input type='text' name='step'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");
    else newIngredient = $("<div class='ingredient'><input type='text' name='ingredient'/><div class='delete'><i class='fa fa-trash' style='padding-right: 5px;'></i></div></div>");

    newIngredient.insertBefore($(this));
});