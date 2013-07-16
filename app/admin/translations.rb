ActiveAdmin.register_page 'Translations' do

  content do
    render 'index'
  end

  controller do

    def index

      @translations = TRANSLATION_STORE

      if params[:delete] && params[:locale] && params[:key]
        # Delete the translation
        @translations.del("#{params[:locale]}.#{params[:key]}")
        # Show flash message
        flash[:notice] = "Removed translation #{params[:key]} for " +
            "locale #{params[:locale]}"
      elsif params[:locale] && params[:key] && params[:value]
        # Save the created translation
        I18n.backend.store_translations(
          params[:locale], { params[:key] => params[:value] },
          :escape => false
        )
        # Show flash message
        flash[:notice] = "Added translation #{params[:key]} for " +
            "locale #{params[:locale]}"
      end

    end

  end

end
