LN = ln -fFs
RM = rm -rf
SRCS = $(wildcard dot*)
OBJS = $(subst dot, ${HOME}/, ${SRCS})

all: ${OBJS} ${HOME}/.vim

${HOME}/.vim:
	mkdir ${HOME}/.vim ${HOME}/.vim/undo ${HOME}/.vim/tmp ${HOME}/.vim/colors
	${LN} ${PWD}/solarized.vim ${HOME}/.vim/colors/solarized.vim

${OBJS}:
	${LN} $(subst ${HOME}/, ${PWD}/dot, $@) $@

clean:
	${RM} ${OBJS} ${HOME}/.vim

.PHONY: all clean
