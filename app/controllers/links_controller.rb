class LinksController < ApplicationController
  def create
    link = Link.create(original: params[:link][:original], slug: SecureRandom.hex(4))
    render json: { shortened: "http://localhost:3000/#{link.slug}" }
  end

  def show
    link = Link.find_by(slug: params[:slug])
    if link
      redirect_to link.original, allow_other_host: true
    else
      render json: { error: "Link not found" }, status: :not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:original)
  end
end
