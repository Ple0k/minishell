/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy_strchr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:51:05 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:51:05 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

char	*cy_strchr(const char *s, int c)
{
	size_t	i;
	char	*tmp;

	i = 0;
	tmp = (char *)s;
	while (1)
	{
		if (tmp[i] == c)
			return (&tmp[i]);
		if (tmp[i] == '\0')
			break ;
		i = i + 1;
	}
	return (NULL);
}
