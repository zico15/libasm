SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_write.s  ft_read.s 
#  
OBJS		=	$(SRCS:.s=.o)
BONUS_SRCS	=	ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s

BONUS_OBJS	=	$(BONUS_SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f elf64
#-arch x86_64 mac
FLAGS 		=	 #-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test
TEST_BONUS	=	test_bonus


%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)


clean:
				rm -rf $(OBJS) $(BONUS_OBJS)

fclean:			clean
				rm -rf $(NAME) $(BONUS) $(TEST) $(TEST_BONUS)

re:				fclean $(NAME)

bonus:			$(OBJS) $(BONUS_OBJS)
				ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)

t:			$(NAME)
				gcc -o $(TEST) main.c libasm.a -no-pie
				clear && valgrind ./$(TEST) < Makefile

tb:		bonus
				gcc -o $(TEST_BONUS) main_bonus.c libasm.a -no-pie
				clear &&  valgrind ./$(TEST_BONUS) < Makefile

.PHONY:			clean fclean re test bonus test_bonus