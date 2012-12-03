filetype plugin on
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"source $VIM/vimfiles/compiler/antcompile.vim
behave mswin

"set rulerformat=%30([x:\ %03v]\ [y:\ %l\/%L]%=%P%)
set rulerformat=%33([col:\ %02v]\ \ line:\ \(%l\/%L\)%=%P%)
set wildmenu
"set list
"set lcs=tab:  ,trail:·
"set showmatch
set tag=./tags,tags

set cindent
set ignorecase
set tabstop=2
set shiftwidth=2
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set expandtab
"set textwidth=78
colo desert
if has("gui_running")
	set background=dark
	set guifont=Monospace\ 9
	"set guifont=-biznet-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-2
	"set guifont=Lucida_Console:h9
	" syntax on " (set above)
	" set hlsearch (set above)
	" set ruler (set above)
	colo darkspectrum
endif
set nobackup
set hidden " to maintain history after hiding a buffer
"F2 - no highlight
"F3 - toggle hidden chars (:set list!)
"F4 - ant jspstage staticstage
"F5 - undiff buffer
"F6 - spell toggle
"F7 - 
"F8 - Java Browser

nnoremap <silent> <F2> :noh<CR>
nnoremap <silent> <F3> :set list!<CR>

"nnoremap <silent> <F5> :set nodiff<CR>:set fdc=0<CR>
map <F5> :JSLint<CR>
map = <c-w>10+
map - <c-w>10-

"Conque Term
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_EscKey = '<Esc><Esc>'
nmap ,ct :ConqueTermSplit bash<cr>

call pathogen#infect() 



"" Keith's Custom Colours """""""""""""""""""""""""""""""""""
"highlight Normal guibg=black guifg=grey95
"highlight Cursor guibg=darkgrey guifg=NONE
"highlight Visual guifg=darkred
"highlight StatusLine   guifg=#445566		guibg=white
"highlight StatusLineNC guifg=#334455		guibg=#DDDDAA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"verbose compile stuff -- this doesn't seem to work as well as just using 'compiler'
" For quick-fix stuff, use jikes:
"set makeprg=jikes\ -nowarn\ -Xstdout\ +E\ % 
"set errorformat=%f:%l:%c:%*\\d:%*\\d:%*\\s%m 

" For building Care II, use Ant:
" set makeprg=ant\ -emacs\ -buildfile\ C:\build.xml

" Taglist: http://www.geocities.com/yegappan/taglist/manual.html
"nnoremap <silent> <F8> :Tlist<CR>
"nnoremap <silent> <F7> :TlistUpdate<CR>
"let Tlist_Inc_Winwidth = 0
"let Tlist_Sort_Type = "name"

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Sort_Type = "name"
let g:jsLint = "on"

" getter/setter generation for java
ca getset s/\(public\\|private\\|protected\)\s\(\S\+\)\s\(\S\+\).*;/&\rpublic \2 get\u\3() { return this.\3; }\rpublic void set\u\3( \2 \3 ) { this.\3 = \3; }/
nnoremap <silent> <M-g> :s/\(public\\|private\\|protected\)\s\(\w\+\)\s\(\w\+\).*;/&\rpublic \2 get\u\3() { return this.\3; }\rpublic void set\u\3( \2 \3 ) { this.\3 = \3; }/<CR>:noh<CR>

" jcommenter.vim: (Alt-C)
autocmd FileType java source /home/keith/.vim/jcommenter.vim
autocmd FileType java map <M-c> :call JCommentWriter()<CR>
autocmd! BufRead,BufNewFile *.jinc setfiletype jsp
autocmd BufNewFile,BufRead *.scss setfiletype css
ca javadoc s/#/\r /g

"vim-pipe!
autocmd FileType javascript let b:vimpipe_command='node -e <(cat)'

" tab completion
inoremap <c-tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>
"inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<cr>
map ,tc :call ToggleTabCompletion()<cr>
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" winmanager.vim <c-w,c-t>
map <c-w><c-t> :WMToggle<cr>
" Java syntax stuff
ab sop System.out.println(  );<Left><Left><Left>
ab nfo log.info(  );<Left><Left><Left>
ab itr for( Iterator i =.iterator(); i.hasNext(); ) {}<Up><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right>
map <C-S-Q> I// <ESC>
"imap {<CR> {<CR>}<Up><End><CR>

