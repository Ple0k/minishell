/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:51:15 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:51:15 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

char	*cy_strdup(char *s, int start, int end)
{
	char	*res;
	int		ls;

	res = NULL;
	if (start < 0 && end < 0)
	{
		start = start + INT_MAX + 1 + 1;
		end = -end - 1;
	}
	else if (start >= 0 && end < 0)
	{
		start = start + 1;
		end = -end - 1;
	}
	else if (start < 0 && end > 0)
		start = start + INT_MAX + 1;
	ls = end - start + 1;
	res = malloc((ls + 1) * sizeof (char));
	if (res == 0)
		return (0);
	cy_strlcpy(res, &s[start], ls + 1);
	return (res);
}
// duplicates a null-terminated string by allocating memory for a new copy
// of the string and returning a pointer to it