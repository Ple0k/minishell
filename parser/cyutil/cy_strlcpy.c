/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cy_strlcpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cydubois <cydubois@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/06/02 12:51:32 by cydubois          #+#    #+#             */
/*   Updated: 2025/06/02 12:51:32 by cydubois         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../prser.h"

int	cy_strlcpy(char *dst, char *src, int siz)
{
	int	i;

	i = 0;
	if (siz > 0)
	{
		while (src[i] && i < (siz - 1))
		{
			dst[i] = src[i];
			i = i + 1;
		}
		dst[i] = 0;
	}
	return (cy_strlen(src));
}
// memcpy is to cpy bytes, strlcpy null-terminated string
// strlcpy not much issue with overlapping in strings
// return length is for detection of truncation tipically