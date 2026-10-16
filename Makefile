NAME		= minishell
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
INCLUDES	= -I./includes -I./parser
LIBS		= -lreadline
BUILD_DIR	= build

MAIN_SRC	=	src/main.c

INPUT_DIR	=	src/input
INPUT_SRC	=	$(INPUT_DIR)/input_processing.c \
				$(INPUT_DIR)/input_validation.c

EXEC_DIR	=	src/executor
EXEC_SRC	=	$(EXEC_DIR)/executor.c \
				$(EXEC_DIR)/executor_builtins.c \
				$(EXEC_DIR)/pipes_basic.c \
				$(EXEC_DIR)/heredoc.c \
				$(EXEC_DIR)/command_execution.c \
				$(EXEC_DIR)/pipeline.c \
				$(EXEC_DIR)/redirections.c \
				$(EXEC_DIR)/redirection_utils.c \
				$(EXEC_DIR)/path_expansion.c \
				$(EXEC_DIR)/path.c \
				$(EXEC_DIR)/path_search.c

BUILTIN_DIR	=	src/builtins
BUILTIN_SRC	=	$(BUILTIN_DIR)/echo.c \
				$(BUILTIN_DIR)/cd.c \
				$(BUILTIN_DIR)/cd_path.c \
				$(BUILTIN_DIR)/cd_utils.c \
				$(BUILTIN_DIR)/pwd.c \
				$(BUILTIN_DIR)/export.c \
				$(BUILTIN_DIR)/export_display.c \
				$(BUILTIN_DIR)/unset.c \
				$(BUILTIN_DIR)/env.c \
				$(BUILTIN_DIR)/exit.c

SIGNAL_DIR	=	src/signals
SIGNAL_SRC	=	$(SIGNAL_DIR)/signals.c \
				$(SIGNAL_DIR)/signal_heredoc.c

ENV_DIR		=	src/environment
ENV_SRC		=	$(ENV_DIR)/env_core.c \
				$(ENV_DIR)/env_modify.c

STRING_DIR	=	src/string
STRING_SRC	=	$(STRING_DIR)/string_basic.c \
				$(STRING_DIR)/string_copy.c \
				$(STRING_DIR)/ft_strstr.c \
				$(STRING_DIR)/ft_atoi.c \
				$(STRING_DIR)/ft_itoa.c \
				$(STRING_DIR)/ft_split_utils.c \
				$(STRING_DIR)/ft_split.c

MEMORY_DIR	=	src/memory
MEMORY_SRC	=	$(MEMORY_DIR)/array_utils.c \
				$(MEMORY_DIR)/cleanup.c

SRCS		=	$(MAIN_SRC) \
				$(INPUT_SRC) \
				$(EXEC_SRC) \
				$(BUILTIN_SRC) \
				$(SIGNAL_SRC) \
				$(ENV_SRC) \
				$(STRING_SRC) \
				$(MEMORY_SRC)

PARSER_DIR	=	parser
PARS_DIR	=	$(PARSER_DIR)/pars
CYUTIL_DIR	=	$(PARSER_DIR)/cyutil

PARSER_SRC  =	$(PARS_DIR)/cy0_check_char.c \
				$(PARS_DIR)/cy0_check_quotes.c \
				$(PARS_DIR)/cy0_freeer.c \
				$(PARS_DIR)/cy1_1_remove_space_nodes.c \
				$(PARS_DIR)/cy1_input_list.c \
				$(PARS_DIR)/cy1_input_list1.c \
				$(PARS_DIR)/cy1_input_list2.c \
				$(PARS_DIR)/cy2_1_fill_builtin.c \
				$(PARS_DIR)/cy2_2_fill_redir.c \
				$(PARS_DIR)/cy2_2_fill_redir2.c \
				$(PARS_DIR)/cy2_3_free_first_node.c \
				$(PARS_DIR)/cy2_convert_cmd.c \
				$(PARS_DIR)/cy2_convert_cmd2.c \
				$(PARS_DIR)/cy2_convert_cmd3.c \
				$(PARS_DIR)/cy3_2_dollar.c \
				$(PARS_DIR)/cy3_2_dollar2.c \
				$(PARS_DIR)/cy3_2_dollar_alone.c \
				$(PARS_DIR)/cy3_2_dollar_bang.c \
				$(PARS_DIR)/cy3_2_dollar_braces.c \
				$(PARS_DIR)/cy3_2_dollar_braces2.c \
				$(PARS_DIR)/cy3_2_dollar_braces3.c \
				$(PARS_DIR)/cy3_2_dollar_word.c \
				$(PARS_DIR)/cy3_2_dollar_word2.c \
				$(PARS_DIR)/cy3_2_dollar_word3.c \
				$(PARS_DIR)/cy3_subti_check.c \
				$(PARS_DIR)/cy3_subti_fuse.c \
				$(PARS_DIR)/cy4_1wrong_char.c \
				$(PARS_DIR)/cy4_2wrong_redir.c \
				$(PARS_DIR)/cy4_3wrong_pipe.c \
				$(PARS_DIR)/cy4_4wrong_redir_log.c \
				$(PARS_DIR)/cy4_5wrong_pipe_log.c \
				$(PARS_DIR)/cy4_6wrong_pipe_alone.c \
				$(CYUTIL_DIR)/cy_memset.c \
				$(CYUTIL_DIR)/cy_strchr.c \
				$(CYUTIL_DIR)/cy_strcmp.c \
				$(CYUTIL_DIR)/cy_strdup.c \
				$(CYUTIL_DIR)/cy_strlcat.c \
				$(CYUTIL_DIR)/cy_strlcpy.c \
				$(CYUTIL_DIR)/cy_strlen.c \
				$(CYUTIL_DIR)/cy_true_strdup.c

PARSER_LIB_SRC = $(filter-out $(PARSER_DIR)/main.c, $(PARSER_SRC))

ALL_SRC		= $(SRCS) $(PARSER_LIB_SRC)
ALL_OBJS	= $(patsubst %.c, $(BUILD_DIR)/%.o, $(ALL_SRC))

all: $(NAME)

$(NAME): $(ALL_OBJS)
	$(CC) $(CFLAGS) $(ALL_OBJS) -o $(NAME) $(LIBS)

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re norm lines test