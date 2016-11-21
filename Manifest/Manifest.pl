:- bundle(ociao).
version('1.0').
depends([
    core-[version>='1.15']
]).
alias_paths([
    library = 'lib',
    library = 'library',
    ociao_examples = 'examples'
]).
lib('lib').
lib('library').
manual('ociao', [main='doc/SETTINGS.pl']).
