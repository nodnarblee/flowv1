var ready = function() {

    $('.favourite').on('click', function(){

        var article = this.parentElement
        var source = $(article).data("source");
        var article_link = $(article).find('.title').attr('href');
        var author_link = $(article).find('.author').attr('href');
        var description = $(article).find('.description').text().toString();
        var title = $(article).find('.title').text().toString();
        var author = $(article).find('.author').text().toString();

        $.ajax({
            url: "favourites/favourite_article",
            type: "post",
            data: { description: description,
                    title: title,
                    author: author,
                    author_link: author_link,
                    article_link: article_link,
                    source: source },
            success: function(){
                console.log($(article));
                $(article).fadeOut("slow", function(){
                    $(article).remove();
                });
            }
        });

    });

    $('.delete-article').on('click', function(){

        var that = $(this)
        article_id = $(this).data('article-id');
        $.ajax({
            url: "/articles/destroy/" + article_id,
            type: "delete",
            dataType: "html",
            success: function(){
                var article_row = that.closest('tr');
                article_row.fadeOut(function(){
                    article_row.remove;
                });
            }
        });
    })
}

$(document).ready(ready);
$(document).on('page:load', ready);