"" Make pasting in terminal suck less.
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

"icalendar
autocmd! BufRead,BufNewFile *.ics setfiletype icalendar

"velocity
ab vif #if (  )<CR><BS><CR><BS><CR><BS>#end<UP><UP><UP><LEFT><LEFT>
ab vife #if (  )<CR><BS><CR><BS><CR><BS>#else<CR><BS><CR><BS><CR><BS>#end<UP><UP><UP><UP><UP><UP><LEFT><LEFT>
ab vmo #macro (  )<CR><BS><CR><BS><CR><BS>#end<UP><UP><UP><LEFT><LEFT>

"javascript

ab jfe forEach( , function() { <CR><CR><CR> });<UP><UP><UP><LEFT><LEFT><LEFT>

"JSTL
ab cif <c:if test="${}"></c:if><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"ab cchoose <c:choose><CR><TAB><c:when test="${}"><CR></c:when><CR><c:otherwise><CR></c:otherwise><CR><BS></c:choose><Up><Up><Up><Up><Right><Right><Right><Right><Right><Right><Right><Right><Right>
ab cchoose <c:choose><CR><Tab><c:when test="${}"></c:when><CR><c:otherwise></c:otherwise><CR><Backspace></c:choose><Up><Up><Right><Right><Right><Right><Right><Right><Right><Right><Right>

ab cchoosei <c:choose><c:when test="${}"></c:when><c:otherwise></c:otherwise></c:choose><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

ab cforeach <c:forEach var="" items="${}"><CR></c:forEach><Up><Right><Right><Right><Right>
ab ctrn <trn:message key=''> </trn:message><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" XDoclet
ab xdtf <XDtField:><Left>
ab xdtm <XDtMethod:><Left>
ab xdtc <XDtClass:><Left>

map <c-a-q> I// <esc>j


"ab while( while( ) {}<Up><Right><Right><Right><Right><Right>
"ab for( for( ) {}<Up><Right><Right><Right>
"abbr if( if( ) {}<Up><Right><Right>

set winminheight=0 "allow windows to show 0 lines

" ctrl-j to move down, ctrl-k to move up
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>\|
map <C-L> <C-W>l<C-W>\|
map <C-space> <C-W>_
map <C-W><C-m> <C-W>b<C-W>n<C-W>x<C-W>j<C-W>_

"tabs:
map <C-a-t> :tabnew<CR>
map <C-tab> :tabn<CR>
map <C-s-tab> :tabp<CR>

"spell:
nnoremap <silent> <F6> :setlocal spell!<CR>
" automatic JavaDoc help!!
"amenu PopUp.JavaHelp :!start winhlp32 -k <cword> C:\jdkhelp\JDK13.HLP<cr>
"map <C-H> :!start winhlp32 -k <cword> C:\jdkhelp\JDK13.HLP<cr>

" override ctags command
" let g:ctags_command = "/usr/local/chapstick_java/ct"

" java import stuff for [I
set include=^import
set includeexpr=substitute(v:fname,'\\.','\\','g')

" Care II toolbar icon
"if has("toolbar")
	"an 1.400 ToolBar.-sep8- <Nop>
	"an 1.410 ToolBar.Care2 :!start care2.bat<cr>
"endif

" Always show status bar (even if there's only one window)
set laststatus=2
set guioptions-=m
set guioptions-=T

" Add CRLF option to Tools menu
"an 40.600 &Tools.-SEP4- <Nop>
"an <silent> 40.610 &Tools.CRLF\ A :!crlf A %<CR>
"an <silent> 40.620 &Tools.CRLF\ D :!crlf D %<CR>

" detect *.buf as a SQL file
"augroup filetypedetect
	"au! BufRead,BufNewFile *.buf		setfiletype sql
"augroup END

set vb
set diffopt=filler,iwhite
set nocompatible
set mouse=a

" matchit for JSPs
let g:match_words = '<%:%>'

