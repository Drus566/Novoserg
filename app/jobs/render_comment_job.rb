class RenderCommentJob < ApplicationJob
    include SessionsHelper
    queue_as :default

    def perform(comment)
        ActionCable.server.broadcast "microposts_comments_channel", comment: render_comment(comment), micropost_id: comment.commentable_id, parent_comment_id: comment.parent_id
    end

    private 
        def render_comment(comment)
            ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
        end
end