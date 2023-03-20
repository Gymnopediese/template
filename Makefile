# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albaud <albaud@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/18 13:07:44 by albaud            #+#    #+#              #
#    Updated: 2023/03/20 10:37:15 by albaud           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


SRCS 		= main.c
OBJS 		= ${SRCS:.c=.o}
LIBS 		= libia/koflibc/libft.a libia/p/p.a libia/mlib/mlib.a libia/mlib/vlib/vlib.a libia/libia.a libia/minilibx_macos/libmlx.a
NAME 		= main
CC			= gcc
FRAMEWORK	= -framework OpenGL -framework AppKit
CFLAGS		= -Wall -Wextra -Werror -g

.c.o 	:
		${CC} ${CFLAGS} -I minilibx_macos -c $< -o ${<:.c=.o}
		
all 	: $(NAME)

$(NAME)	: ${OBJS} ${LIBS}
		${CC} ${CFLAGS} -o ${NAME} ${FRAMEWORK} ${OBJS} ${LIBS}
${LIBS} :

clean	:
		rm -f ${OBJS}

fclean	:	clean
		rm -f ${NAME} 

re		: fclean all

c 		:
		find *.c | tr '\n' ' '

make	:
		make -C libia && make

makere	:
		make re -C libia && make re

run		: make
		./${NAME}

test	: make
		${CC} ${CFLAGS} -o t ${FRAMEWORK} test.c ${LIBS} ${LIBSS}
		./t