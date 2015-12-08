LN = ln -fFs
RM = rm -rf
SRCS = $(wildcard dot*)
OBJS = $(subst dot, ${HOME}/, ${SRCS})

all: ${OBJS} ${HOME}/.vim

${HOME}/.vim:
	mkdir ${HOME}/.vim ${HOME}/.vim/tmp ${HOME}/.vim/undo ${HOME}/.vim/colors
	git clone https://github.com/altercation/vim-colors-solarized
	cp vim-colors-solarized/colors/solarized.vim ${HOME}/.vim/colors/ 
	${RM} vim-colors-solarized

${OBJS}:
	${LN} $(subst ${HOME}/, ${PWD}/dot, $@) $@

clean:
	${RM} ${OBJS} ${HOME}/.vim

.PHONY: all clean
