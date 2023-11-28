{
  enable = true;
  extraConfig = ''
    set previewer ${./previewer}
    set cleaner ${./cleaner}
    set drawbox
    set icons
    set incfilter
    set incsearch

    map <c-n> down
    map <c-p> up
    map . set hidden!

    cmd toggle_preview %{{
        if [ "$lf_preview" = "true" ]; then
            lf -remote "send $id :set preview false; set ratios 1:5"
        else
            lf -remote "send $id :set preview true; set ratios 1:2:3"
        fi
    }}

    map zp toggle_preview

    map f :filter; set user_filter true

    cmap <enter> &{{
        # select and open file
        if [ "$lf_user_filter" = true ]; then
            lf -remote "send $id :cmd-enter; set user_filter false; setfilter; open"
        else
            lf -remote "send $id cmd-enter"
        fi
    }}
    
    cmap <esc> &{{
        # exit filter mode
        if [ "$lf_user_filter" = true ]; then
            lf -remote "send $id :cmd-escape; set user_filter false"
        else
            lf -remote "send $id cmd-escape"
        fi
    }}
    
    cmap <c-n> &{{
        # go to next file
        if [ "$lf_user_filter" = true ]; then
            lf -remote "send $id down"
        else
            lf -remote "send $id cmd-history-next"
        fi
    }}
    
    cmap <c-p> &{{
        # go to previous file
        if [ "$lf_user_filter" = true ]; then
            lf -remote "send $id up"
        else
            lf -remote "send $id cmd-history-prev"
        fi
    }}
  '';
}