" javac:
set makeprg=ant\ -quiet\ -emacs\ -find\ build.xml\ compile
"set makeprg=ant\ compile_tests\ -quiet\ -emacs\ -find\ build.xml
nnoremap <silent> <F4> :!. ~/.bashrc; ant jspstage staticstage<CR><CR>

"let g:showmarks_enable=0 "disable showmarks by default
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

"common dir changes
nmap ,cj :cd /usr/local/chapstick_java
nmap ,al :cd /usr/local/alliance
nmap ,cw :cd /usr/local/chapstick_web
nmap ,cm :cd /keith/mvnforum/mvnforum-1.0.0-rc2-src/mvnforum/src
nmap ,ew :e /usr/local/chapstick_web/
nmap ,ej :e /usr/local/chapstick_java/src/com/meetup/
nmap ,eu :e /usr/local/chapstick_util/
nmap ,ei :e /usr/local/chapstick_img/
nmap ,em :e /keith/mvnforum/mvnforum-1.0.0-rc2-src/mvnforum/src/net/myvietnam/mvnplugin/mvnforum/
nmap ,et :e /usr/local/tomcat/work/Standalone/localhost/chapstick/org/apache/jsp/
nmap ,b :! /home/whoward/bounce.sh <CR>
nmap ,c :! ant css <CR>
nmap ,t :! ant stage <CR>
nmap ,e :! ant emails <CR>
nmap ,ej :exe 'node -e ' . expand('%:p:h') . '<CR>'
nmap ,j :! ant js <CR>
" nmap ,r :! ant api_deploy; curl http://localhost:8082/chapstick/py_api/reload?module=meetup.api.oembed;~/bounce_quiet.sh<CR>
nmap ,r :! ant api_deploy; curl http://localhost:8082/chapstick/py_api/reload?module=meetup.api.oembed<CR>
nmap ,ij :! ant jsp static<CR>
nmap ,jj :! ant jsp<CR>
nmap ,a :! ant<CR>
nmap ,z x
nmap ,iz i x
nmap ,tt i <trn:message key="
nmap ,rr i </trn:message>
nmap ,f :! /home/whoward/find.sh 
nmap ,n  :sp /usr/local/meetup/
nmap ,nw  :sp /usr/local/meetup/web/<CR>
nmap ,nj  :sp /usr/local/meetup/static/script/<CR>
nmap ,nc  :sp /usr/local/meetup/static/style/<CR>
"MAKE IT EASY TO UPDATE/RELOAD_vimrc
nmap ,s :source ~/.vimrc
nmap ,v :e ~/.vimrc
nmap ,t :TagbarToggle<CR>
inoremap jk <esc>
inoremap <esc> <nop>
" do diffs against buffer on disk
" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" default to 'marker' fold method
set foldmethod=marker

" icomplete - show overloaded methods
let g:cppcomplete_placeholders=1

" tip 1228 - completion popup selection like other IDEs:
inoremap <silent><Esc>      <C-r>=pumvisible()?"\<lt>C-e>":"\<lt>Esc>"<CR>
inoremap <silent><CR>       <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>CR>"<CR>
inoremap <silent><Down>     <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Down>"<CR>
inoremap <silent><Up>       <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>Up>"<CR>
inoremap <silent><PageDown> <C-r>=pumvisible()?"\<lt>PageDown>\<lt>C-p>\<lt>C-n>":"\<lt>PageDown>"<CR>
inoremap <silent><PageUp>   <C-r>=pumvisible()?"\<lt>PageUp>\<lt>C-p>\<lt>C-n>":"\<lt>PageUp>"<CR> 
inoremap <silent>j          <C-r>=pumvisible()?"\<lt>C-n>":"j"<CR>
inoremap <silent>k          <C-r>=pumvisible()?"\<lt>C-p>":"k"<CR>
" java highlighting stuff
":let java_highlight_java_lang_ids=1
":let java_highlight_functions="style"
":let java_highlight_debug=1
":let java_highlight_all=1
":let java_minlines = 150
":hi link javaParen javaStorageClass
":hi link javaParen1 Label
":hi link javaParen2 javaComment
