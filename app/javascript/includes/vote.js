$(function(){
    $('.vote').on('click','.upvote, .downvote',function(){
        let post_id = $(this).parent().data('id');
        const is_upvote = $(this).hasClass('upvote');
        console.log('is in upvotetest:' + is_upvote)    
        
        $.ajax({
            url: "/post/vote",
            method: "POST",
            data : {post_id: post_id, upvote: is_upvote },
            success: function () {
                console.log("success...");
            }
        })

    })
})