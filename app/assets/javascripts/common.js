var ready = function() {

    $('.favourite').on('click', function(){

        var article = this.parentElement
        console.log(article)
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
        //
        //console.log(article)
        //console.log(article_link)
        //console.log(author_link)
        //console.log(title.toString())
        //console.log(description)

    });
}



