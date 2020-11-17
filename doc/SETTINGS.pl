:- module(_, [], [doccfg]).

:- use_module(library(bundle/bundle_flags), [get_bundle_flag/2]).

:- include(core_docsrc(docpaths)).

output_name := 'ociao'.

filepath := ~ciaofilepath_common.
filepath := at_bundle(ociao, 'lib').
filepath := at_bundle(ociao, 'examples').

doc_structure := 
    'objects/ociao_doc'-[
       'class/class_doc',
       'objects/objects_doc',
       'objects/objects_rt',
       'interface/interface_doc'
    ].

doc_mainopts := no_biblio | no_bugs | no_patches.
doc_compopts := no_biblio | no_bugs | no_patches.

bibfile := ~ciao_bibfile.

% TODO: port this manual
allow_markdown := no.
syntax_highlight := no.
