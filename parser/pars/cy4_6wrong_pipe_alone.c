/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy4_6wrong_pipe_alone.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:53:53 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:53:53 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

int	check_last_cmd_args_null(t_cmd *cmd)
{
	if (!cmd)
		return (0);
	while (cmd->next)
		cmd = cmd->next;
	if (cmd->args == NULL)
	{
		printf("please write a full valid command, complete any pipe\n");
		return (1);
	}
	return (0);
}
