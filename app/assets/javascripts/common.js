var ready = function() {

    $('.favourite').on('click', function(){

        var article = this.parentElement
        //console.log(article)
        var source = $(article).data("source")
        var article_link = $(article).find('.title').attr('href')
        var author_link = $(article).find('.author').attr('href')
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
                    article_link: article_link },
            success: function(){
                console.log('firing');
                console.log($(article));
                $(article).fadeOut("slow", function(){
                    $(article).remove();
                });
            }
        });

        //var source = $(article).find('title')
        console.log(source)
        //console.log($(source).data("source"))
        //console.log($(article).html().data("source"))
        //console.log($(article).find('title').data("source"))

    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
